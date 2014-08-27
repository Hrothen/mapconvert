{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Dfproto.Tile.TileType (TileType(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data TileType = EMPTY
              | FLOOR
              | BOULDER
              | PEBBLES
              | WALL
              | FORTIFICATION
              | STAIR_UP
              | STAIR_DOWN
              | STAIR_UPDOWN
              | RAMP
              | RAMP_TOP
              | BROOK_BED
              | BROOK_TOP
              | TREE
              | SAPLING
              | SHRUB
              | ENDLESS_PIT
              deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable TileType
 
instance Prelude'.Bounded TileType where
  minBound = EMPTY
  maxBound = ENDLESS_PIT
 
instance P'.Default TileType where
  defaultValue = EMPTY
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe TileType
toMaybe'Enum 0 = Prelude'.Just EMPTY
toMaybe'Enum 1 = Prelude'.Just FLOOR
toMaybe'Enum 2 = Prelude'.Just BOULDER
toMaybe'Enum 3 = Prelude'.Just PEBBLES
toMaybe'Enum 4 = Prelude'.Just WALL
toMaybe'Enum 5 = Prelude'.Just FORTIFICATION
toMaybe'Enum 6 = Prelude'.Just STAIR_UP
toMaybe'Enum 7 = Prelude'.Just STAIR_DOWN
toMaybe'Enum 8 = Prelude'.Just STAIR_UPDOWN
toMaybe'Enum 9 = Prelude'.Just RAMP
toMaybe'Enum 10 = Prelude'.Just RAMP_TOP
toMaybe'Enum 11 = Prelude'.Just BROOK_BED
toMaybe'Enum 12 = Prelude'.Just BROOK_TOP
toMaybe'Enum 13 = Prelude'.Just TREE
toMaybe'Enum 14 = Prelude'.Just SAPLING
toMaybe'Enum 15 = Prelude'.Just SHRUB
toMaybe'Enum 16 = Prelude'.Just ENDLESS_PIT
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum TileType where
  fromEnum EMPTY = 0
  fromEnum FLOOR = 1
  fromEnum BOULDER = 2
  fromEnum PEBBLES = 3
  fromEnum WALL = 4
  fromEnum FORTIFICATION = 5
  fromEnum STAIR_UP = 6
  fromEnum STAIR_DOWN = 7
  fromEnum STAIR_UPDOWN = 8
  fromEnum RAMP = 9
  fromEnum RAMP_TOP = 10
  fromEnum BROOK_BED = 11
  fromEnum BROOK_TOP = 12
  fromEnum TREE = 13
  fromEnum SAPLING = 14
  fromEnum SHRUB = 15
  fromEnum ENDLESS_PIT = 16
  toEnum = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Dfproto.Tile.TileType") . toMaybe'Enum
  succ EMPTY = FLOOR
  succ FLOOR = BOULDER
  succ BOULDER = PEBBLES
  succ PEBBLES = WALL
  succ WALL = FORTIFICATION
  succ FORTIFICATION = STAIR_UP
  succ STAIR_UP = STAIR_DOWN
  succ STAIR_DOWN = STAIR_UPDOWN
  succ STAIR_UPDOWN = RAMP
  succ RAMP = RAMP_TOP
  succ RAMP_TOP = BROOK_BED
  succ BROOK_BED = BROOK_TOP
  succ BROOK_TOP = TREE
  succ TREE = SAPLING
  succ SAPLING = SHRUB
  succ SHRUB = ENDLESS_PIT
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Dfproto.Tile.TileType"
  pred FLOOR = EMPTY
  pred BOULDER = FLOOR
  pred PEBBLES = BOULDER
  pred WALL = PEBBLES
  pred FORTIFICATION = WALL
  pred STAIR_UP = FORTIFICATION
  pred STAIR_DOWN = STAIR_UP
  pred STAIR_UPDOWN = STAIR_DOWN
  pred RAMP = STAIR_UPDOWN
  pred RAMP_TOP = RAMP
  pred BROOK_BED = RAMP_TOP
  pred BROOK_TOP = BROOK_BED
  pred TREE = BROOK_TOP
  pred SAPLING = TREE
  pred SHRUB = SAPLING
  pred ENDLESS_PIT = SHRUB
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Dfproto.Tile.TileType"
 
instance P'.Wire TileType where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB TileType
 
instance P'.MessageAPI msg' (msg' -> TileType) TileType where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum TileType where
  reflectEnum
   = [(0, "EMPTY", EMPTY), (1, "FLOOR", FLOOR), (2, "BOULDER", BOULDER), (3, "PEBBLES", PEBBLES), (4, "WALL", WALL),
      (5, "FORTIFICATION", FORTIFICATION), (6, "STAIR_UP", STAIR_UP), (7, "STAIR_DOWN", STAIR_DOWN),
      (8, "STAIR_UPDOWN", STAIR_UPDOWN), (9, "RAMP", RAMP), (10, "RAMP_TOP", RAMP_TOP), (11, "BROOK_BED", BROOK_BED),
      (12, "BROOK_TOP", BROOK_TOP), (13, "TREE", TREE), (14, "SAPLING", SAPLING), (15, "SHRUB", SHRUB),
      (16, "ENDLESS_PIT", ENDLESS_PIT)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".dfproto.Tile.TileType") [] ["Dfproto", "Tile"] "TileType")
      ["Dfproto", "Tile", "TileType.hs"]
      [(0, "EMPTY"), (1, "FLOOR"), (2, "BOULDER"), (3, "PEBBLES"), (4, "WALL"), (5, "FORTIFICATION"), (6, "STAIR_UP"),
       (7, "STAIR_DOWN"), (8, "STAIR_UPDOWN"), (9, "RAMP"), (10, "RAMP_TOP"), (11, "BROOK_BED"), (12, "BROOK_TOP"), (13, "TREE"),
       (14, "SAPLING"), (15, "SHRUB"), (16, "ENDLESS_PIT")]