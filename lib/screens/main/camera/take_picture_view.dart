import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/core/base/base_view.dart';
import 'package:tiny_poof/screens/main/camera/camera_view_model.dart';

class TakePictureView extends StatelessWidget {
  const TakePictureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CameraViewModel.instance,
      isResetState: false,
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: FutureBuilder<void>(
                  future: viewModel.initCamera(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (viewModel.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CameraPreview(viewModel.cameraController);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    children: [
                      const Text(
                        "사진",
                        style: TextStyle(
                          color: Color(0xFFF8CB58),
                          fontFamily: "Pretendard",
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.cameraController.dispose();
                              context.pop();
                            },
                            child: const Text(
                              "취소",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              try {
                                viewModel.onTapTakePicture();
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.5),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "취소",
                            style: TextStyle(
                              color: Colors.transparent,
                              fontSize: 23,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
