import 'package:alarm/Colors/MyColors.dart';
import 'package:alarm/Providers/theme.dart';
import 'package:alarm/widgets/analog_watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          gradient: themeProvider.dark
              ? MyColors.scaffoldDark
              : MyColors.scaffoldlight,
        ),
        child: Column(
          children: [
            // Switch(
            //   value: themeProvider.dark,
            //   onChanged: (_) {
            //     themeProvider.toggleTheme();
            //   },
            // ),
            SizedBox(height: 40,),
            const AnalogWatch(),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xfff1f1f2),
                      Color(0xffebecf0),
                      Color(0xffebecf0),
                      Color(0xffe2e4eb),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(
                    width: 2.5,
                    color: const Color(0xfff6f6fa),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alarms",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                        //  color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.maxFinite,
                        height: 80,
                      ),
                      const Spacer(), // This pushes the button to the bottom
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),  // Shadow color with opacity
                                offset: Offset(4, 7),  // Offset of the shadow (right and down)
                                blurRadius: 8,  // Blur radius of the shadow
                                spreadRadius: 3,  // Optional: How much the shadow should spread
                              ),
                            ],
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffEEF0F5),  // Start color of gradient
                                Color(0xffE6E9EF),
                                Color(0xffE6E9EF)// End color of gradient
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),  // Match the button's border radius
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your button action here
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              backgroundColor: Colors.transparent, // Make the button background transparent
                              shadowColor: Colors.transparent, // Remove button shadow
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),  // Match the container's border radius
                              ),
                            ),
                            child: Text(
                              'Add New',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Color(0xff646E82),  // Text color
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}