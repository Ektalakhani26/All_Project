import 'package:appointment/Pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage("assets/screen2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).size.height * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      hintText: "Enter Name ",
                      labelText: 'Name ',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 18.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.call, color: Colors.black),
                      ),
                      hintText: "Enter Mobile Number",
                      labelText: 'Mobile Number',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 18.0),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.email, color: Colors.black),
                      ),
                      hintText: "Enter Email Id",
                      labelText: 'E-Mail ',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 18.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.lock, color: Colors.black),
                      ),
                      hintText: "Enter Password",
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 18.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.lock, color: Colors.black),
                      ),
                      hintText: "Confirm Password",
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 18.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.lock, color: Colors.black),
                      ),
                      hintText: "Enter Birth Date",
                      labelText: 'Date of Birth',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        Size(270.0, 50.0),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
