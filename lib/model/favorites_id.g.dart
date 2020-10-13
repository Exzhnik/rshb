// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_id.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoritesIdAdapter extends TypeAdapter<FavoritesId> {
  @override
  final int typeId = 0;

  @override
  FavoritesId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoritesId()..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, FavoritesId obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoritesIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
