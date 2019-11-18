import 'package:dzh_app/event/LoginEvent.dart';
import 'package:dzh_app/event/eventbus.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventBus'),
        centerTitle: true,
      ),
      body: Container(
        child: RaisedButton(
          child: Text('EventBus更新首页列表'),
          onPressed: () {
            eventBus.fire(UserLoggedInEvent('DZH'));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
