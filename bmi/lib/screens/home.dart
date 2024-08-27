import 'package:bmi/screens/result.dart';
import 'package:flutter/material.dart';

import '../widgets/counters.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _currentValue = 150;
  late int number = 0;
  late int value;
  int _selectedGenderIndex = 0; // 0 for Male, 1 for Female

  // Method to calculate the BMI category
  String calc(double bmi) {
    if (bmi < 18.5) {
      return "UNDERWEIGHT";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "NORMAL";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "OVERWEIGHT";
    } else {
      return "OBESITY";
    }
  }

  @override
  Widget build(BuildContext context) {
    value = _currentValue.toInt();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            const Text(
              "BMI CALCULATOR",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Counters(
                  title: 'Age',
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 156,
                  height: 175,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 0.5, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: const Offset(0, 5), // Shadow position
                      ),
                    ],
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Weight (KG)", // Access the title using widget.title
                        style: TextStyle(fontSize: 20, color: Color(0xff081854)),
                      ),
                      Text(
                        "$number", // Display the current number
                        style: const TextStyle(
                            fontSize: 57,
                            color: Color(0xff6C63FF),
                            fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(width: 5,),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  number--;
                                });
                              },
                              icon: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff081854),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ))),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  number++;
                                });
                              },
                              icon: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff081854),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ))),
                          const SizedBox(width: 5,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
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
                    offset: const Offset(0, 5), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Height (CM)",
                    style: TextStyle(color: Color(0xff081854), fontSize: 20),
                  ),
                  Text(
                    "$value", // Display the current number
                    style: const TextStyle(
                        fontSize: 57,
                        color: Color(0xff6C63FF),
                        fontWeight: FontWeight.w900),
                  ),
                  Slider(
                    thumbColor: const Color(0xff6C63FF),
                    value: _currentValue,
                    min: 50,
                    max: 300,
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
            const SizedBox(
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
                    offset: const Offset(0, 5), // Shadow position
                  ),
                ],
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Gender",
                    style: TextStyle(fontSize: 20, color: Color(0xff081854)),
                  ),
                  ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: Colors.white,
                    fillColor: const Color(0xff6C63FF),
                    color: Colors.black,
                    isSelected: [_selectedGenderIndex == 0, _selectedGenderIndex == 1],
                    onPressed: (index) {
                      setState(() {
                        _selectedGenderIndex = index;
                      });
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Male"),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text("Female"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              width: 350,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  double bmi = number / ((value / 100) * (value / 100));
                  String category = calc(bmi);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(bmi: bmi, text: category),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF081854),
                  backgroundColor: const Color(0xff6C63FF), // Text color
                ),
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}