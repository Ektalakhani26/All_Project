//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LogInPage extends StatefulWidget {
//   const LogInPage({Key? key}) : super(key: key);
//
//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }
//
// class _LogInPageState extends State<LogInPage> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isDoctor = false;
//   bool _isPatient = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               child: Image(
//                 image: AssetImage("assets/screen2.jpg"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.25,
//               left: 20.0,
//               right: 20.0,
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     maxRadius: 60,
//                     backgroundImage: AssetImage('assets/icon login2.jpg'),
//                   ),
//                   SizedBox(height: 30),
//                   TextField(
//                     decoration: InputDecoration(
//                       prefixIcon: Container(
//                         padding: EdgeInsets.all(10.0),
//                         child: Icon(Icons.email, color: Colors.black),
//                       ),
//                       hintText: "Enter Email Id",
//                       labelText: 'E-Mail ',
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 18.0),
//                   TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       prefixIcon: Container(
//                         padding: EdgeInsets.all(10.0),
//                         child: Icon(Icons.lock, color: Colors.black),
//                       ),
//                       hintText: "Enter Password",
//                       labelText: 'Password',
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {
//
//                     },
//                     child: Text(
//                       "Log In",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 19,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     style: ButtonStyle(
//                       fixedSize: MaterialStateProperty.all<Size>(
//                         Size(240.0, 50.0),
//                       ),
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.white70,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {
//
//                     },
//                     child: Row(
//                       children: [
//                          Container(
//                             height: 60,
//                             width: 60,
//                             decoration: ShapeDecoration(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30),
//
//                               ),
//                             ),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.black,
//                               child: Image(
//                                 image: AssetImage("assets/google_logo.png"),
//                                 width: 30,
//                                 height: 30,
//                               ),
//                             )
//                         ),
//                         Text(
//                           "Log In with Google",
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 19,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                     style: ButtonStyle(
//                       shape: MaterialStateProperty.all<OutlinedBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
//                         ),
//                       fixedSize: MaterialStateProperty.all<Size>(
//                         const Size(260.0, 50.0),
//                       ),
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:appointment/Pages/SignUp_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isDoctor = false;
  bool _isPatient = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              top: MediaQuery.of(context).size.height * 0.25,
              left: 20.0,
              right: 20.0,
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: AssetImage('assets/icon login2.jpg'),
                  ),
                  SizedBox(height: 30),
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

                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Log In",
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
                        Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.black,
                      ),
                      Text('or login with',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage("assets/google_white_logo.png"),
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        //SizedBox(width: 5),
                        Text(
                          "Log In with Google",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                        Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an Account?",style: TextStyle(
                          fontSize: 18
                      )),
                      TextButton(
                        onPressed: () {
                          // Add your registration logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()), // Replace 'RegistrationScreen' with the actual screen you want to navigate to
                          );
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
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
