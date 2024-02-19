import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/bottom_button.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/screens/onboarding/onboarding_view_model.dart';

class OnboardingStep1View extends StatelessWidget {
  const OnboardingStep1View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: OnboardingViewModel.instance,
      builder: (context2, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorSystem.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/smart-poof.png",
                  height: 47,
                  fit: BoxFit.fitHeight,
                ),
                const Center(
                  child: Text(
                    "스마트 푸푸를 통해\n아기 똥 색깔을 확인하고\n이를 기록하는 다이어리를\n작성할 수 있어요.",
                    style: FontSystem.initTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomButton(
            onTap: viewModel.onTapNext,
            text: "시작하기",
          ),
        );
      },
    );
  }
}
