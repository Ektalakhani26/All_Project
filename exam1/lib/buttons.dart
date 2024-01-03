import 'package:exam1/Drawer.dart';
import 'package:exam1/login.dart';
import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
   var value1="name";
  // var value2="false";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('!!Fields!!')),
      body:Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
            },
            child: Text('login page'),
          ),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Drawer1(),));
          }, child: Text('Drawer')),

          RadioListTile(value: 'name', groupValue: value1, onChanged: (value) {
            value1= value!;
            setState(() {

            });
        },title: Text('Light'),),
          RadioListTile(value: 'Dark', groupValue: value1, onChanged: (value) {
            value1=value!;
            setState(() {

            });
          },title: Text('Dark'),),
        ],
      ),
    );
  }
}
