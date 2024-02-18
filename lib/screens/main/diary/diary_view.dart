import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/appbar.dart';
import 'package:tiny_poof/core/common/view/bottom_button.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/core/extension/context_extension.dart';
import 'package:tiny_poof/screens/main/diary/diary_view_model.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: DiaryViewModel.instance,
      isResetState: true,
      builder: (context, viewModel, child) => Scaffold(
        appBar: CustomAppbar(
          text: "일기쓰기",
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                viewModel.onTapList();
              },
            ),
          ],
        ),
        backgroundColor: ColorSystem.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: context.height / 3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text("촬영 하기", style: FontSystem.initTextStyle),
              ),
              const CustomAppbar(text: "나만의 스토리"),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorSystem.main3),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: viewModel.contentTextController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: "제목을 입력해주세요",
                    border: InputBorder.none,
                    constraints: BoxConstraints(
                      minHeight: 150,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(
          onTap: viewModel.onTapSave,
          text: "일기 저장하기",
        ),
      ),
    );
  }
}
