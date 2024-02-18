import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';
import 'package:camera/camera.dart';

class CameraViewModel extends BaseViewModel {
  static CameraViewModel? _instance;

  static CameraViewModel get instance {
    _instance ??= CameraViewModel();
    return _instance!;
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  List<CameraDescription> descriptions = [];
  late CameraController cameraController;

  Future<void> initCamera() async {
    descriptions = await availableCameras();
    cameraController = CameraController(descriptions[1], ResolutionPreset.high);
    await cameraController.initialize();
    notifyListeners();
  }

  void onTapCamera() {
    initCamera();
    viewModelContext.pushNamed(Routes.takePicture);
  }

  void onTapTakePicture() async {
    final result = await cameraController.takePicture();
    result;
  }
}
