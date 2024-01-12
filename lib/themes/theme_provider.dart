import 'package:flutter/material.dart';
import 'package:iiit/themes/dark_mode.dart';
import 'package:iiit/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => themeData == darkMode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    themeData = _themeData == lightMode? darkMode:lightMode;
  }
}