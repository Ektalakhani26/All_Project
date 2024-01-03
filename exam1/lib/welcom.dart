import 'package:flutter/material.dart';

class Welcom extends StatefulWidget {
  const Welcom({Key? key}) : super(key: key);

  @override
  State<Welcom> createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('welcom to App')),
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Image(image: AssetImage('assets/welcom.jpg')),
          SizedBox(
            height: 50,
          ),
          Text('Thank You!!!!',style: TextStyle(color: Colors.purple,fontSize: 40)),
      ],
      ),
    );
  }
}
