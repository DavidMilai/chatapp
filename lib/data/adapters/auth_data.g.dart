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
    return AuthData();
  }

  @override
  void write(BinaryWriter writer, AuthData obj) {
    writer..writeByte(0);
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
