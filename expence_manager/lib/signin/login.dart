
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screen/homeScreen.dart';
import '../main.dart';
import 'registration.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);
   var username1;
   var password1;
   LoginPage.Mydata({required this.username1,required this.password1});

  @override
  State<LoginPage> createState() => _LoginPageState(username1,password1);
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  var form1 = GlobalKey<FormState>();
  var password = true;
  var username1;
  var password1;

  _LoginPageState(this.username1, this.password1);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: form1,
      child: Scaffold(
        body: Column(
          children: [
                Expanded(
                  child: Stack(
                  children: [
                    Container(
                      height: size.height,
                      width: size.width,
                      child: Image(image: AssetImage('assets/blue.jpg'),fit: BoxFit.fill,),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Container(
                                height: size.height/5,
                                  child: Image(image: AssetImage('assets/login1.png'))),
                            ),
                            Padding(
                              padding:  EdgeInsets.all(20),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter the value';
                                  } else if (username1 != _username.text) {
                                    return 'username are not same';
                                  }
                                },
                                controller: _username,
                                decoration: InputDecoration(
                                    hintText: 'username',
                                //  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(Icons.person_outline_rounded),
                                  border: OutlineInputBorder(borderSide: BorderSide(width: 4,color: Colors.transparent),borderRadius: BorderRadius.circular(200)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: TextFormField(
                                controller: _password,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'enter the value';
                                  } else if (password1 != _password.text) {
                                    return 'password are not same';
                                  }
                                },
                                obscureText: password,
                                decoration: InputDecoration(
                                  fillColor: Colors.pinkAccent,
                                  label: Text('Password'),
                                  hintText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outline),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {});
                                      password = !password;
                                    },
                                    child: Icon(
                                        password
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility,
                                        color: Colors.blueAccent),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(200)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 200,bottom: 60),
                              child: TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStatePropertyAll(
                                          EdgeInsets.only(left: 0))),
                                  onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage(),));
                                  },
                                  child: Text('Signin',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),)),
                            ),
                            ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white54)),
                                onPressed: () async{
                                  if (form1.currentState!.validate()) {
                                    if (username1 == _username.text &&
                                        password1 == _password.text) {
                                      SharedPreferences pref = await SharedPreferences.getInstance();
                                      pref.setBool(SpalcScreenState.login, true);
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                                      });
                                    }
                                  }
                                },
                                child: Text('\t\t\t\t\t\t\tLogin\t\t\t\t\t\t\t',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ),
          ],
        )
      ),
    );
  }
}
