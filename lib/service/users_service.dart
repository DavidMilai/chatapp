import 'package:chat_app/api/api.dart';
import 'package:chat_app/data/database.dart';
import 'package:chat_app/data/models/user.dart';
import 'package:flutter/cupertino.dart';

class UsersService extends ChangeNotifier {
  List<User> get users => db.users.values.toList();

  bool _isGettingUsers = false;

  bool get isGettingUsers => _isGettingUsers;

  set isGettingUsers(bool status) {
    _isGettingUsers = status;
    notifyListeners();
  }

  Future getUsers() async {
    isGettingUsers = true;
    await api.getUser().then((response) {
      print("****${response.data["response"]}");
      _saveUsers(response.data["response"]);
      isGettingUsers = false;
    }).catchError((onError) {
      isGettingUsers = false;
      throw onError;
    });
  }

  _saveUsers(data) async {
    await db.users.clear();
    print(data);
    List<User> users =
        data.map<User>((element) => User.fromMap(element)).toList();
    db.users.addAll(users);
  }
}

var usersService = UsersService();
