import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const primaryColor = Color(0xff174674);
  static const secondaryColor = Color(0xff4285F4);
  static const lightSecondaryColor = Color(0xff0858A7);

  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;

  static const Color mainColor = Color(0xff174674);
  static const Color blueBackground = Color(0xff4285F4);
  static const Color linkedinButBackground = Color(0xff0858A7);
  static const Color linkedinButBorder = Color(0xff0A66C2);
  static const Color mainRed = Color(0xffF13C19);
  static const Color mainGray = Color(0xff707070);
  static const Color chartGray = Color(0xff979797);
  static const Color mainOrange = Color(0xffEBAC2D);
  static const Color mainGreen = Color(0xff00CE30);
  static const Color indicatorBGColor = Color(0xffE1E5EB);

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
