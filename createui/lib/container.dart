import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(

        body: Container(
          width: 400,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.black,Colors.white],begin: Alignment.centerLeft,end: Alignment.centerRight)),
          child: Column(
              children: [

              ],
          ),
        )
      ),
    );
  }
}
