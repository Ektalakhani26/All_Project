import 'package:demo123/screens/dashboard.dart';
import 'package:demo123/screens/splacescreen.dart';
import 'package:demo123/utils/strings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var chaek = pref.getString('name');
  userEmail = pref.getString('user') ?? '';
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: chaek == null ? const SplashScreen() : DashBord(),
      ),
    ),
  );
}
