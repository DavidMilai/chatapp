// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/auth_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthDataAdapter extends TypeAdapter<AuthData> {
  @override
  final int typeId = 0;

  @override
  AuthData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthData(
      message: fields[0] as String?,
      token: fields[1] as String?,
      id: fields[2] as String?,
      email: fields[3] as String?,
      clientCode: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.clientCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
