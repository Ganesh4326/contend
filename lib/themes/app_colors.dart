import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppColors {
  static const Color primary = Color.fromRGBO(41, 66, 136, 1);
  static const Color bgPrimary = Color.fromRGBO(13, 139, 255, 1);
  static const Color bgPrimary2 = Color.fromRGBO(13, 110, 255, 1);
  static const Color waterPrimary = Color.fromRGBO(0, 147, 183, 1);
  static const Color skyBlue = Color.fromRGBO(64, 165, 243, 1);

  static const Color textHeading = Color.fromRGBO(46, 46, 46, 1);
  static const Color textNormal = Color.fromRGBO(46, 46, 46, 1);
  static const Color transparent = Color.fromRGBO(0, 0, 0, 0);
  static const Color grey1 = Color.fromRGBO(120, 120, 120, 1);
  static const Color grey2 = Color.fromRGBO(234, 234, 234, 1);
  static const Color grey3 = Color.fromRGBO(247, 247, 247, 1);
  static const Color grey4 = Color.fromRGBO(177, 177, 177, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color white03 = Color.fromRGBO(255, 255, 255, 0.3);
  static const Color white04 = Color.fromRGBO(255, 255, 255, 0.4);
  static const Color white012 = Color.fromRGBO(255, 255, 255, 0.12);
  static const Color white018 = Color.fromRGBO(255, 255, 255, 0.18);
  static const Color greyWhite = Color.fromRGBO(244, 229, 190, 1);
  static const Color bgLightGrey = Color.fromRGBO(234, 236, 243, 1);
  static const Color bgLightBlue = Color.fromRGBO(130, 160, 243, 1);
  static const Color textRed = Color.fromRGBO(224, 36, 36, 1);
  static const Color green = Color.fromRGBO(15, 184, 0, 1);
  static const Color coinProgress = Color.fromRGBO(255, 204, 102, 1);
  static const Color bmiTracker = Color.fromRGBO(115, 41, 209, 1);
  static const Color login_bg_1 = Color.fromRGBO(95, 147, 199, 1);
  static const Color login_bg_2 = Color.fromRGBO(254, 90, 240, 1);
  static const Color brown = Color.fromRGBO(197, 142, 76, 1);
  static const Color bg_light_green = Color.fromRGBO(0, 220, 0, 0.08);
  static const Color orange = Color.fromRGBO(251, 99, 64, 1);


  static ColorFilter bgFilter =
      ColorFilter.mode(Colors.white.withOpacity(0.4), BlendMode.dstATop);
}
