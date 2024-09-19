import 'package:flutter/material.dart';

class Alarm {
  String title;
  TimeOfDay time;
  bool isRepeatDaily;
  bool isVibrate;
  String ringtone;

  Alarm({
    required this.title,
    required this.time,
    this.isRepeatDaily = false,
    this.isVibrate = true,
    this.ringtone = "Default",
  });
}