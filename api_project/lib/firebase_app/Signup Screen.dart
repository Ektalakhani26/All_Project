import 'package:api_project/firebase_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _login(String name, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if(credential.user!=null){
        print('''
        email : ${credential.user!.email}
        uid : ${credential.user!.uid}
        ''');
      }

    } on FirebaseAuthException catch (e) {
      if(e.code == 'weak-password'){
        print('password provide to week');
      } else if(e.code == 'email-already-in-use'){
        print('the account alredy exits for that email');
      }
    } catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'enter Name',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _emailController,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'enter email',
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'enter Password',
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {
                var name = _nameController.text;
                var email = _emailController.text;
                var password = _passwordController.text;

                _login(name , email , password);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              }, child: Text('Create Account')),
            ],
          ),
        ),
      ),
    );
  }

}
