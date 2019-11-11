import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'tab_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  List _list = [
    "images/swiper_1.jpg",
    "images/swiper_2.jpg",
    "images/swiper_3.jpg",
    "images/swiper_4.jpg"
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('我的'),
        centerTitle: true,
      ),
      body: Container(
        height: ScreenUtil().setHeight(1100),
        child: Column(
          children: <Widget>[
            SwiperDiy(
              swiperDataList: _list,
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              child: TabBar(
                indicatorColor: Colors.blue,
                controller: _tabController,
                tabs: <Widget>[
                  Text(
                    '手机',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    '电脑',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    '配件',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[TabPage(), TabPage(), TabPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//图片轮播
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(300),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Fluttertoast.showToast(msg: '图片${index + 1}');
            },
            child: Image.asset(
              swiperDataList[index],
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
