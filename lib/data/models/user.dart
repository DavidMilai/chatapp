import 'package:hive/hive.dart';

part '../adapters/user.g.dart';

@HiveType(typeId: 1)
class User {
  User({
    this.id,
    this.email,
    this.clientCode,
    this.userId,
  });

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? clientCode;
  @HiveField(3)
  String? userId;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        clientCode: json["clientCode"],
        userId: json["userID"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "email": email,
        "clientCode": clientCode,
        "userID": userId,
      };
}
