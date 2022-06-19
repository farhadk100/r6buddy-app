
import 'package:flutter/material.dart';
import 'package:r6buddy/utilities/enums.dart';

class MainPageProvider extends ChangeNotifier{

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  MainPageSection _mainPageScreen = MainPageSection.operators;

  MainPageSection get mainPageScreen => _mainPageScreen;

  set mainPageScreen(MainPageSection value) {
    _mainPageScreen = value;
    notifyListeners();
  }

}