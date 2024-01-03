import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  var name;

   SecondScreen({Key? key, required  this.name}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState(name);
}

class _SecondScreenState extends State<SecondScreen> {
  var name;
  _SecondScreenState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('name is : ${name}'),
          ],
        ),
      ),
    );
  }
}
