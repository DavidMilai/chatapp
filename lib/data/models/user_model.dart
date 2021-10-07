import 'package:hive/hive.dart';

part '../adapters/user_model.g.dart';

@HiveType(typeId: 0)
class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.clientCode,
    required this.userId,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String password;
  @HiveField(3)
  String clientCode;
  @HiveField(4)
  String userId;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        clientCode: json["clientCode"],
        userId: json["userID"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "email": email,
        "password": password,
        "clientCode": clientCode,
        "userID": userId,
      };
}
