import 'package:dzh_app/config/sputil.dart';
import 'package:dzh_app/config/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('我的'),
        centerTitle: true,
      ),
      body: Container(
        height: ScreenUtil().setHeight(1000),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Center(
                child: Text(
                  '退出登录',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              onPressed: () {
                SpUtils.remove(KString.USER_INFO);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
