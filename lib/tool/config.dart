import 'package:flutter/material.dart';

List bottomNavBarList = [
  {'title': "首页", 'icon': Icons.home},
  {'title': "代码", 'icon': Icons.code},
  {'title': "课程", 'icon': Icons.book},
  {'title': "我的", 'icon': Icons.person},
];
class AssetAudioPlayerIcons {
  AssetAudioPlayerIcons._();

  static const _kFontFam = 'AssetAudioPlayer';

  static const IconData play = IconData(0xe800, fontFamily: _kFontFam);
  static const IconData stop = IconData(0xe801, fontFamily: _kFontFam);
  static const IconData pause = IconData(0xe802, fontFamily: _kFontFam);
  static const IconData to_end = IconData(0xe803, fontFamily: _kFontFam);
  static const IconData to_start = IconData(0xe804, fontFamily: _kFontFam);
}