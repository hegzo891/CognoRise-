import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/note_provider.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/providers/user_provider.dart';
import 'package:todo/screens/home.dart';



void main(){
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => theme_provider(),),
        ChangeNotifierProvider(create: (context) => Userprovider(),),
        ChangeNotifierProvider(create: (context) => noteprovider(),)

      ],
      child: Consumer<theme_provider>(
          builder: (context, provider, child)
          {
            return MaterialApp(
              home: first_screen(),
              theme: provider.islighttheme ? ThemeData.dark():ThemeData.light(),
              debugShowCheckedModeBanner: false,
            );

          }

      ),
    );

  }
}
