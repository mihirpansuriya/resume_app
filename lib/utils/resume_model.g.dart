// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  final int typeId = 0;

  @override
  NoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteModel(
      fields[0] as String,
      fields[15] as String,
      fields[4] as String,
      fields[2] as String,
      fields[3] as String,
      fields[1] as String,
      fields[11] as String,
      fields[10] as String,
      fields[9] as String,
      fields[8] as String,
      fields[12] as String,
      fields[6] as String,
      fields[14] as String,
      fields[5] as String,
      fields[13] as String,
      fields[16] as String,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.course)
      ..writeByte(5)
      ..write(obj.school)
      ..writeByte(6)
      ..write(obj.grade)
      ..writeByte(7)
      ..write(obj.year)
      ..writeByte(8)
      ..write(obj.cmpname)
      ..writeByte(9)
      ..write(obj.jobTitle)
      ..writeByte(10)
      ..write(obj.startDate)
      ..writeByte(11)
      ..write(obj.endDate)
      ..writeByte(12)
      ..write(obj.eneterDetais)
      ..writeByte(13)
      ..write(obj.skill)
      ..writeByte(14)
      ..write(obj.projectTitle)
      ..writeByte(15)
      ..write(obj.description)
      ..writeByte(16)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
