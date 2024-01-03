import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify/Screens/Loginwithdifferentways/signin_firebases.dart';

import '../HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  var errorTxtPass = null;
  var errorTxtEmail = null;
  var error;
  _login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      if(credential.user!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }

    } on FirebaseAuthException catch (e) {
      print('Code is : ${e.code}');
      if (e.code == 'USER-NOT-FOUND') {
        print('No user found for that email.');
      } else if (e.code == 'weak-password') {
        print('password provide to week');
      } else if (e.code == 'email-already-in-use') {
        print('the account already exits for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong Password');
      } else if(e.code == 'invalid-email'){
        print('Invalide Email Address');
      } else if(e.code == 'INVALID_LOGIN_CREDENTIALS'){
        error = e.message.toString();
        print('Invalide Lognin detailssss');
        errorTxtPass = 'Invalide Lognin details';
        errorTxtEmail = 'Invalide Lognin details';
      }
      else{
        setState(() {
          errorTxtPass = '';
          errorTxtEmail = '';

        });
      }


    } catch (e){
      print(e);
    }
  }
  var form1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: form1,
      child: SafeArea(
        child: Scaffold(
          body: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10,top: 50),
                child: Text('Email or username',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Password',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                child: TextFormField(
                  controller: _pass,
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white10),
                      fixedSize: MaterialStatePropertyAll(Size(size.width/3, 40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                    ),
                        onPressed: () {
                      var email = _email.text;
                      var password = _pass.text;
                      if(form1.currentState!.validate()){
                        print('ok');
                        _login( email, password);
                      }
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                        }, child: Text('Log in')),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('If You dont have account ?? '),
                    ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black12),
                      fixedSize: MaterialStatePropertyAll(Size(size.width/3, 40)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                    ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignInWithFire(),));
                        }, child: Text('SignIn')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
