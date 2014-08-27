module Main where

import Prelude hiding (mapM_)
import Data.Foldable (mapM_)

import Control.Monad (sequence)
import Control.Monad.ST.Safe (runST)
import Data.Word (Word32(..))
import Data.Either (either)
import Data.Tuple (fst)
import Data.List (isInfixOf)

import Options.Applicative

import Control.Monad.Primitive (PrimMonad(..), PrimState(..))

import Text.ProtocolBuffers.WireMessage (messageGet, runGetOnLazy)
import Text.ProtocolBuffers.Get (Result(..), Get(..), getWord32le, runGet)

import Codec.Picture (Pixel, PixelRGB8(..), Image(..),
                      savePngImage, generateImage, writePng, writePixel)
import Codec.Picture.Types (MutableImage(..), createMutableImage, unsafeFreezeImage)

import qualified Data.ByteString.Lazy as BL
import qualified Data.Vector as V
import qualified Data.Map as M
import Data.Sequence (index)
import System.Directory (createDirectoryIfMissing)

import Dfproto.Map
import Dfproto.Block
import Dfproto.Tile

import TileColor


data Target = DorfCAD | PictureFort

data Options = Options { inFile  :: String 
                       , outDir :: String }

options :: Parser Options
options = Options
    <$> argument str (metavar "FILE")
    <*> argument str (metavar "DIRECTORY")

main :: IO ()
main = execParser opts >>= go
  where
    opts = info (helper <*> options)
        ( fullDesc
       <> progDesc "convert dfhack exported maps into png images" )


go :: Options -> IO ()
go opts = do
    bs <- BL.readFile fin
    let imgs' = getMapData bs >>= return . buildImagesM
    case imgs' of
        Left err -> print err
        Right imgs -> do
            dir <- getDir $ outDir opts
            let z = V.length imgs
                fout' = dir ++ fout
                fouts = if z == 1
                        then V.singleton $ fout' ++ ".png"
                        else V.generate z (\i -> fout' ++ show i ++ ".png")
            V.mapM_ (uncurry writePng) $ V.zip fouts imgs
  where
    fin = inFile opts
    -- base outfile name without numbering
    fout = if ".dfmap" `isInfixOf` fin
           then takeWhile (/='.') fin
           else fin
    -- need to do this because doesDirectoryExist returns False for ""
    getDir :: String -> IO String
    getDir d = if null d
               then return ""
               else createDirectoryIfMissing False d >> return d


type Dfmap = (Map, V.Vector Block)
type Tmap = M.Map Tile PixelRGB8


dfHeader :: Word32
dfHeader = 0x50414DDF

checkHeader :: BL.ByteString -> Either String BL.ByteString
checkHeader f = case runGetOnLazy getWord32le f of
    Left   err   -> Left err
    Right (h,bs) -> if h == dfHeader
                    then Right bs
                    else Left "wrong file header, something is wrong with dfhack"


getMap :: BL.ByteString -> Either String (Map, BL.ByteString)
getMap f | BL.length f == 0 = Left "file terminated before parsing finished"
         | otherwise = messageGet f


getBlocks :: BL.ByteString -> Either String (V.Vector Block)
getBlocks f | BL.length f == 0 = Left "file terminated before parsing finished"
            | otherwise = V.sequence $ V.fromList $ getBlocks' f


getBlocks' :: BL.ByteString -> [Either String Block]
getBlocks' f | BL.length f == 0 = []
             | otherwise = case messageGet f of
                Right (b,f') -> Right b : getBlocks' f'
                Left l -> [Left l]


getMapData :: BL.ByteString -> Either String Dfmap
getMapData f = do
    f'      <- checkHeader f
    (m,f'') <- getMap f'
    bs      <- getBlocks f''
    return (m,bs)


-- buildTileDict :: Dfmap -> Tmap
-- buildTileDict (m,_) = undefined

breakIntoLayers :: Dfmap -> V.Vector (V.Vector Block)
breakIntoLayers (m,bls) = case fromIntegral (z_size m) of
                            1  -> V.singleton bls
                            zs -> V.generate zs (\i ->
                                V.slice (i*len) len bls)
  where len = fromIntegral $ x_size m * (y_size m)

-- buildImages :: Dfmap -> V.Vector (Image PixelRGB8)
-- buildImages m = V.map (buildImage xs ys . tileMap) $ breakIntoLayers m
-- -- buildImages m = V.mapM (buildImage xs ys . tileMap) $ breakIntoLayers m
--   where
--     tileMap = tileToPixel dict (xs,ys)
--     dict = buildTileDict m
--     xs = 16 * (fromIntegral $ x_size $ fst m)
--     ys = 16 * (fromIntegral $ y_size $ fst m)


buildImagesM :: Dfmap -> V.Vector (Image PixelRGB8)
buildImagesM m = V.map (buildImageM m) $ breakIntoLayers m


-- buildImage :: Int -> Int -> (Int -> Int -> PixelRGB8) -> Image PixelRGB8
-- buildImage x y p = generateImage p x y
-- buildImage x y p = withImage x y p

buildImageM :: Dfmap -> V.Vector Block -> Image PixelRGB8
buildImageM m bls = runST $ do
    img <- createMutableImage xs ys black 
    V.forM_ bls (writeBlock m img)
    unsafeFreezeImage img
  where
    xs = 16 * fromIntegral (x_size $ fst m)
    ys = 16 * fromIntegral (y_size $ fst m)


writeBlock :: PrimMonad m => Dfmap ->
                             MutableImage (PrimState m) PixelRGB8 ->
                             Block ->
                             m ()
writeBlock m img = mapM_ t2px . tile
  where
    t2px t = writePixel img tx ty px
      where
        tx = 16 * fromIntegral (Dfproto.Tile.x t)
        ty = 16 * fromIntegral (Dfproto.Tile.y t)
        px = lookupTile t

-- tileToPixel :: Tmap -> (Int,Int) -> V.Vector Block -> Int -> Int -> PixelRGB8
-- tileToPixel m (bx,by) bls x y = M.findWithDefault err t m
--   where
--     -- this is really dumb, but JuicyPixels only supports monadic image
--     -- creation if the type is a PrimMonad, so instead we'll have a
--     -- fallback color
--     t = tile block `index` (y' * 16 + x')
--     block = bls V.! (bly * bx + blx)
--     (blx,x') = x `divMod` 16
--     (bly,y') = y `divMod` 16
--     err = PixelRGB8 0 0 0
