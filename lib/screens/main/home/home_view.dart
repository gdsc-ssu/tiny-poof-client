import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/appbar.dart';
import 'package:tiny_poof/core/common/view/bottom_button.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/screens/main/home/home_view_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel.instance,
      builder: (context, viewModel, child) => Scaffold(
        appBar: const CustomAppbar(text: "푸푸 다이어리"),
        backgroundColor: ColorSystem.backgroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "이번 주 분석",
                style: FontSystem.initTextStyle,
              ),
              const SizedBox(height: 8),
              _TextWidget(text: viewModel.weeklyAnalysis),
              const SizedBox(height: 12),
              BottomButton(
                onTap: () {},
                text: "주 단위 분석 더보기",
                margin: const EdgeInsets.all(0),
              ),
              const SizedBox(height: 28),
              const Text(
                "오늘 푸푸 기록",
                style: FontSystem.initTextStyle,
              ),
              const SizedBox(height: 8),
              _TextWidget(text: viewModel.todayAnalysis),
              const SizedBox(height: 12),
              BottomButton(
                onTap: () {},
                text: "오늘 하루 기록 더보기",
                margin: const EdgeInsets.all(0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  final String text;
  const _TextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 110),
      decoration: BoxDecoration(
        border: Border.all(color: ColorSystem.main2),
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.all(24),
      child: Text(text),
    );
  }
}
