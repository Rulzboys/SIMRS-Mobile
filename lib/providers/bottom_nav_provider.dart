import 'package:flutter/material.dart';

/// Provider index tab BottomNavigationBar pada MainNavigation.
class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
