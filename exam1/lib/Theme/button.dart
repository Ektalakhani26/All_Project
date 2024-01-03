import 'package:exam1/Theme/firstpage.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 50)),
          TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage(),));
          }, child: Text('first screen'))
        ],
      ),
    );
  }
}

