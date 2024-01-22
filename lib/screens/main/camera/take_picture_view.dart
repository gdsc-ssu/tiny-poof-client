import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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
              FutureBuilder<void>(
                future: viewModel.initCamera(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(viewModel.cameraController);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              ElevatedButton(
                child: const Text('사진 찍기'),
                onPressed: () async {
                  try {
                    viewModel.onTapTakePicture();
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
