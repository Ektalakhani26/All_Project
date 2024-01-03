import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Screens/example/signup-screen.dart';

import 'acual-home-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  var _error = null;

  //final _loginFormKey = GlobalKey<FormState>();
  Future<void> _signin(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (credential.user != null) {
        print('LOGIN SUCCESSFULL');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ActualHomeScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      print('Printing all options');
      print('credential : ${e.credential}');
      print('Email : ${e.email}');
      print('Message : ${e.message}');


      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('The email address is not registered.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  errorText: _error,
                  border: OutlineInputBorder(),
                  hintText: 'Email Address'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
            ),
            ElevatedButton(
                onPressed: () async {
                  _signin(_emailController.text, _passController.text);
                },
                child: Text('Sign In')),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t Have an Account Yet? '),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Text(
                      'Cteate Now',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
