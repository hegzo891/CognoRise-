import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool dark = true;

  void toggleTheme(){
    dark = !dark;
    notifyListeners();
}
}