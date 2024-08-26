import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F3FF),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text("Age"),
                  Text("$number"),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                          number--;
                        });
                      }, icon: Icon(Icons.remove))
                    ],
                  )


                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}
