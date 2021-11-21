import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Image> imgs = [
    //建立了一个图片数组
    Image.network(
      "https://images.unsplash.com/photo-1477346611705-65d1883cee1e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://images.unsplash.com/photo-1498550744921-75f79806b8a7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      fit: BoxFit.cover,
    ),
    Image.network(
      "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
      fit: BoxFit.cover,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片轮播"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("样式1:"),
            Container(
              height: 175,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  //条目构建函数传入了index,根据index索引到特定图片
                  return imgs[index];
                },
                itemCount: imgs.length,
                autoplay: true,
                pagination: new SwiperPagination(), //这些都是控件默认写好的,直接用
                control: new SwiperControl(),
              ),
            ),
            Text("样式2:"),
            Container(
              height: 175,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return imgs[index];
                },
                itemCount: imgs.length,
                autoplay: true,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            Text("样式3:"),
            Container(
              height: 175,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return imgs[index];
                },
                itemCount: imgs.length,
                autoplay: true,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
                itemWidth: 300.0,
                layout: SwiperLayout.STACK,
              ),
            ),
            Text("样式4:"),
            Container(
              height: 175,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return imgs[index];
                },
                itemCount: imgs.length,
                autoplay: true,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
                itemWidth: 300.0,
                itemHeight: 400.0,
                layout: SwiperLayout.TINDER,
              ),
            ),
            Text("样式5:"),
            Container(
              height: 175,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return imgs[index];
                },
                itemCount: imgs.length,
                autoplay: true,
                pagination: new SwiperPagination(),
                control: new SwiperControl(),
                layout: SwiperLayout.CUSTOM,
                customLayoutOption: new CustomLayoutOption(
                    startIndex: -1, stateCount: 3)
                    .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
                  new Offset(-370.0, -40.0),
                  new Offset(0.0, 0.0),
                  new Offset(370.0, -40.0)
                ]),
                itemWidth: 300.0,
                itemHeight: 200.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
