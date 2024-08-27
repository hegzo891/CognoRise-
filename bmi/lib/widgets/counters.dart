import 'package:flutter/material.dart';

class Counters extends StatefulWidget {
  final String title;

  const Counters({super.key, required this.title});

  @override
  State<Counters> createState() => _CountersState();
}

class _CountersState extends State<Counters> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 175,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            spreadRadius: 0.5, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 5), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            widget.title, // Access the title using widget.title
            style: TextStyle(fontSize: 20, color: Color(0xff081854)),
          ),
          Text(
            "$number", // Display the current number
            style: TextStyle(
                fontSize: 57,
                color: Color(0xff6C63FF),
                fontWeight: FontWeight.w900),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 5,),
              IconButton(
                  onPressed: () {
                    setState(() {
                      number--;
                    });
                  },
                  icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xff081854),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ))),
              IconButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  icon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xff081854),
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
              SizedBox(width: 5,)
            ],
          )
        ],
      ),
    );
  }
}