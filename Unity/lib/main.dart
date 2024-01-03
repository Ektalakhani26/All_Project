import 'package:flutter/material.dart';
import 'package:unity/firstapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/':(context) => firstApp(),
      },
     // home: firstApp(),
    );
  }
}
