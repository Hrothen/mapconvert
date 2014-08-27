{-# LANGUAGE BangPatterns, DeriveDataTypeable, FlexibleInstances, MultiParamTypeClasses #-}
module Dfproto.Tile (Tile(..)) where
import Prelude ((+), (/))
import qualified Prelude as Prelude'
import qualified Data.Typeable as Prelude'
import qualified Data.Data as Prelude'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Dfproto.Tile.LiquidType as Dfproto.Tile (LiquidType)
import qualified Dfproto.Tile.TileMaterialType as Dfproto.Tile (TileMaterialType)
import qualified Dfproto.Tile.TileType as Dfproto.Tile (TileType)
 
data Tile = Tile{x :: !P'.Word32, y :: !P'.Word32, type' :: !Dfproto.Tile.TileType,
                 tile_material :: !(P'.Maybe Dfproto.Tile.TileMaterialType), material_index :: !(P'.Maybe P'.Word32),
                 material_type :: !(P'.Maybe P'.Word32), liquid_type :: !(P'.Maybe Dfproto.Tile.LiquidType),
                 flow_size :: !(P'.Maybe P'.Word32)}
          deriving (Prelude'.Show, Prelude'.Eq, Prelude'.Ord, Prelude'.Typeable, Prelude'.Data)
 
instance P'.Mergeable Tile where
  mergeAppend (Tile x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8) (Tile y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8)
   = Tile (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
 
instance P'.Default Tile where
  defaultValue
   = Tile P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
 
instance P'.Wire Tile where
  wireSize ft' self'@(Tile x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 13 x'1 + P'.wireSizeReq 1 13 x'2 + P'.wireSizeReq 1 14 x'3 + P'.wireSizeOpt 1 14 x'4 +
             P'.wireSizeOpt 1 13 x'5
             + P'.wireSizeOpt 1 13 x'6
             + P'.wireSizeOpt 1 14 x'7
             + P'.wireSizeOpt 1 13 x'8)
  wirePut ft' self'@(Tile x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 8 13 x'1
             P'.wirePutReq 16 13 x'2
             P'.wirePutReq 24 14 x'3
             P'.wirePutOpt 32 14 x'4
             P'.wirePutOpt 40 13 x'5
             P'.wirePutOpt 48 13 x'6
             P'.wirePutOpt 56 14 x'7
             P'.wirePutOpt 64 13 x'8
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             8 -> Prelude'.fmap (\ !new'Field -> old'Self{x = new'Field}) (P'.wireGet 13)
             16 -> Prelude'.fmap (\ !new'Field -> old'Self{y = new'Field}) (P'.wireGet 13)
             24 -> Prelude'.fmap (\ !new'Field -> old'Self{type' = new'Field}) (P'.wireGet 14)
             32 -> Prelude'.fmap (\ !new'Field -> old'Self{tile_material = Prelude'.Just new'Field}) (P'.wireGet 14)
             40 -> Prelude'.fmap (\ !new'Field -> old'Self{material_index = Prelude'.Just new'Field}) (P'.wireGet 13)
             48 -> Prelude'.fmap (\ !new'Field -> old'Self{material_type = Prelude'.Just new'Field}) (P'.wireGet 13)
             56 -> Prelude'.fmap (\ !new'Field -> old'Self{liquid_type = Prelude'.Just new'Field}) (P'.wireGet 14)
             64 -> Prelude'.fmap (\ !new'Field -> old'Self{flow_size = Prelude'.Just new'Field}) (P'.wireGet 13)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> Tile) Tile where
  getVal m' f' = f' m'
 
instance P'.GPB Tile
 
instance P'.ReflectDescriptor Tile where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [8, 16, 24]) (P'.fromDistinctAscList [8, 16, 24, 32, 40, 48, 56, 64])
  reflectDescriptorInfo _
   = Prelude'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".dfproto.Tile\", haskellPrefix = [], parentModule = [MName \"Dfproto\"], baseName = MName \"Tile\"}, descFilePath = [\"Dfproto\",\"Tile.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.x\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"x\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 8}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.y\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"y\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 16}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.type\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"type'\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 24}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".dfproto.Tile.TileType\", haskellPrefix = [], parentModule = [MName \"Dfproto\",MName \"Tile\"], baseName = MName \"TileType\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.tile_material\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"tile_material\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 32}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".dfproto.Tile.TileMaterialType\", haskellPrefix = [], parentModule = [MName \"Dfproto\",MName \"Tile\"], baseName = MName \"TileMaterialType\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.material_index\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"material_index\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 40}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.material_type\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"material_type\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 48}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.liquid_type\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"liquid_type\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 14}, typeName = Just (ProtoName {protobufName = FIName \".dfproto.Tile.LiquidType\", haskellPrefix = [], parentModule = [MName \"Dfproto\",MName \"Tile\"], baseName = MName \"LiquidType\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".dfproto.Tile.flow_size\", haskellPrefix' = [], parentModule' = [MName \"Dfproto\",MName \"Tile\"], baseName' = FName \"flow_size\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False, lazyFields = False}"