import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/bottom_button.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/screens/onboarding/onboarding_view_model.dart';

class OnboardingStep2View extends StatelessWidget {
  const OnboardingStep2View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardingViewModel>(
      viewModel: OnboardingViewModel.instance,
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ColorSystem.backgroundColor,
          body: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "하단에 고정으로 있는\n버튼들이 있습니다.\n\n처음 사용하신다면\n화면 전체를 그래그 해보면서\n화면에 무엇이 있는지\n확인해보세요!",
                    style: FontSystem.initTextStyle,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomButton(
            onTap: () => viewModel.onTapNext(),
            text: "다음으로",
          ),
        );
      },
    );
  }
}
