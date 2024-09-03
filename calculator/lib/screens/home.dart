import 'package:calculator/providers/themeProvider.dart';
import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../myColors/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  String text = " ";

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
            color: themeProvider.dark
                ? CustomColors.scaffoldDark
                : CustomColors.scaffoldLight),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Stack(
                alignment: themeProvider.dark
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Switch(
                      value: themeProvider.dark,
                      onChanged: (_) {
                        themeProvider.toggleTheme();
                      },
                    ),
                  ),
                  Positioned(
                    left: themeProvider.dark ? 4 : null,
                    right: themeProvider.dark ? null : 4,
                    child: Icon(
                      themeProvider.dark ? Icons.nights_stay : Icons.wb_sunny,
                      color: themeProvider.dark ? Colors.yellow : Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("1258.2", style: GoogleFonts.assistant(textStyle: TextStyle(fontSize: 40, color: Colors.grey))),
                    Text("$text", style: GoogleFonts.assistant(textStyle: TextStyle(fontSize: 100, color: themeProvider.dark ? Colors.white : Colors.black)))

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            value: 'C',
                            onClicked: () {
                              setState(() {
                                text = " ";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.mainButtonsDark
                                : CustomColors.mainButtonsLight,
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: themeProvider.dark
                                      ? CustomColors.mainButtonsDark
                                      : CustomColors.mainButtonsLight,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: Center(child: Image.asset("assets/img.png", width: 35, height: 35,)),

                            ),
                          ),
                          Button(
                            value: '%',
                            onClicked: () {},
                            color: themeProvider.dark
                                ? CustomColors.mainButtonsDark
                                : CustomColors.mainButtonsLight,
                          ),
                          Button(
                            value: '÷',
                            onClicked: () {},
                            color: Color(0xff4B5EFC),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            value: '7',
                            onClicked: () {
                              setState(() {
                                text += "7";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '8',
                            onClicked: () {
                              setState(() {
                                text += "8";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '9',
                            onClicked: () {
                              setState(() {
                                text += "9";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '×',
                            onClicked: () {
                              setState(() {
                                text += "×";
                              });
                            },
                            color: Color(0xff4B5EFC),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            value: '4',
                            onClicked: () {
                              setState(() {
                                text += "4";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '5',
                            onClicked: () {
                              setState(() {
                                text += "5";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '6',
                            onClicked: () {
                              setState(() {
                                text += "6";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '–',
                            onClicked: () {
                              setState(() {
                                text += "–";
                              });
                            },
                            color: Color(0xff4B5EFC),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            value: '1',
                            onClicked: () {
                              setState(() {
                                text += "1";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '2',
                            onClicked: () {
                              setState(() {
                                text += "2";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '3',
                            onClicked: () {
                              setState(() {
                                text += "3";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '+',
                            onClicked: () {
                              setState(() {
                                text += "+";
                              });
                            },
                            color: Color(0xff4B5EFC),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Button(
                            value: '.',
                            onClicked: () {
                              setState(() {
                                text += ".";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          Button(
                            value: '0',
                            onClicked: () {
                              setState(() {
                                text += "0";
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                text = text.substring(0, text.length - 1);
                              });

                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: themeProvider.dark
                                      ? CustomColors.numbersDark
                                      : CustomColors.numbersLight,
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child: Center(child: Image.asset("assets/img_1.png", width: 40, height: 40,)),

                            ),
                          ),
                          Button(
                            value: '=',
                            onClicked: () {
                              setState(() {
                                text += "=";
                              });
                            },
                            color: Color(0xff4B5EFC),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
