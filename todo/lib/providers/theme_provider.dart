import 'package:flutter/cupertino.dart';

class theme_provider extends ChangeNotifier
{
  bool islighttheme = false;
  void toggleTheme()
  {
    islighttheme = !islighttheme;
    notifyListeners();
  }
}