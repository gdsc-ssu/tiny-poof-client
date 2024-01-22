import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';
import 'package:tiny_poof/core/model/diary.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';

class DiaryViewModel extends BaseViewModel {
  static DiaryViewModel? _instance;

  static DiaryViewModel get instance {
    _instance ??= DiaryViewModel();
    return _instance!;
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  List<Diary> diaryList = [
    Diary(content: "오늘도 너무 즐거운 삶이었다.", date: DateTime.now()),
  ];

  void addDiary(Diary diary) {
    diaryList.insert(0, diary);
    notifyListeners();
  }

  void onTapList() {
    viewModelContext.pushNamed(Routes.diaryList);
  }

  TextEditingController contentTextController = TextEditingController();

  void onTapSave() {
    if (contentTextController.text.isEmpty) {
      return;
    }
    final diary = Diary(
      content: contentTextController.text,
      date: DateTime.now(),
    );
    addDiary(diary);
    onTapList();
  }
}
