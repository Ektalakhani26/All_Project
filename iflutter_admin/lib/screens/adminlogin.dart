
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class loginadmin extends StatefulWidget {
  const loginadmin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Project1();
}

class Project1 extends State {
  final key1 = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // bool passText =true;
  bool passChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              children: [
                Form(
                  key: key1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assett/logo.PNG')),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          wlcflt,
                          style: TextStyle(fontSize: 30.0),
                        ),
                        const SizedBox(height: 25),
                        const SizedBox(height: 35),
                        TextFormField(
                          controller: usernameController,
                          validator: (val) {
                            return (val!.isEmpty) ? plsenteruser : null;
                          },
                          decoration: InputDecoration(
                            hintText: enterurunm,
                            labelText: unm,
                            fillColor: org,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: blue,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passController,
                          validator: (val) => validatePassword(val),
                          obscureText: passChange,
                          decoration: InputDecoration(
                              labelText: password,
                              hintText: enterpassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passChange = !passChange;
                                  });
                                },
                                icon: Icon(
                                  passChange == false
                                      ? logineye
                                      : logineyeonoff,
                                  color: blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: blue,
                                  width: 2.0,
                                ),
                              )),
                        ),
                        // ],
                        //  ),

                        Padding(
                          padding:
                              const EdgeInsets.only(top: 30.0, bottom: 30.0),
                          child: MaterialButton(
                            minWidth: 150.0,
                            height: 40.0,
                            color: blue,
                            onPressed: () async {
                              await getvalue(
                                  usernameController.text, passController.text);
                              if (key1.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => dashBoardAdmin(),
                                    ));
                              }
                            },
                            child: Text(login, style: TextStyle(color: white)),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     const SizedBox(height: 50),
                        //     Text(forgoturpass),
                        //     TextButton(
                        //       onPressed: () {
                        //         setState(() {
                        //           Navigator.of(context).push(
                        //             MaterialPageRoute(
                        //               builder: (context) {
                        //                 return Forget();
                        //               },
                        //             ),
                        //           );
                        //         });
                        //       },
                        //       child: Text(
                        //         resethere,
                        //         style: TextStyle(color: org),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Forget extends StatefulWidget {
//   const Forget({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => Forget1();
// }
//
// class Forget1 extends State {
//   GlobalKey<FormState> key = GlobalKey<FormState>();
//
//   TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blue,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(arrowback),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           child: Container(
//             decoration: BoxDecoration(
//               color: white, //background color of box
//               boxShadow: [
//                 BoxShadow(
//                   color: blue,
//                   blurRadius: 6.0, // soften the shadow
//                   spreadRadius: 0.5, //extend the shadow
//                   offset: Offset(
//                     3.0, // Move to right 10  horizontally
//                     3.0, // Move to bottom 10 Vertically
//                   ),
//                 )
//               ],
//             ),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 30.0),
//                 child: Column(
//                   children: [
//                     Form(
//                       key: key,
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 100),
//                           Text(forgotpass,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 30.0,
//                               )),
//                           const SizedBox(height: 30),
//                           Text(description),
//                           const SizedBox(height: 40),
//                           TextFormField(
//                             validator: (val) => validateEmail(val),
//                             controller: emailController,
//
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               hintText: enteruremail,
//                               labelText: email,
//                             ),
//                             // validator: (val) => validateEmail(val),
//                           ),
//                           SizedBox(height: 20.0),
//                           Padding(
//                               padding: const EdgeInsets.only(
//                                   top: 30.0,
//                                   right: 70.0,
//                                   left: 30.0,
//                                   bottom: 50.0)),
//                           Center(
//                             child: MaterialButton(
//                               minWidth: 80.0,
//                               height: 40.0,
//                               color: blue,
//                               onPressed: () {
//                                 {
//                                   if (key.currentState!.validate()) {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                         builder: (context) {
//                                           return Code();
//                                         },
//                                       ),
//                                     );
//                                   }
//                                 }
//                               },
//                               child: Text(
//                                 sendotp,
//                                 style: TextStyle(fontSize: 20.0, color: white),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Code extends StatefulWidget {
//   const Code({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => Code1();
// }
//
// class Code1 extends State {
//   final bool autoFocus = true;
//   final key = GlobalKey<FormState>();
//
//   TextEditingController otp1 = TextEditingController();
//   TextEditingController otp2 = TextEditingController();
//   TextEditingController otp3 = TextEditingController();
//   TextEditingController otp4 = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blue,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(arrowback),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: white, //background color of box
//                 boxShadow: [
//                   BoxShadow(
//                     color: blue,
//                     blurRadius: 6.0,
//                     spreadRadius: 0.5,
//                     offset: Offset(
//                       3.0,
//                       3.0,
//                     ),
//                   )
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(verifycode,
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24.0,
//                         )),
//                     const SizedBox(height: 50),
//                     Form(
//                       key: key,
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: TextFormField(
//                             controller: otp1,
//                             validator: (val) {
//                               return (val!.isEmpty) ? 'enter' : null;
//                             },
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               } else {
//                                 if (value.length == 0) {
//                                   FocusScope.of(context).previousFocus();
//                                 }
//                               }
//                             },
//                             autofocus: autoFocus,
//
//                             maxLength: 1,
//                             keyboardType: TextInputType.phone,
//                             textAlign: TextAlign.center,
//                             // style: const TextStyle(color:Color(0xffF36F24)),
//                             decoration: const InputDecoration(
//                               counterText: '',
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide()),
//                             ),
//                           )),
//                           const SizedBox(width: 15.0),
//                           Expanded(
//                               child: TextFormField(
//                             controller: otp2,
//                             validator: (val) {
//                               return (val!.isEmpty) ? 'enter' : null;
//                             },
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               } else {
//                                 if (value.length == 0) {
//                                   FocusScope.of(context).previousFocus();
//                                 }
//                               }
//                             },
//                             maxLength: 1,
//                             keyboardType: TextInputType.phone,
//                             textAlign: TextAlign.center,
//                             //style: const TextStyle(color:Color(0xffF36F24)),
//                             decoration: InputDecoration(
//                               counterText: '',
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide()),
//                             ),
//                           )),
//                           const SizedBox(width: 15.0),
//                           Expanded(
//                               child: TextFormField(
//                             controller: otp3,
//                             validator: (val) {
//                               return (val!.isEmpty) ? 'enter' : null;
//                             },
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               } else {
//                                 if (value.length == 0) {
//                                   FocusScope.of(context).previousFocus();
//                                 }
//                               }
//                             },
//                             maxLength: 1,
//                             keyboardType: TextInputType.phone,
//                             textAlign: TextAlign.center,
//                             // style: const TextStyle(color:Color(0xffF36F24) ),
//                             decoration: InputDecoration(
//                               counterText: '',
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide()),
//                             ),
//                           )),
//                           const SizedBox(width: 15.0),
//                           Expanded(
//                               child: TextFormField(
//                             controller: otp4,
//                             validator: (val) {
//                               return (val!.isEmpty) ? 'enter' : null;
//                             },
//                             onChanged: (value) {
//                               if (value.length == 1) {
//                                 FocusScope.of(context).nextFocus();
//                               } else {
//                                 if (value.length == 0) {
//                                   FocusScope.of(context).previousFocus();
//                                 }
//                               }
//                             },
//                             maxLength: 1,
//                             keyboardType: TextInputType.phone,
//                             textAlign: TextAlign.center,
//                             // style: const TextStyle(color: Color(0xffF36F24)),
//                             decoration: InputDecoration(
//                               counterText: '',
//                               enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide()),
//                             ),
//                           )),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         const SizedBox(height: 70),
//                         Text(
//                           verificationcode,
//                           style: TextStyle(fontSize: 20.0),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             resendotp,
//                             style: TextStyle(fontSize: 20.0, color: blue),
//                           ),
//                         ),
//                         const SizedBox(width: 130),
//                         Container(
//                           height: 50,
//                           width: 100,
//                           color: blue,
//                           child: IconButton(
//                               onPressed: () {
//                                 if (key.currentState!.validate()) {
//                                   otpp1 = otp1.text;
//                                   otpp2 = otp2.text;
//                                   otpp3 = otp3.text;
//                                   otpp4 = otp4.text;
//                                   Navigator.of(context).push(
//                                       MaterialPageRoute(builder: (context) {
//                                     return Password();
//                                   }));
//                                 }
//
//                                 setState(() {});
//                               },
//                               icon: Icon(
//                                 arrowforword,
//                                 size: 35,
//                                 color: white,
//                               )),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Password extends StatefulWidget {
//   const Password({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => Password1();
// }
//
// class Password1 extends State {
//   bool Passchange = true;
//   bool pass1Text = true;
//   bool confText = true;
//
//   GlobalKey<FormState> key = GlobalKey<FormState>();
//   TextEditingController newpass1Controller = TextEditingController();
//   TextEditingController confnewpassController = TextEditingController();
//   bool passChange = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blue,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(arrowback),
//         ),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               padding: EdgeInsets.all(8.0),
//               margin: EdgeInsets.all(8.0),
//               height: MediaQuery.of(context).size.height / 1.6,
//               decoration: BoxDecoration(
//                 color: white, //background color of box
//                 boxShadow: [
//                   BoxShadow(
//                     color: blue,
//                     blurRadius: 6.0, // soften the shadow
//                     spreadRadius: 0.5, //extend the shadow
//                     offset: Offset(
//                       3.0, // Move to right 10  horizontally
//                       3.0, // Move to bottom 10 Vertically
//                     ),
//                   )
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Column(
//                     children: [
//                       Form(
//                         key: key,
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 50),
//                             Text(resetpass,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 30.0,
//                                 )),
//                             const SizedBox(height: 50),
//                             Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   enterpass,
//                                   style: TextStyle(
//                                       color: blue,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 )),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: newpass1Controller,
//                               validator: (value) => validatePassword(value),
//                               obscureText: passChange,
//                               decoration: InputDecoration(
//                                   labelText: reenterpass,
//                                   hintText: enterpassword,
//                                   suffixIcon: IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         passChange = !passChange;
//                                       });
//                                     },
//                                     icon: Icon(
//                                       passChange == false
//                                           ? logineye
//                                           : logineyeonoff,
//                                       color: blue,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     borderSide: BorderSide(
//                                       color: blue,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     borderSide: BorderSide(
//                                       color: blue,
//                                       width: 2.0,
//                                     ),
//                                   )),
//                             ),
//                             const SizedBox(height: 20),
//                             Align(
//                                 alignment: Alignment.topLeft,
//                                 child: Text(
//                                   reenterpass,
//                                   style: TextStyle(
//                                       color: blue,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500),
//                                 )),
//                             const SizedBox(height: 10),
//                             TextFormField(
//                               controller: confnewpassController,
//                               // validator: (value) => validatePassword(value),
//                               validator: (val) {
//                                 if (val!.isEmpty) {
//                                   return 'Please re-enter your new password';
//                                 }
//                                 if (val != newpass1Controller.text) {
//                                   return 'Password must be same..';
//                                 }
//                                 return null;
//                               },
//                               obscureText: passChange,
//                               decoration: InputDecoration(
//                                   labelText: confirmpass,
//                                   // prefixIcon: Icon(loginlock),
//                                   hintText: enterpassword,
//                                   suffixIcon: IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         passChange = !passChange;
//                                       });
//                                     },
//                                     icon: Icon(
//                                       passChange == false
//                                           ? logineye
//                                           : logineyeonoff,
//                                       color: blue,
//                                     ),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     borderSide: BorderSide(
//                                       color: blue,
//                                     ),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     borderSide: BorderSide(
//                                       color: blue,
//                                       width: 2.0,
//                                     ),
//                                   )),
//                             ),
//                             Padding(
//                                 padding: const EdgeInsets.only(
//                                     top: 30.0,
//                                     right: 80.0,
//                                     left: 30.0,
//                                     bottom: 50.0)),
//                             Center(
//                               child: MaterialButton(
//                                 minWidth: 120.0,
//                                 height: 40.0,
//                                 color: blue,
//                                 onPressed: () {
//                                   if (key.currentState!.validate()) {
//                                     npasspass = newpass1Controller.text;
//                                     confpasspass = confnewpassController.text;
//
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(builder: (context) {
//                                       return dashBoardAdmin();
//                                     }));
//                                   }
//
//                                   setState(() {});
//                                 },
//                                 child:
//                                     Text(save, style: TextStyle(color: white)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
