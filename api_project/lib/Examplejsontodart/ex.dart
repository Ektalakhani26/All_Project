import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_app/HomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



// void main()  {
//   WidgetsFlutterBinding.ensureInitialized(); // Required for Firebase.initializeApp()
//    Firebase.initializeApp(); // Initialize Firebase
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
    );
  }
}


/*class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
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
        if(user != null)
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
      }

    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height,
                  child:
                  const Padding(
                    padding:  EdgeInsets.only(top: 70),
                    child: Image(
                      alignment: Alignment.topLeft,
                      image:AssetImage("assets/gaana2.jpg"),
                    ),
                  ),
                ),
                const Padding(
                  padding:  EdgeInsets.fromLTRB(10, 250, 0, 0),
                  child: Text(
                    'Login/Register to create personalised',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(10,400,0,0),
                  child: ListTile(
                    // selected: _selectedindex==2,

                    tileColor: Colors.red,
                    //selectedTileColor: Colors.teal.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    onTap: () {
                      //  onMenuItemClick(2);
                    },
                    leading: Container(
                        height: 24,
                        width: 40,
                        child : Text('+91',style: TextStyle(fontSize: 22,color: Colors.white),)
                      // Icon(Icons.transit_enterexit,color: Colors.green.shade800,size: 28),
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(8),
                      //   color: Colors.black,
                      // ),
                    ),
                    title: Text("Enter your number",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,530,0,0),
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white38,
                      ),
                      child: Text('Login with OTP',style: TextStyle(color: Colors.white54,fontSize: 25,
                          fontWeight: FontWeight.bold)),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 640),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.white38,
                      ),
                      Text('or login with',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white54),),
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.white38,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 670),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child: Container(
                                height: 70,
                                width: 70,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    side: BorderSide(
                                        width: 2,
                                        color: Colors.white38
                                    ),
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Image(
                                    image: AssetImage('assets/logo google.png'),
                                    width: 35,
                                    height: 35,
                                  ),
                                )
                            ),
                            onTap: (){
                              //_handleSignIn();
                              signInWithGoogle();
                            },
                          ),
                          Text('Google',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              height: 70,
                              width: 70,
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                    side: BorderSide(
                                        width: 2,
                                        color: Colors.white38
                                    ),
                                  )
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Image(
                                  image: AssetImage('assets/email1.jpg'),
                                  width: 45,
                                  height: 45,
                                ),
                              )
                          ),
                          Text('Email',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
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
        if(user != null){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          print('hduhdejklsk');
        }

      }

    } catch (error) {
      print(error);
      return null;
    }
  }

  // FacebookAuth facebookAuth = FacebookAuth.instance;
  //
  // String userData = "User data will appear here";
  //
  // Future<void> loginWithFacebook() async {
  //   final LoginResult result = await facebookAuth.login();
  //
  //   switch (result.status) {
  //     case LoginStatus.success:
  //       final AccessToken? accessToken = result.accessToken;
  //       final userData = await facebookAuth.getUserData();
  //       setState(() {
  //         this.userData = userData.toString();
  //         Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
  //       });
  //       break;
  //     case LoginStatus.cancelled:
  //       setState(() {
  //         userData = "Login cancelled by user";
  //       });
  //       break;
  //     case LoginStatus.failed:
  //       setState(() {
  //         userData = "Login failed";
  //       });
  //       break;
  //     case LoginStatus.operationInProgress:
  //     // Handle the login operation in progress
  //       break;
  //   }
  // }

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
                 // backgroundImage:  AssetImage('assets/spotify.jpeg'),
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
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => MobileAuth(),));
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
                      //  Image(image: AssetImage('assets/googlelogo.png'),height: 25),
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
                     // loginWithFacebook();
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
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



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome'),
      ),
    );
  }
}