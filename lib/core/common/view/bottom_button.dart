import 'package:flutter/material.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';

class BottomButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final EdgeInsets? margin;

  const BottomButton(
      {required this.onTap, required this.text, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: true,
      child: SafeArea(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 80,
            margin: margin ??
                const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: const Color(0xFF4A6EED),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: FontSystem.bottomButtonTextStyle.copyWith(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
