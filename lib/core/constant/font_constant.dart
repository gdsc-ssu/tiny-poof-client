import 'package:flutter/material.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';

abstract class FontSystem {
  static const TextStyle bottomButtonTextStyle = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorSystem.buttonWhite,
  );

  static const TextStyle initTextStyle = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 26,
    color: ColorSystem.black,
    fontWeight: FontWeight.w800,
  );
}
