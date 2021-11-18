import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/auth_data.dart';
import 'models/user.dart';

class Database {
  late Box<AuthData> authDataBox; //typeId: 0
  late Box<User> users; //typeId: 1

  _initBoxes() async {
    authDataBox = await Hive.openBox("authData");
    users = await Hive.openBox("users");
  }

  _registerAdapters() async {
    Hive.registerAdapter(AuthDataAdapter());
    Hive.registerAdapter(UserAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

var db = Database();
