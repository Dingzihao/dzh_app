import 'package:dzh_app/pages/home_page.dart';
import 'package:dzh_app/pages/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<StatefulWidget> pageList = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('我的'), icon: Icon(Icons.person)),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //使用IndexedStack保持页面状态
      body: IndexedStack(
        index: _currentIndex,
        children: pageList,
      ),
    );
  }
}
