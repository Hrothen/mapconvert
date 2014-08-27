module TileColor where

import Codec.Picture (PixelRGB8(..))

import Dfproto.Tile
import Dfproto.Tile.TileType
import Dfproto.Tile.LiquidType
import Dfproto.Tile.TileMaterialType

lookupTile :: Tile -> PixelRGB8
lookupTile t = case type' t of
    EMPTY         -> airBlue
    FLOOR         -> floorColor
    BOULDER       -> floorColor
    PEBBLES       -> floorColor
    WALL          -> wallColor 
    FORTIFICATION -> wallColor 
    STAIR_UP      -> stairPink
    STAIR_DOWN    -> stairPink
    STAIR_UPDOWN  -> stairPink
    RAMP          -> rampYellow
    RAMP_TOP      -> rampYellow
    BROOK_BED     -> brookBrown
    BROOK_TOP     -> brookBlue
    TREE          -> treeBrown
    SAPLING       -> floorColor
    SHRUB         -> floorColor
    ENDLESS_PIT   -> pitGrey

  where

    floorColor = case liquid_type t of
                    Just WATER -> waterBlue
                    Just MAGMA -> magmaRed
                    Nothing    -> white
    wallColor  = case tile_material t of
                    Just SOIL          -> dirtBrown
                    Just STONE         -> rockGrey
                    Just MINERAL       -> rockGrey
                    Just LAVA_STONE    -> hotRockGrey
                    Just FROZEN_LIQUID -> iceBlue
                    Just CONSTRUCTION  -> wallGreen
                    _ -> purple


    airBlue     = PixelRGB8 104 242 240
    brookBlue   = PixelRGB8 59  145 219
    waterBlue   = PixelRGB8 0   21  255
    iceBlue     = PixelRGB8 0   252 210
    brookBrown  = PixelRGB8 89  54  5
    treeBrown   = PixelRGB8 242 189 114
    dirtBrown   = PixelRGB8 245 233 166
    pitGrey     = PixelRGB8 204 204 204
    rockGrey    = PixelRGB8 117 117 117
    hotRockGrey = PixelRGB8 59  59  59
    wallGreen   = PixelRGB8 34  237 12
    magmaRed    = PixelRGB8 255 42  0
    stairPink   = PixelRGB8 245 71  213
    rampYellow  = PixelRGB8 250 250 0
    purple      = PixelRGB8 150 14  132
    white       = PixelRGB8 255 255 255


black :: PixelRGB8
black = PixelRGB8 0 0 0
