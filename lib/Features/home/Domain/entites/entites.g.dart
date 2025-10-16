// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookEntitesAdapter extends TypeAdapter<BookEntites> {
  @override
  final int typeId = 0;

  @override
  BookEntites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookEntites(
      authorName: fields[1] as String,
      title: fields[2] as String,
      rate: fields[3] as num,
      image: fields[0] as String,
      price: fields[4] as num,
    );
  }

  @override
  void write(BinaryWriter writer, BookEntites obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.authorName)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookEntitesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
