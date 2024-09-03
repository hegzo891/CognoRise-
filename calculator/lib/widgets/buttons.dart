import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Center(child: Text("${widget.value}", style: const TextStyle(color: Color(0xffFFFFFF), fontSize: 35),)),

      ),
    );
  }
}
