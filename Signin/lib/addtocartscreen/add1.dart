import 'package:flutter/material.dart';

class Add1 extends StatefulWidget {
  const Add1({Key? key}) : super(key: key);

  @override
  State<Add1> createState() => _Add1State();
}

class _Add1State extends State<Add1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(title: Text('Pannkh')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.height/3,
                  width: size.width,
                  child: Image(image: AssetImage('assets/t-shirt.jpg'),fit: BoxFit.fill,)),
            ],
          ),
        ),
      ),
    );
  }
}
