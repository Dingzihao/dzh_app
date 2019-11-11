import 'package:dio/dio.dart';
import 'package:dzh_app/config/sputil.dart';
import 'package:dzh_app/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * Token拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class TokenInterceptors extends InterceptorsWrapper {

  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = _token;
    return options;
  }


  @override
  onResponse(Response response) async{
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["auto-toke"] != null) {
        _token = 'auto-toke=' + responseJson["auto-toke"];
        await SpUtils.save(KString.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    SpUtils.remove(KString.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = await SpUtils.get(KString.TOKEN_KEY);
    if (token == null) {
      Fluttertoast.showToast(msg: 'token为空');
      return null;
    } else {
      this._token = token;
      return token;
    }
  }
}