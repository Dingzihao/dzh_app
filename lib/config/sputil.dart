import 'dart:convert';

import 'package:dzh_app/config/strings.dart';
import 'package:dzh_app/model/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class SpUtils {
  static save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static setUser(UserEntity entity) async {
    SpUtils.save(KString.USER_INFO, json.encode(entity));
  }

  static Future<UserEntity> getUser() async {
    String s = await SpUtils.get(KString.USER_INFO);
    UserEntity userEntity;
    if (null != s && s.length > 0) {
      userEntity = UserEntity.fromJson(json.decode(s));
    }
    return userEntity;
  }

  static setToken(String token) async {
    SpUtils.save(KString.TOKEN_KEY, token);
  }

  static Future<String> getToken() async {
    String s = await SpUtils.get(KString.TOKEN_KEY);
    return s;
  }
}
