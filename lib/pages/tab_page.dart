import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => new _TabPageState();
}

class _TabPageState extends State<TabPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; //是否保存状态

  int _indexCount = 0;

  void _addCount() {
    setState(() {
      _indexCount++;
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addCount,
        tooltip: '点击相加',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("这是界面"),
            Text(
              '$_indexCount',
              style: Theme.of(context).textTheme.display2,
            )
          ],
        ),
      ),
    );
  }
}
