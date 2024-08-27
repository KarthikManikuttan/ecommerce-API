// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishListAdapter extends TypeAdapter<WishList> {
  @override
  final int typeId = 1;

  @override
  WishList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishList(
      title: fields[0] as String?,
      subTitle: fields[1] as String?,
      amount: fields[2] as double?,
      imgLink: fields[3] as String?,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WishList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.imgLink)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishListAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
