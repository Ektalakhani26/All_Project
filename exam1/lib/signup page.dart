import 'package:exam1/buttons.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
          .copyWith(
              secondary: Colors.green,
              onSecondary: Colors.black,
              onPrimary: Colors.white)
          .copyWith(brightness: Brightness.light),

         drawerTheme: DrawerThemeData(
           shadowColor: Colors.blue,
           shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),gapPadding: 500),
           //endShape: OutlineInputBorder(gapPadding: 50),
           scrimColor://Color.fromRGBO(30, 30, 30, 30)
            Color.fromARGB(0, 255, 0, 0),
           surfaceTintColor: Colors.black,
         ),

        textTheme: TextTheme(
        //  bodyLarge: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,color: Colors.red),
         // bodyMedium: TextStyle(fontSize: 30),
          bodySmall: TextStyle(fontSize: 20,color: Colors.deepPurpleAccent),
        ),
      ),
      title: 'Material App',
      home: Scaffold(
       // appBar: AppBar(title: Text('Fields!!!!!!!!!!')),
         body: Buttons(),
        // bottomNavigationBar: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.cabin),label: ''),
        //   BottomNavigationBarItem(icon: Icon(Icons.cabin),label: ''),
        //   BottomNavigationBarItem(icon: Icon(Icons.cabin),label: ''),
        // ],
        // ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          
        },child: Icon(Icons.add)),
      ),
    );
  }
}
