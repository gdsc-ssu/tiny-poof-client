import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/core/common/view/appbar.dart';
import 'package:tiny_poof/core/constant/color_constant.dart';
import 'package:tiny_poof/core/constant/font_constant.dart';
import 'package:tiny_poof/core/extension/context_extension.dart';
import 'package:tiny_poof/screens/main/camera/camera_view_model.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CameraViewModel.instance,
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/images/smart-poof.png", height: 47),
          scrolledUnderElevation: 0,
          backgroundColor: ColorSystem.backgroundColor,
        ),
        backgroundColor: ColorSystem.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "촬영하기",
                style: TextStyle(
                  fontFamily: "Pretendard",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: viewModel.onTapCamera,
                child: Container(
                  height: context.height * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF4A6EED),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "아기 똥 촬영",
                    style:
                        FontSystem.initTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
