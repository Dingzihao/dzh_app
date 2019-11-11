import 'package:dzh_app/config/sputil.dart';
import 'package:dzh_app/config/strings.dart';
import 'package:dzh_app/event/LoginEvent.dart';
import 'package:dzh_app/event/eventbus.dart';
import 'package:dzh_app/http/HttpUtils.dart';
import 'package:dzh_app/pages/select_pic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Widget> _list = [
    InkWell(
      onTap: () {
        SpUtils.remove(KString.USER_INFO);
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            "images/parking_condition.png",
            height: 60,
            width: 60,
          ),
          Text('监控')
        ],
      ),
    ),
    Column(
      children: <Widget>[
        Image.asset(
          "images/parking_condition.png",
          height: 60,
          width: 60,
        ),
        Text('监控2')
      ],
    ),
    Column(
      children: <Widget>[
        Image.asset(
          "images/parking_condition.png",
          height: 60,
          width: 60,
        ),
        Text('监控3')
      ],
    ),
    Column(
      children: <Widget>[
        Image.asset(
          "images/parking_condition.png",
          height: 60,
          width: 60,
        ),
        Text('监控4')
      ],
    ),
    Column(
      children: <Widget>[
        Image.asset(
          "images/parking_condition.png",
          height: 60,
          width: 60,
        ),
        Text('监控5')
      ],
    ),
    Column(
      children: <Widget>[
        Image.asset(
          "images/parking_condition.png",
          height: 60,
          width: 60,
        ),
        Text('监控6')
      ],
    ),
    Column(
      children: <Widget>[
        Image.asset(
          "images/parking_condition.png",
          height: 60,
          width: 60,
        ),
        Text('监控7')
      ],
    ),
  ];
  EasyRefreshController _controller = EasyRefreshController();
  int _count = 10;
  String name = "默认";

  @override
  void initState() {
    super.initState();
    eventBus.on<UserLoggedInEvent>().listen((event) {
      setState(() {
        name = event.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('首页'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectPicPage()));
              },
            )
          ],
        ),
        body: EasyRefresh.builder(
          //刷新控件
          controller: _controller,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: true,
          header: MaterialHeader(),
          footer: MaterialFooter(),
          builder: (context, physics, header, footer) {
            return CustomScrollView(
              physics: physics,
              scrollDirection: Axis.vertical,
              slivers: <Widget>[
                header,
                SliverPadding(
                  padding: EdgeInsets.only(top: 20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.2),
                    delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _list[index];
                      },
                      childCount: _list.length,
                    ),
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 20,
                  delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建列表项
                    return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '消息通知',
                        style: TextStyle(fontSize: 16, color: Colors.indigo),
                      ),
                    );
                  }, childCount: 1),
                ),
                SliverFixedExtentList(
                  itemExtent: 100,
                  delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      //创建列表项
                      return new Card(
                          margin: EdgeInsets.all(14),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.lightBlue[100 * (index % 9)],
                          child: InkWell(
                            child: Center(child: Text('$name $index')),
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
                            },
                          ));
                    },
                    childCount: _count, //10个列表项
                  ),
                ),
                footer,
              ],
            );
          },
          onRefresh: () async {
            Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
              _controller.finishRefresh(success: true);
            });
          },
          onLoad: () async {
            Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
              setState(() {
                _count = _count + 10;
              });
              _controller.finishLoad(success: true, noMore: _count >= 25);
            });
          },
        ));
  }
}
