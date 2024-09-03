import 'package:bmi/screens/home.dart'; // Ensure this path is correct
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget { // Capitalized class name
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6C63FF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "BodyMetrics",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 35,
                ),
              ),
            ),
            Image.asset(
              "lib/assets/img.png", 
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 50),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Get Started with Tracking Your Health!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Text(
                    "Calculate your BMI and stay on top of your wellness journey, effortlessly.",
                    style: TextStyle(color: Color(0xFFC6C3F9), fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 350,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createPageRoute());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF081854),
                  backgroundColor: Colors.white, // Text color
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, color: Color(0xFF081854)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageRouteBuilder _createPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Home(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve));
        var opacityAnimation = animation.drive(tween);
        return FadeTransition(opacity: opacityAnimation, child: child);
      },
    );
  }
}