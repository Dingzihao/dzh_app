import 'dart:convert';

import 'package:dzh_app/config/colors.dart';
import 'package:dzh_app/model/user_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/sputil.dart';
import 'package:flutter/material.dart';
import '../config/strings.dart';
import 'login_page.dart';
import 'main_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () async {
      SpUtils.getUser().then((onValue) {
        if (onValue != null && onValue.userId != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        } else {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
        return true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Container(
      color: Color(KColor.white),
      child: Stack(
        children: <Widget>[
          new Center(
            child: new Image(image: new AssetImage('images/ic_splash.png')),
          ),
        ],
      ),
    );
  }
}
