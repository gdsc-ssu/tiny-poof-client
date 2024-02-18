import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  static HomeViewModel? _instance;

  static HomeViewModel get instance {
    _instance ??= HomeViewModel();
    return _instance!;
  }

  String weeklyAnalysis = "이번주는 내내 건강한 똥을 봤어요! 녹색 똥 5번, 황색 똥 7번을 봤어요.";
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

  void onTapTodayMeal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _TodayMealDialog(),
    );
  }

  String selectedMeal = "";
  void selecteMeal(String meal) {
    selectedMeal = meal;
    notifyListeners();
  }
}

class _TodayMealDialog extends StatelessWidget {
  _TodayMealDialog();
  int selectedMealIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> mealList = [
      "모유",
      "분유",
      "이유식",
      "간식",
      "밥",
      "음료",
    ];

    return CupertinoAlertDialog(
      title: const Text("오늘 식사"),
      content: SizedBox(
        height: 250,
        child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (value) {
            selectedMealIndex = value;
          },
          children: mealList.map((e) => Center(child: Text(e))).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            HomeViewModel.instance.selecteMeal(mealList[selectedMealIndex]);
            Navigator.pop(context);
          },
          child: const Text("확인"),
        ),
      ],
    );
  }
}
