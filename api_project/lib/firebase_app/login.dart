
import 'package:api_project/Examplejsontodart/api_example.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Signup Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _uname = TextEditingController();
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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      errorTxtPass = null;
      errorTxtEmail = null;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form1,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                  },
                  controller: _uname,
                  decoration: InputDecoration(
                    errorText: errorTxtEmail,
                    hintText: 'enter email',

                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  validator: (value) {
                  },
                  controller: _pass,
                  decoration: InputDecoration(
                    errorText: errorTxtPass,
                    hintText: 'enter Password',
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: () {
                 var name = _uname.text;
                  var pass = _pass.text;
                  if(form1.currentState!.validate()){
                    print('ok');
                    _login( name, pass);
                  }

                  //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                }, child: Text('login')),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? '),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    }, child: Text('Signup'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

