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

  String? message;
  String? token;
  String? id;
  String? email;
  String? clientCode;

  factory AuthData.fromMap(Map<String, dynamic> json) => AuthData(
        message: json["message"],
        token: json["token"],
        id: json["result"]["_id"],
        email: json["result"]["email"],
        clientCode: json["result"]["clientCode"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "token": token,
        "_id": id,
        "email": email,
        "clientCode": clientCode,
      };
}
