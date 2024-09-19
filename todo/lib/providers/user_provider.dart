import 'package:flutter/material.dart';

class Userprovider with ChangeNotifier{
  String _name =" ";
  String get name => name;
  void setname(String n)
  {
    _name = n;
    notifyListeners();
  }


}