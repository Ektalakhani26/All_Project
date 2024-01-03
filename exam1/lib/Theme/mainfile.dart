import 'package:exam1/Theme/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MaterialColor mycolor = MaterialColor(0xFF8C9EFF, <int, Color>{
    50: Color(0xFF8C9EFF),
    100: Color(0xFF8C9EFF),
    200: Color(0xFF8C9EFF),
    300: Color(0xFF8C9EFF),
    400: Color(0xFF8C9EFF),
    500: Color(0xFF8C9EFF),
    600: Color(0xFF8C9EFF),
    700: Color(0xFF8C9EFF),
    800: Color(0xFF8C9EFF),
    900: Color(0xFF8C9EFF),
  });

  void initState() {
    // TODO: implement initState
   // super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(onPrimary: Colors.white,secondary: Colors.purpleAccent),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 200,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
           // shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStatePropertyAll(Colors.blue.shade900),
            textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
          ),
        ),

        checkboxTheme: CheckboxThemeData(

        )
      ),


      home: Scaffold(
        body: Button(),
      ),
    );
  }
}