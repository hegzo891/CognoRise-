import 'package:bmi/screens/home.dart';
import 'package:bmi/screens/welcome.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const Welcome(),
      initialRoute: "welcome",
      routes:{
        "welcome" : (context) => const Welcome(),
        "home" : (context) => const Home(),

      },
    );
  }
}
