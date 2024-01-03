
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Pages/Select_Page.dart';
void main()=> runApp(MyApp());
// void main()async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

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


