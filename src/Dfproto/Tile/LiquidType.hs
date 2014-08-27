{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Dfproto.Tile.LiquidType (LiquidType(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data LiquidType = WATER
                | MAGMA
                deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable LiquidType
 
instance Prelude'.Bounded LiquidType where
  minBound = WATER
  maxBound = MAGMA
 
instance P'.Default LiquidType where
  defaultValue = WATER
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe LiquidType
toMaybe'Enum 0 = Prelude'.Just WATER
toMaybe'Enum 1 = Prelude'.Just MAGMA
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum LiquidType where
  fromEnum WATER = 0
  fromEnum MAGMA = 1
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Dfproto.Tile.LiquidType") . toMaybe'Enum
  succ WATER = MAGMA
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Dfproto.Tile.LiquidType"
  pred MAGMA = WATER
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Dfproto.Tile.LiquidType"
 
instance P'.Wire LiquidType where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB LiquidType
 
instance P'.MessageAPI msg' (msg' -> LiquidType) LiquidType where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum LiquidType where
  reflectEnum = [(0, "WATER", WATER), (1, "MAGMA", MAGMA)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".dfproto.Tile.LiquidType") [] ["Dfproto", "Tile"] "LiquidType")
      ["Dfproto", "Tile", "LiquidType.hs"]
      [(0, "WATER"), (1, "MAGMA")]