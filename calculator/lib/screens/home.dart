import 'package:calculator/providers/themeProvider.dart';
import 'package:calculator/utilities/postfix.dart';
import 'package:calculator/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../utilities/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String text = "0";
  double size = 80;
  String text2 = "";
  String res = "";
  Evaluate b = Evaluate();
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void write(String symbol) {
    setState(() {
      if (symbol == "×" ||
          symbol == "÷" ||
          symbol == "+" ||
          symbol == "–" ||
          symbol == "%") {
        res += " $symbol ";
      } else {
        res += symbol;
      }
      if (text == "0") {
        text = "";
        text += symbol;
      } else {
        text += symbol;
      }

      int length = text.length;

      if (length > 7) {
        size = 70;
      } else if (length > 10) {
        size = 50;
      } else if (length > 14) {
        size = 40;
      } else {
        size = 80;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });
  }

  void calculate(String t) {
    String result = b.result(t.split(" "));
    double number = double.parse(result);

    // Create a NumberFormat instance with the desired settings
    var formatter = NumberFormat()
      ..maximumFractionDigits = 4
      ..minimumFractionDigits = 0;

    // Format the number
    String formattedResult;
    if (number.abs() >= 1e+6 || number.abs() < 1e-4) {
      // Use scientific notation for very large or very small numbers
      formattedResult = number.toStringAsExponential(4);
    } else {
      // Use regular notation with up to 4 decimal places
      formattedResult = formatter.format(number);
    }

    text2 = text;
    text = formattedResult;
  }

  @override
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
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              const SizedBox(
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
                      activeColor: const Color(0xff4B5EFC),
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
                      color: themeProvider.dark
                          ? Colors.white
                          : const Color(0xff4B5EFC),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 4,
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment:
                  CrossAxisAlignment.end, // Align text to the right
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        text2,
                        style: GoogleFonts.assistant(
                          textStyle:
                          const TextStyle(fontSize: 40, color: Colors.grey),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        child: Align(
                          alignment: Alignment
                              .centerRight, // Keep text aligned to the right
                          child: Text(
                            text,
                            style: GoogleFonts.assistant(
                              textStyle:
                              TextStyle(fontSize: size, color: colorText),
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          value: 'C',
                          onClicked: () {
                            setState(() {
                              res = "";
                              text = "0";
                              text2 = "";
                            });
                          },
                          color: themeProvider.dark
                              ? CustomColors.mainButtonsDark
                              : CustomColors.mainButtonsLight,
                        ),
                        GestureDetector(
                          onTap: () {
                            List<String> split = res.split(" ");
                            if (split[split.length - 1][0] != "-") {
                              split[split.length - 1] =
                              "-${split[split.length - 1]}"; // [98, *, -6]
                            } else {
                              split[split.length - 1] =
                                  split[split.length - 1].substring(1);
                            }
                            res = split.join(" ");
                            setState(() {
                              if (text2.isEmpty) {
                                text = res.replaceAll(" ", "");
                              }
                            });
                          },
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
                            if (text[text.length - 1] != "×" &&
                                text[text.length - 1] != "÷" &&
                                text[text.length - 1] != "+" &&
                                text[text.length - 1] != "–" &&
                                text[text.length - 1] != "%") {
                              write("%");
                            }
                          },
                          color: themeProvider.dark
                              ? CustomColors.mainButtonsDark
                              : CustomColors.mainButtonsLight,
                        ),
                        Button(
                          value: '÷',
                          onClicked: () {
                            if (text[text.length - 1] != "×" &&
                                text[text.length - 1] != "÷" &&
                                text[text.length - 1] != "+" &&
                                text[text.length - 1] != "–" &&
                                text[text.length - 1] != "%") {
                              write("÷");
                            }
                          },
                          color: const Color(0xff4B5EFC),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          value: '7',
                          onClicked: () {
                            setState(() {
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text[text.length - 1] != "×" &&
                                  text[text.length - 1] != "÷" &&
                                  text[text.length - 1] != "+" &&
                                  text[text.length - 1] != "–" &&
                                  text[text.length - 1] != "%") {
                                write("×");
                              }
                            });
                          },
                          color: const Color(0xff4B5EFC),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          value: '4',
                          onClicked: () {
                            setState(() {
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text[text.length - 1] != "×" &&
                                  text[text.length - 1] != "÷" &&
                                  text[text.length - 1] != "+" &&
                                  text[text.length - 1] != "–" &&
                                  text[text.length - 1] != "%") {
                                write("–");
                              }
                            });
                          },
                          color: const Color(0xff4B5EFC),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          value: '1',
                          onClicked: () {
                            setState(() {
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text2.isNotEmpty &&
                                  (text[text.length - 1] != "×" &&
                                      text[text.length - 1] != "÷" &&
                                      text[text.length - 1] != "+" &&
                                      text[text.length - 1] != "–" &&
                                      text[text.length - 1] != "%")) {
                                res = "";
                                text = "";
                                text2 = "";
                              }
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
                              if (text[text.length - 1] != "×" &&
                                  text[text.length - 1] != "÷" &&
                                  text[text.length - 1] != "+" &&
                                  text[text.length - 1] != "–" &&
                                  text[text.length - 1] != "%") {
                                write("+");
                              }
                            });
                          },
                          color: const Color(0xff4B5EFC),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          value: '.',
                          onClicked: () {
                            setState(() {
                              // Split the text by operators to get the last number segment
                              List<String> segments = text.split(RegExp(r'[×÷+–%]'));
                              String lastSegment = segments.last;

                              // Only allow adding a decimal point if the last number segment doesn't already contain one
                              if (!lastSegment.contains(".") &&
                                  text[text.length - 1] != "×" &&
                                  text[text.length - 1] != "÷" &&
                                  text[text.length - 1] != "+" &&
                                  text[text.length - 1] != "–" &&
                                  text[text.length - 1] != "%" &&
                                  text[text.length - 1] != ".") {
                                write(".");
                              }
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
                              calculate(res);
                            });
                          },
                          color: const Color(0xff4B5EFC),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
