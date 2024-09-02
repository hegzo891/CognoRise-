import 'package:alarm/Providers/theme.dart';
import 'package:alarm/Screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider(),)],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
