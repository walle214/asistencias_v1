import 'package:flutter/material.dart';

class CustomColors {
  static Color _fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static final Color green = _fromHex('#4ea728');
  static final Color darkGreen = _fromHex('#007828');
  static final Color yellow = _fromHex('#feca00');
  static final Color darkYellow = _fromHex('#bf9900');
  static final Color red = _fromHex('#e7003f');
  static final Color darkRed = _fromHex('#a8002d');
  static final Color blue = _fromHex('#23a3e5');
  static final Color darkBlue = _fromHex('#260063');
  static final Color lowDarkBlue = _fromHex('#1f92cc');
}
