import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';
import 'package:tiny_poof/screens/main/camera/camera_view.dart';
import 'package:tiny_poof/screens/main/home/home_view.dart';
import 'package:tiny_poof/screens/main/diary/diary_view.dart';

class MainViewModel extends BaseViewModel {
  static MainViewModel? _instance;

  static MainViewModel get instance {
    _instance ??= MainViewModel();
    return _instance!;
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeView(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<Widget> _views = [
    const CameraView(),
    const HomeView(),
    const DiaryView(),
  ];
  List<Widget> get views => _views;

  Widget get currentView => _views[_currentIndex];
}
