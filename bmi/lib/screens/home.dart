import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/counters.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  double _currentValue = 150;
  late int value;
  int _selectedGenderIndex = 0; // 0 for Male, 1 for Female

  @override
  Widget build(BuildContext context) {
    value = _currentValue.toInt();

    return Scaffold(
      backgroundColor: Color(0xFFF4F3FF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text(
              "BMI CALCULATOR",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            // Gender ToggleButtons


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Counters(
                  title: 'Age',
                ),
                SizedBox(
                  width: 10,
                ),
                Counters(
                  title: 'Weight (KG)',
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 333,
              height: 183,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 0.5, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Height (CM)",
                    style: TextStyle(color: Color(0xff081854), fontSize: 20),
                  ),
                  Text(
                    "$value", // Display the current number
                    style: TextStyle(
                        fontSize: 57,
                        color: Color(0xff6C63FF),
                        fontWeight: FontWeight.w900),
                  ),
                  Slider(
                    thumbColor: Color(0xff6C63FF),
                    value: _currentValue,
                    min: 50,
                    max: 300,
                    divisions: 50, // Optional: Set divisions if you want steps
                    label: _currentValue.toInt().toString(),
                    onChanged: (double newValue) {
                      setState(() {
                        _currentValue = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container( width: 333,
              height: 183,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 0.5, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Gender",            style: TextStyle(fontSize: 20, color: Color(0xff081854)),
                  ),
                  ToggleButtons(

                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: Color(0xff6C63FF),
                  color: Colors.black,
                  isSelected: [_selectedGenderIndex == 0, _selectedGenderIndex == 1],
                  onPressed: (index) {
                    setState(() {
                      _selectedGenderIndex = index;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Male"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Female"),
                    ),
                  ],
                              ),
                ],
              ),),
           SizedBox(height: 30,),
            SizedBox(
              width: 350,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF081854), backgroundColor: Color(0xff6C63FF), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}