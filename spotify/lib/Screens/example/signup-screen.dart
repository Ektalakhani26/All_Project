
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //final _signupFormKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  var _emailerrormsg = null;
  var _passerrormsg = null;
  var _nameerrormsg = null;

  Future<void> _login(String emailAddress, String password) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (credential.user != null) {
        print(credential.user?.uid);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      print('ERROR : ${e.code}');
      if (e.code == 'weak-password') {
        setState(() {
          _passerrormsg = 'The password provided is too weak.';
        });
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _passerrormsg = null;
          _emailerrormsg = 'The account already exists for that email.';
        });
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
                errorText: _nameerrormsg,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email Address',
                errorText: _emailerrormsg,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passController,
              decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Password',
                errorText: _passerrormsg,
              ),
            ),
            ElevatedButton(
                onPressed: ()  {
                  print('button Clicked');
                  if(_nameController.text=='' || _nameController.text==null) {
                    setState(() {
                      _nameerrormsg = 'Name cannot be Empty';
                    });
                  }else if(_emailController.text=='' || _emailController.text==null) {
                    setState(() {
                      _emailerrormsg = 'Email cannot be Empty';
                    });
                  }
                  else if(_passController.text=='' || _passController.text==null){
                    setState(() {
                      _emailerrormsg = null;
                      _passerrormsg = 'Password cannot be Empty';
                    });
                  }
                  else{
                    _login(_emailController.text, _passController.text);
                  }

                  /*await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passController.text)
                        .then((value) => (value) {
                          print(value);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  )).onError((error, stackTrace) {
                                print('ERROR IS : $error');
                              });
                            });
                  */
                },
                child: Text('Sign Up')),
          ],
        ),
      ),
    );
  }
}
