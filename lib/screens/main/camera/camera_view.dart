import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/appbar.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/screens/main/camera/camera_view_model.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CameraViewModel.instance,
      builder: (context, viewModel, child) => Scaffold(
        appBar: const CustomAppbar(text: "푸푸 다이어리"),
        backgroundColor: ColorSystem.backgroundColor,
        body: GestureDetector(
          onTap: viewModel.onTapCamera,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorSystem.main3,
            ),
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: const Text(
              "촬영하기",
              style: FontSystem.initTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
