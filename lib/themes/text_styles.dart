import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'fonts.dart';

abstract class TextStyles {
  static const TextStyle textNormal = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: Fonts.fontSize18,
      color: AppColors.textNormal);
}
