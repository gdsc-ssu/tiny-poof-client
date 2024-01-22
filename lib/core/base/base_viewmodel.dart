import 'package:flutter/material.dart';

abstract class BaseViewModel extends ChangeNotifier {
  late BuildContext viewModelContext;

  void setContext(BuildContext context);
  void init() {}
}
