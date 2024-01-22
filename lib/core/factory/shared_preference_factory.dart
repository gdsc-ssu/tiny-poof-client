import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiny_poof/core/model/user.dart';

class SharedPreferenceFactory {
  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _instance!;

  static User? getUserData() {
    final user = _instance!.getString("user");
    if (user != null) {
      return User.fromJson(jsonDecode(user));
    }
    return null;
  }
}
