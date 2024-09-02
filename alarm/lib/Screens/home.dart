import 'package:alarm/Colors/MyColors.dart';
import 'package:alarm/Providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: themeProvider.dark ? MyColors.scaffoldDark : MyColors.scaffoldlight
        ),
        child: Column(
          children: [
            Switch(value: themeProvider.dark, onChanged: (_){themeProvider.toggleTheme();})
          ],
        ),
      ),
    );
  }
}
