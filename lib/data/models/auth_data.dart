import 'package:hive/hive.dart';

part '../adapters/auth_data.g.dart';

@HiveType(typeId: 0)
class AuthData {
  AuthData({
    this.message,
    this.token,
    this.id,
    this.email,
    this.clientCode,
  });
  @HiveField(0)
  String? message;
  @HiveField(1)
  String? token;
  @HiveField(2)
  String? id;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? clientCode;

  factory AuthData.fromMap(Map<String, dynamic> json) => AuthData(
        message: json["message"],
        token: json["token"],
        id: json["id"],
        email: json["email"],
        clientCode: json["clientCode"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
        "_id": id,
        "email": email,
        "clientCode": clientCode,
      };
}
