import 'package:exam1/Theme/themedata.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView'),
      ),
      body: PageView(
        children: [
          Center(
            child: Container(
              child: Text('First Page',style: myTextstyle40()),
              color: Colors.green,
            ),
          ),
          Center(
            child: Container(
              child: Text('Second Page',style: myTextstyle40()),
              color: Colors.red,
            ),
          ),
          Center(
            child: Container(
              child: Text('Third Page',style: myTextstyle40()),
              color: Colors.purple,
            ),
          ),
          Center(
            child: Container(
              child: Text('Forth Page',style: myTextstyle40()),
              color: Colors.amber,
            ),
          ),
          Center(
            child: Container(
              child: Text('Fifth Page',style: myTextstyle40()),
              color: Colors.pinkAccent,
            ),
          ),
          Center(
            child: Container(
              child: Text('Six Page',style: myTextstyle40()),
              color: Colors.orange,
            ),
          ),
          SevenPage(),
        ],
      ),
    );
  }

  SevenPage() {
    return Center(
      child: Container(
        child: Text('Seven Page',style: myTextstyle40()),
        color: Colors.indigo,
      ),
    );
  }
}



