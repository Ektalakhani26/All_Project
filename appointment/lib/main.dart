import 'package:appointment/Pages/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'Pages/Select_Page.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // theme: ThemeData(primarySwatch: Colors.purple),
      home: Selection_Page(),
    );
  }
}


