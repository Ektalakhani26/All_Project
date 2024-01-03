import 'package:demo123/screens/login.dart';
import 'package:demo123/utils/colors.dart';
import 'package:flutter/material.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHomePage();
  }

  void navigateToHomePage() async {
    await Future.delayed(
      const Duration(seconds:1),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: SizedBox(
            height: 450.0,
            width: 400.0,
            child: Image.asset('assett/logo.PNG'),
          ),
        ),
      ),
    );
  }
}
