import 'package:flutter/material.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "푸푸 분석",
          style: FontSystem.initTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF000000),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _text("요약"),
            const SizedBox(height: 10),
            _body("녹색 똥 30%, 황색 똥 70%를 누었어요. 아주 건강한 똥이에요."),
            const SizedBox(height: 45),
            _text("한 달 분석"),
            const SizedBox(height: 10),
            _body("평균 일주일에 똥을 23회 누었어요."),
          ],
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Text(
      text,
      style: FontSystem.bottomButtonTextStyle.copyWith(
        color: const Color(0xFF000000),
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _body(String text) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF466EFB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Pretendard",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
