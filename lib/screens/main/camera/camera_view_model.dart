import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';
import 'package:camera/camera.dart';
import 'package:tiny_poof/screens/main/main_view_model.dart';

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

  bool isLoading = false;

  List<CameraDescription> descriptions = [];
  late CameraController cameraController;

  Future<void> initCamera() async {
    descriptions = await availableCameras();
    cameraController = CameraController(descriptions[0], ResolutionPreset.high);
    await cameraController.initialize();
  }

  void onTapCamera() {
    initCamera();
    viewModelContext.pushNamed(Routes.takePicture);
  }

  void onTapTakePicture() async {
    await cameraController.takePicture();
    cameraController.dispose();
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1), () {
      viewModelContext.pop();
      final instance = MainViewModel.instance;
      instance.changeView(1);
    });
  }
}
