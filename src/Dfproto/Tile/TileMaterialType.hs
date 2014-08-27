{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Dfproto.Tile.TileMaterialType (TileMaterialType(..)) where
import Prelude ((+), (/), (.))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
 
data TileMaterialType = AIR
                      | SOIL
                      | STONE
                      | FEATURE
                      | LAVA_STONE
                      | MINERAL
                      | FROZEN_LIQUID
                      | CONSTRUCTION
                      | GRASS_LIGHT
                      | GRASS_DARK
                      | GRASS_DRY
                      | GRASS_DEAD
                      | HFS
                      | CAMPFIRE
                      | FIRE
                      | ASHES
                      | MAGMA_TYPE
                      | DRIFTWOOD
                      | POOL
                      | BROOK
                      | RIVER
                      deriving (Prelude'.Read, Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable TileMaterialType
 
instance Prelude'.Bounded TileMaterialType where
  minBound = AIR
  maxBound = RIVER
 
instance P'.Default TileMaterialType where
  defaultValue = AIR
 
toMaybe'Enum :: Prelude'.Int -> P'.Maybe TileMaterialType
toMaybe'Enum 0 = Prelude'.Just AIR
toMaybe'Enum 1 = Prelude'.Just SOIL
toMaybe'Enum 2 = Prelude'.Just STONE
toMaybe'Enum 3 = Prelude'.Just FEATURE
toMaybe'Enum 4 = Prelude'.Just LAVA_STONE
toMaybe'Enum 5 = Prelude'.Just MINERAL
toMaybe'Enum 6 = Prelude'.Just FROZEN_LIQUID
toMaybe'Enum 7 = Prelude'.Just CONSTRUCTION
toMaybe'Enum 8 = Prelude'.Just GRASS_LIGHT
toMaybe'Enum 9 = Prelude'.Just GRASS_DARK
toMaybe'Enum 10 = Prelude'.Just GRASS_DRY
toMaybe'Enum 11 = Prelude'.Just GRASS_DEAD
toMaybe'Enum 12 = Prelude'.Just HFS
toMaybe'Enum 13 = Prelude'.Just CAMPFIRE
toMaybe'Enum 14 = Prelude'.Just FIRE
toMaybe'Enum 15 = Prelude'.Just ASHES
toMaybe'Enum 16 = Prelude'.Just MAGMA_TYPE
toMaybe'Enum 17 = Prelude'.Just DRIFTWOOD
toMaybe'Enum 18 = Prelude'.Just POOL
toMaybe'Enum 19 = Prelude'.Just BROOK
toMaybe'Enum 20 = Prelude'.Just RIVER
toMaybe'Enum _ = Prelude'.Nothing
 
instance Prelude'.Enum TileMaterialType where
  fromEnum AIR = 0
  fromEnum SOIL = 1
  fromEnum STONE = 2
  fromEnum FEATURE = 3
  fromEnum LAVA_STONE = 4
  fromEnum MINERAL = 5
  fromEnum FROZEN_LIQUID = 6
  fromEnum CONSTRUCTION = 7
  fromEnum GRASS_LIGHT = 8
  fromEnum GRASS_DARK = 9
  fromEnum GRASS_DRY = 10
  fromEnum GRASS_DEAD = 11
  fromEnum HFS = 12
  fromEnum CAMPFIRE = 13
  fromEnum FIRE = 14
  fromEnum ASHES = 15
  fromEnum MAGMA_TYPE = 16
  fromEnum DRIFTWOOD = 17
  fromEnum POOL = 18
  fromEnum BROOK = 19
  fromEnum RIVER = 20
  toEnum
   = P'.fromMaybe (Prelude'.error "hprotoc generated code: toEnum failure for type Dfproto.Tile.TileMaterialType") . toMaybe'Enum
  succ AIR = SOIL
  succ SOIL = STONE
  succ STONE = FEATURE
  succ FEATURE = LAVA_STONE
  succ LAVA_STONE = MINERAL
  succ MINERAL = FROZEN_LIQUID
  succ FROZEN_LIQUID = CONSTRUCTION
  succ CONSTRUCTION = GRASS_LIGHT
  succ GRASS_LIGHT = GRASS_DARK
  succ GRASS_DARK = GRASS_DRY
  succ GRASS_DRY = GRASS_DEAD
  succ GRASS_DEAD = HFS
  succ HFS = CAMPFIRE
  succ CAMPFIRE = FIRE
  succ FIRE = ASHES
  succ ASHES = MAGMA_TYPE
  succ MAGMA_TYPE = DRIFTWOOD
  succ DRIFTWOOD = POOL
  succ POOL = BROOK
  succ BROOK = RIVER
  succ _ = Prelude'.error "hprotoc generated code: succ failure for type Dfproto.Tile.TileMaterialType"
  pred SOIL = AIR
  pred STONE = SOIL
  pred FEATURE = STONE
  pred LAVA_STONE = FEATURE
  pred MINERAL = LAVA_STONE
  pred FROZEN_LIQUID = MINERAL
  pred CONSTRUCTION = FROZEN_LIQUID
  pred GRASS_LIGHT = CONSTRUCTION
  pred GRASS_DARK = GRASS_LIGHT
  pred GRASS_DRY = GRASS_DARK
  pred GRASS_DEAD = GRASS_DRY
  pred HFS = GRASS_DEAD
  pred CAMPFIRE = HFS
  pred FIRE = CAMPFIRE
  pred ASHES = FIRE
  pred MAGMA_TYPE = ASHES
  pred DRIFTWOOD = MAGMA_TYPE
  pred POOL = DRIFTWOOD
  pred BROOK = POOL
  pred RIVER = BROOK
  pred _ = Prelude'.error "hprotoc generated code: pred failure for type Dfproto.Tile.TileMaterialType"
 
instance P'.Wire TileMaterialType where
  wireSize ft' enum = P'.wireSize ft' (Prelude'.fromEnum enum)
  wirePut ft' enum = P'.wirePut ft' (Prelude'.fromEnum enum)
  wireGet 14 = P'.wireGetEnum toMaybe'Enum
  wireGet ft' = P'.wireGetErr ft'
  wireGetPacked 14 = P'.wireGetPackedEnum toMaybe'Enum
  wireGetPacked ft' = P'.wireGetErr ft'
 
instance P'.GPB TileMaterialType
 
instance P'.MessageAPI msg' (msg' -> TileMaterialType) TileMaterialType where
  getVal m' f' = f' m'
 
instance P'.ReflectEnum TileMaterialType where
  reflectEnum
   = [(0, "AIR", AIR), (1, "SOIL", SOIL), (2, "STONE", STONE), (3, "FEATURE", FEATURE), (4, "LAVA_STONE", LAVA_STONE),
      (5, "MINERAL", MINERAL), (6, "FROZEN_LIQUID", FROZEN_LIQUID), (7, "CONSTRUCTION", CONSTRUCTION),
      (8, "GRASS_LIGHT", GRASS_LIGHT), (9, "GRASS_DARK", GRASS_DARK), (10, "GRASS_DRY", GRASS_DRY), (11, "GRASS_DEAD", GRASS_DEAD),
      (12, "HFS", HFS), (13, "CAMPFIRE", CAMPFIRE), (14, "FIRE", FIRE), (15, "ASHES", ASHES), (16, "MAGMA_TYPE", MAGMA_TYPE),
      (17, "DRIFTWOOD", DRIFTWOOD), (18, "POOL", POOL), (19, "BROOK", BROOK), (20, "RIVER", RIVER)]
  reflectEnumInfo _
   = P'.EnumInfo (P'.makePNF (P'.pack ".dfproto.Tile.TileMaterialType") [] ["Dfproto", "Tile"] "TileMaterialType")
      ["Dfproto", "Tile", "TileMaterialType.hs"]
      [(0, "AIR"), (1, "SOIL"), (2, "STONE"), (3, "FEATURE"), (4, "LAVA_STONE"), (5, "MINERAL"), (6, "FROZEN_LIQUID"),
       (7, "CONSTRUCTION"), (8, "GRASS_LIGHT"), (9, "GRASS_DARK"), (10, "GRASS_DRY"), (11, "GRASS_DEAD"), (12, "HFS"),
       (13, "CAMPFIRE"), (14, "FIRE"), (15, "ASHES"), (16, "MAGMA_TYPE"), (17, "DRIFTWOOD"), (18, "POOL"), (19, "BROOK"),
       (20, "RIVER")]