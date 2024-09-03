import 'package:calculator/providers/themeProvider.dart';
import 'package:calculator/widgets/buttons.dart';
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
  String text = "";
  double size = 90;
  String text2 = "";
  String Operations = "";
  final ScrollController _scrollController = ScrollController();
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void write(symbol) {
    setState(() {
      text += symbol;

      int length = text.length;

      if (length > 7) {
        size = 80;
      } else if (length > 10) {
        size = 60;
      } else if (length > 14) {
        size = 50;
      } else {
        size = 100;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });
  }

  void calculate(text) {

  }

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Color colorText = themeProvider.dark ? Colors.white : Colors.black;

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
                      activeColor: Color(0xff4B5EFC),
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
                      color:
                          themeProvider.dark ? Colors.white : Color(0xff4B5EFC),
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
                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.end,  // Align text to the right
                  children: [
                    Text(
                      "$text2",
                      style: GoogleFonts.assistant(
                        textStyle: TextStyle(fontSize: 40, color: Colors.grey),
                      ),
                    ),
                    SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        child: Align(
                          alignment: Alignment.centerRight, // Keep text aligned to the right
                          child: FittedBox(
                            fit: BoxFit.scaleDown, // Scale down text to fit without changing position
                            child: Text(
                              "$text",
                              style: GoogleFonts.assistant(
                                textStyle: TextStyle(fontSize: size, color: colorText),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            onTap: () {},
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: themeProvider.dark
                                      ? CustomColors.mainButtonsDark
                                      : CustomColors.mainButtonsLight,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Image.asset(
                                themeProvider.dark
                                    ? "assets/img.png"
                                    : "assets/img_2.png",
                                width: 35,
                                height: 35,
                              )),
                            ),
                          ),
                          Button(
                            value: '%',
                            onClicked: () {
                              write("%");
                            },
                            color: themeProvider.dark
                                ? CustomColors.mainButtonsDark
                                : CustomColors.mainButtonsLight,
                          ),
                          Button(
                            value: '÷',
                            onClicked: () {
                              write("÷");
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
                            value: '7',
                            onClicked: () {
                              setState(() {
                                write("7");
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
                                write("8");
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
                                write("9");
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
                                write("×");
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
                                write("4");
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
                                write("5");
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
                                write("6");
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
                                write("–");
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
                                write("1");
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
                                write("2");
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
                                write("3");
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
                                write("+");
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
                                write(".");
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
                                write("0");
                              });
                            },
                            color: themeProvider.dark
                                ? CustomColors.numbersDark
                                : CustomColors.numbersLight,
                          ),
                          GestureDetector(
                            onTap: () {
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
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Image.asset(
                                themeProvider.dark
                                    ? "assets/img_1.png"
                                    : "assets/img_3.png",
                                width: 40,
                                height: 40,
                              )),
                            ),
                          ),
                          Button(
                            value: '=',
                            onClicked: () {
                              setState(() {
                                calculate(text);
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
