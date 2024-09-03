import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/themeProvider.dart';

class Button extends StatefulWidget {
  final String value;
  final VoidCallback onClicked;
  final Color color;

  const Button({super.key, required this.value, required this.onClicked, required this.color});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);
    Color colorText = themeProvider.dark ? Colors.white : Colors.black;
    Color? Detect(value){
      if(value == "+" || value == "–" || value == "×" || value == "÷" || value == "=")
        {
          return Colors.white;
        }
      else{
        return colorText;
      }

    }
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.onClicked();
        });

      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Center(child: Text("${widget.value}", style: TextStyle(color: Detect(widget.value), fontSize: 35),)),

      ),
    );
  }
}
