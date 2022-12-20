import 'package:flutter/material.dart';

class StaticNotifier extends ChangeNotifier {
  static final StaticNotifier _instance = StaticNotifier._internal();

  factory StaticNotifier() => _instance;

  StaticNotifier._internal();

  int _minimumWidth = 768;
  int _defaultLimit = 10;

  int get minimumWidth => _minimumWidth;

  void setMinimumWidth(int value) {
    _minimumWidth = value;
    notifyListeners();
  }
}
