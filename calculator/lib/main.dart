import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  // Import this for orientation lock
import 'package:provider/provider.dart';
import 'package:calculator/providers/themeProvider.dart';
import 'package:calculator/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider(),)],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}