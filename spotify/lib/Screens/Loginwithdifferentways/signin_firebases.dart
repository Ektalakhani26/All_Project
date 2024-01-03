
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class SignInWithFire extends StatefulWidget {
  const SignInWithFire({super.key});

  @override
  State<SignInWithFire> createState() => _SignInWithFireState();
}

class _SignInWithFireState extends State<SignInWithFire> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  Future<void> _signin(String name, String email, String pass, String contact) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Enter Name',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter Email',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5),
            child: TextFormField(
              controller: _passController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Enter Password',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 10,right: 10,top: 5),
            child: TextFormField(
              controller: _contactController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'Enter Contact Number',
                  border: OutlineInputBorder()
              ),
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white10),
            fixedSize: MaterialStatePropertyAll(Size(size.width/3, 40)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

          ),
              onPressed: () {
                var name = _nameController.text;
                var email = _emailController.text;
                var pass = _passController.text;
                var contact = _contactController.text;
                _signin(name,email,pass,contact);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              }, child: Text('Sign in')),
        ],
      ),
    );
  }


}