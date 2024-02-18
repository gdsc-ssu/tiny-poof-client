import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/appbar.dart';
import 'package:tiny_poof/core/common/view/bottom_button.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/core/util/date_format.dart';
import 'package:tiny_poof/screens/onboarding/onboarding_view_model.dart';

class OnboardingStep4View extends StatelessWidget {
  const OnboardingStep4View({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: OnboardingViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const CustomAppbar(
            text: "서비스 사용을 위해\n아기 생일을 작성해주세요",
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
                    "생년월일",
                    style: FontSystem.initTextStyle.copyWith(fontSize: 23),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Material(
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                color: ColorSystem.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Semantics(
                                    enabled: true,
                                    child: SizedBox(
                                      height: 200,
                                      child: CupertinoDatePicker(
                                        initialDateTime: DateTime.now(),
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged:
                                            (DateTime newDateTime) {
                                          viewModel
                                              .onChangeBirthDate(newDateTime);
                                        },
                                      ),
                                    ),
                                  ),
                                  SafeArea(
                                    child: Semantics(
                                      button: true,
                                      enabled: true,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, top: 20),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                            viewModel.onTapFinish();
                                          },
                                          child: const Text("완료",
                                              style: FontSystem.initTextStyle),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                      decoration: BoxDecoration(
                        color: ColorSystem.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                          dateFormatB(viewModel.birthDate ?? DateTime.now())),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomButton(
            onTap: viewModel.onTapFinish,
            text: "완료하기",
          ),
        );
      },
    );
  }
}
