// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify/Screens/HomeScreen.dart';

import '../Loginwithdifferentways/LoginScreen.dart';
import '../Loginwithdifferentways/mobileAuth.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        return user;
      }

    } catch (error) {
      print(error);
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    final Gradient gradient = LinearGradient(
      colors: [Colors.white12, Colors.black12,Colors.black12,Colors.black26, ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white10,
      body:  SingleChildScrollView(
        child: Container(
          height: size.height,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 35,
                  backgroundImage:  AssetImage('assets/spotify.jpeg'),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 100),
                  child: Text('Millions of songs.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 35)),
                ),
                Text('Free on Spotify.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 35)),
                SizedBox(height: 50),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green),
                    fixedSize: MaterialStatePropertyAll(Size(size.width/1.2, 40)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                ),
                    onPressed: () {

                    }, child: Text('Sign up for free',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),)),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black12),
                  fixedSize: MaterialStatePropertyAll(Size(size.width/1.2, 40)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                ),
                    onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MobileAuth(),));
                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(flex: 1,),
                        SizedBox(width: 10,),
                        Icon(Icons.phone_android),
                        Spacer(flex: 2,),
                        Text('Continue with phone number',style: TextStyle(fontWeight: FontWeight.w700),),
                        Spacer(flex: 2,),
                      ],
                    )),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black12),
                  fixedSize: MaterialStatePropertyAll(Size(size.width/1.2, 40)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                ),
                    onPressed: () {
                  setState(() {
                    signInWithGoogle();
                  });
                    }, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(flex: 1,),
                        Image(image: AssetImage('assets/googlelogo.png'),height: 25),
                        Spacer(flex: 2,),
                        Text('Continue with Google',style: TextStyle(fontWeight: FontWeight.w700),),
                        Spacer(flex: 2,),
                      ],
                    )),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black12),
                  fixedSize: MaterialStatePropertyAll(Size(size.width/1.2, 40)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

                ),
                    onPressed: () {

                    }, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(flex: 1,),
                        Icon(Icons.facebook,color: Colors.blue,),
                        Spacer(flex: 2,),
                        Text('Continue with Facebook',style: TextStyle(fontWeight: FontWeight.w700),),
                        Spacer(flex: 2,),
                      ],
                    )),
                SizedBox(height: 30),

                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Text('Log in',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
