import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/appbar.dart';
import 'package:tiny_poof/core/common/view/bottom_button.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/screens/onboarding/onboarding_view_model.dart';

class OnboardingStep3View extends StatelessWidget {
  const OnboardingStep3View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: OnboardingViewModel.instance,
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const CustomAppbar(
              text: "서비스 사용을 위해\n아기 이름을 작성해주세요",
            ),
            backgroundColor: ColorSystem.backgroundColor,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "아기 이름 (태명)",
                      style: FontSystem.initTextStyle.copyWith(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorSystem.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextField(
                        controller: viewModel.nameTextController,
                        decoration: const InputDecoration(
                          hintText: "아기 이름을 입력해주세요.",
                          hintStyle: TextStyle(
                            fontFamily: "Pretendard",
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: ColorSystem.lightGray,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorSystem.black,
                        ),
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                          viewModel.onChangedName(value);
                        },
                        onSubmitted: (text) => viewModel.onTapNext(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomButton(
              onTap: () => viewModel.onTapNext(),
              text: "다음",
            ),
          );
        });
  }
}
