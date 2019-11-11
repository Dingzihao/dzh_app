import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class SelectPicPage extends StatefulWidget {
  @override
  _SelectPicPageState createState() => _SelectPicPageState();
}

class _SelectPicPageState extends State<SelectPicPage> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('选择照片'),
      ),
      body: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1333),
        child: Column(
          children: <Widget>[
            RaisedButton(
              textColor: Colors.black12,
              color: Colors.blue,
              child: Text(
                '选择图片',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                loadAssets();
              },
            ),
            Expanded(
              flex: 1,
              child: _buildGridView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#1E88E5",
          actionBarTitle: "选择图片",
          allViewTitle: "所有图片",
          useDetailsView: true,
          selectCircleStrokeColor: "#FFFFFF",
          lightStatusBar: true
        ),
      );

      for (var r in resultList) {
        var t = await r.filePath;
        print(t);
      }
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
}
