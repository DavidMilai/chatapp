import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user_model.dart';

class Database {
  late Box<User> authDataBox; //typeId: 0

  _initBoxes() async {
    authDataBox = await Hive.openBox("authData");
  }

  _registerAdapters() async {
    Hive.registerAdapter(UserAdapter());
  }

  init() async {
    await Hive.initFlutter();
    await _registerAdapters();
    await _initBoxes();
  }
}

var db = Database();
