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
        appBar: AppBar(
          title: Image.asset("assets/images/smart-poof.png", height: 47),
          scrolledUnderElevation: 0,
          backgroundColor: ColorSystem.backgroundColor,
        ),
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
                onTap: () {
                  viewModel.onTapAnalysis(context);
                },
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
              const Text(
                "오늘 식사",
                style: FontSystem.initTextStyle,
              ),
              const SizedBox(height: 8),
              if (viewModel.selectedMeal.isEmpty)
                const _TodayMealWidget()
              else
                Row(
                  children: [
                    Text(viewModel.selectedMeal),
                    const Text("메모"),
                  ],
                ),
              const SizedBox(height: 12),
              BottomButton(
                onTap: () {},
                text: "추가하기",
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

class _TodayMealWidget extends StatelessWidget {
  const _TodayMealWidget();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => HomeViewModel.instance.onTapTodayMeal(context),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: ColorSystem.main2),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(10),
        child: const Text(
          "종류 입력 ▼",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
