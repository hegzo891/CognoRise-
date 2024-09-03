import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{
  bool dark = false;

  void toggleTheme(){
    dark = !dark;
    notifyListeners();
  }
}