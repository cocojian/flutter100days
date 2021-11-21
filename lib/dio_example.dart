import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'http/base_dio.dart';
import 'dart:convert';
import 'model/banner.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(DioDemo());

class DioDemo extends StatefulWidget {
  const DioDemo({Key key}) : super(key: key);

  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  var imgs = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dio例子'),),
        body: Container(
          height: 200,
          child: FutureBuilder(
            future: dio.get("/banner/json"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                Map bannerMap = json.decode(response.toString());
                var banner = MyBanner.fromJson(bannerMap);
                if (snapshot.hasError) {
                  Fluttertoast.showToast(msg: snapshot.error.toString());
                } else {
                  return _getSwiper(banner.data);
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }

  Swiper _getSwiper(List data) {
    imgs.clear();
    for (var i = 0; i < data.length; i++) {
      var image = Image.network(
        data[i].imagePath,
        fit: BoxFit.cover,
      );
      imgs.add(image);
    }
    return Swiper(
      itemWidth: double.infinity,
      itemHeight: 200,
      itemCount: imgs.length,
      itemBuilder: (BuildContext context, int index) {
        return imgs[index];
      },
      autoplay: true,
      pagination: new SwiperPagination(
        builder: SwiperPagination.dots,
      ),
      control: new SwiperControl(),
    );
  }
}
