import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  static HomeViewModel? _instance;

  static HomeViewModel get instance {
    _instance ??= HomeViewModel();
    return _instance!;
  }

  String weeklyAnalysis = "이번주는 행복한 주였어요!";
  String todayAnalysis = "오늘은 행복한 하루였어요!";

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {
    getWeeklyAnalysis();
    getTodayAnalysis();
  }

  void getWeeklyAnalysis() {
    weeklyAnalysis = "이번주는 행복한 주였어요!";
    notifyListeners();
  }

  void getTodayAnalysis() {
    todayAnalysis = "갈색 80%, 녹색 20%로 정상적인 똥에 속해요. 채소를 먹으면 녹색 똥이 나올 수 있어요.";
    notifyListeners();
  }
}
