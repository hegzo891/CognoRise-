import 'package:bmi/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

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
            SizedBox(height: 50,),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Text(
                    "Get Started with Tracking Your Health!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
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
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20, color: Color(0xFF081854)),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF081854), backgroundColor: Colors.white, // Text color
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
      pageBuilder: (context, animation, secondaryAnimation) => home(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
