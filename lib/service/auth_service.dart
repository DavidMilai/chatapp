import 'package:chat_app/api/api.dart';
import 'package:chat_app/data/database.dart';
import 'package:chat_app/data/models/auth_data.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  bool _loggingIn = false;

  bool get loggingIn => _loggingIn;

  set loggingIn(bool status) {
    _loggingIn = status;
    notifyListeners();
  }

  login(String email, String password) async {
    loggingIn = true;
    await api.login(email, password).then((response) {
      _saveAuthData(response);
    }).catchError((onError) {
      throw onError;
    });
  }

  _saveAuthData(data) async {
    await db.authDataBox.clear();
    db.authDataBox.add(AuthData.fromMap(data));
  }
}

var authService = AuthService();
