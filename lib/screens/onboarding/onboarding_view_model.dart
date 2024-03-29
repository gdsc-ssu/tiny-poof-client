import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiny_poof/core/base/base_viewmodel.dart';
import 'package:tiny_poof/core/factory/shared_preference_factory.dart';
import 'package:tiny_poof/core/model/user.dart';
import 'package:tiny_poof/core/routes/app_routes.dart';

class OnboardingViewModel extends BaseViewModel {
  int step = 2;
  static OnboardingViewModel? _instance;

  static OnboardingViewModel get instance {
    _instance ??= OnboardingViewModel();
    return _instance!;
  }

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  void onTapNext() {
    step += 1;
    notifyListeners();
    if (step == 2) {
      viewModelContext.pushReplacementNamed(Routes.initStep2);
    } else if (step == 3) {
      viewModelContext.pushReplacementNamed(Routes.initStep3);
    } else if (step == 4) {
      viewModelContext.pushReplacementNamed(Routes.initStep4);
    }
  }

  void onChangedName(String text) {
    name = text;
    SharedPreferenceFactory.setUserData(
      User(name: name, birth: birthDate ?? DateTime.now()),
    );
    notifyListeners();
  }

  String name = "";

  void onTapFinish() {
    viewModelContext.pushReplacementNamed(Routes.main);
  }

  TextEditingController nameTextController = TextEditingController();

  DateTime? birthDate = DateTime.now();

  void onChangeBirthDate(DateTime? date) {
    birthDate = date;
    notifyListeners();
  }
}
