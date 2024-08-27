import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  double bmi;
  String text;
  Result({super.key, required this.bmi, required this.text});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late String text;

  @override
  Widget build(BuildContext context) {
    // Splitting BMI into integer part and decimal part
    int integerPart = widget.bmi.truncate(); // Extracts the integer part
    String decimalPart = (widget.bmi - integerPart).toStringAsFixed(2).substring(1); // Extracts the decimal part

    return Scaffold(
      backgroundColor: const Color(0xFFF4F3FF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "BMI CALCULATOR",
                style: TextStyle(fontSize: 20, color: Color(0xff081854)),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Body Mass Index",
                style: TextStyle(fontSize: 30, color: Color(0xff081854)),
              ),
              const SizedBox(
                height: 38,
              ),
              Container(
                width: 360,
                height: 450,
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
                    Column(
                      children: [
                        const Text(
                          "BMI Results",
                          style: TextStyle(fontSize: 30, color: Color(0xff081854)),
                        ),
                        SizedBox(
                          width: 270,
                          height: 170,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$integerPart", // Displaying the integer part
                                style: const TextStyle(
                                  fontSize: 150,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff6C63FF),
                                ),
                              ),
                              Text(
                                decimalPart, // Displaying the decimal part
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6C63FF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${widget.text} BMI",
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Column(
                      children: [
                        Text("Underweight: BMI less than 18.5"),
                        Text("Normal weight: BMI 18.5 to 24.9"),
                        Text("Overweight: BMI 25 to 29.9"),
                        Text("Obesity: 30 to 40")
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              SizedBox(
                width: 350,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF081854), backgroundColor: const Color(0xff6C63FF), // Text color
                  ),
                  child: const Text(
                    "Calculate again",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}