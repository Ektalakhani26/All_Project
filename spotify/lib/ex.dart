// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// //
// //
// // import 'package:flutter/material.dart';
// //
// // import 'Screens/HomeScreen.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Material App',
// //       home: PhoneAuthScreen(),
// //     );
// //   }
// // }
// //
// // class PhoneAuthScreen extends StatefulWidget {
// //   @override
// //   _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
// // }
// //
// // class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final TextEditingController _phoneNumberController = TextEditingController();
// //   final TextEditingController _otpController = TextEditingController();
// //   final TextEditingController _otpController2 = TextEditingController();
// //   final TextEditingController _otpController3 = TextEditingController();
// //   final TextEditingController _otpController4 = TextEditingController();
// //   final TextEditingController _otpController5 = TextEditingController();
// //   final TextEditingController _otpController6 = TextEditingController();
// //
// //   String verificationId = '';
// //
// //   Future<void> verifyPhone() async {
// //     final PhoneVerificationCompleted verified = (AuthCredential authResult) {
// //       _auth.signInWithCredential(authResult);
// //     };
// //
// //     final PhoneVerificationFailed verificationFailed =
// //         (FirebaseAuthException authException) {
// //       print('Phone verification failed: ${authException.message}');
// //     };
// //
// //     final PhoneCodeSent smsSent = (String verificationId, [int? forceResendingToken]) {
// //       this.verificationId = verificationId;
// //       print('Please check your phone for the verification code.');
// //     };
// //
// //     final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
// //       this.verificationId = verId;
// //     };
// //
// //     await _auth.verifyPhoneNumber(
// //       phoneNumber: _phoneNumberController.text,
// //       timeout: const Duration(seconds: 60),
// //       verificationCompleted: verified,
// //       verificationFailed: verificationFailed,
// //       codeSent: smsSent,
// //       codeAutoRetrievalTimeout: autoTimeout,
// //     );
// //   }
// //
// //   Future<void> signInWithOTP() async {
// //     final otp =
// //         "${_otpController.text}${_otpController2.text}${_otpController3.text}${_otpController4.text}${_otpController5.text}${_otpController6.text}";
// //     AuthCredential authCredential = PhoneAuthProvider.credential(
// //       verificationId: verificationId,
// //       smsCode: otp.toString(),
// //     );
// //
// //     try {
// //       await _auth.signInWithCredential(authCredential);
// //       print('Phone number verified successfully');
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => HomeScreen(),
// //         ),
// //       );
// //     } catch (e) {
// //       print('Error verifying phone number: $e');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Phone Authentication'),
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Expanded(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 TextField(
// //                   controller: _phoneNumberController,
// //                   keyboardType: TextInputType.phone,
// //                   decoration: InputDecoration(
// //                     labelText: 'Phone Number',
// //                   ),
// //                 ),
// //                 SizedBox(height: 16),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     verifyPhone();
// //                   },
// //                   child: Text('Send OTP'),
// //                 ),
// //                 SizedBox(height: 16),
// //                 Row(
// //                   children: [
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: TextField(
// //                           controller: _otpController,
// //                           keyboardType: TextInputType.number,
// //                           decoration: InputDecoration(
// //                             labelText: 'Enter OTP',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: TextField(
// //                           controller: _otpController2,
// //                           keyboardType: TextInputType.number,
// //                           decoration: InputDecoration(
// //                             labelText: 'Enter OTP',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: TextField(
// //                           controller: _otpController3,
// //                           keyboardType: TextInputType.number,
// //                           decoration: InputDecoration(
// //                             labelText: 'Enter OTP',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: TextField(
// //                           controller: _otpController4,
// //                           keyboardType: TextInputType.number,
// //                           decoration: InputDecoration(
// //                             labelText: 'Enter OTP',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: TextField(
// //                           controller: _otpController5,
// //                           keyboardType: TextInputType.number,
// //                           decoration: InputDecoration(
// //                             labelText: 'Enter OTP',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     Expanded(
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: TextField(
// //                           controller: _otpController6,
// //                           keyboardType: TextInputType.number,
// //                           decoration: InputDecoration(
// //                             labelText: 'Enter OTP',
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 16),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     signInWithOTP();
// //                   },
// //                   child: Text('Verify OTP'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FirstScreen(),
//     );
//   }
// }
//
// class FirstScreen extends StatefulWidget {
//   @override
//   _FirstScreenState createState() => _FirstScreenState();
// }
//
// class _FirstScreenState extends State<FirstScreen> {
//   String welcomeMessage = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Screen'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SecondScreen()),
//                 );
//               },
//               child: Text('Go to Second Screen'),
//             ),
//             SizedBox(height: 20),
//             Text(welcomeMessage),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void updateWelcomeMessage() {
//     setState(() {
//       welcomeMessage = 'Welcome back from Second Screen!';
//     });
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Update the welcome message on the first screen when popping the second screen
//     (context as Element).findAncestorStateOfType<_FirstScreenState>()?.updateWelcomeMessage();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Screen'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter DataTable Example'),
      ),
      body: Center(
        child: DataTable(
          border: TableBorder.all(width: 1),
          dataRowMaxHeight: double.infinity,
          //dataRowMinHeight: 100,
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              numeric: true,
            ),
            DataColumn(
              label: Text(
                //maxLines: 50,
                'Role',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: const <DataRow>[

            DataRow(
              cells: <DataCell>[
                DataCell(
                  SizedBox(
                    height: 100, // Adjust this value to set the height of the Text widget
                    child: Column(
                      children: [
                        Text('Ravi'),
                        Text('Ravi'),
                        Text('Ravi'),
                        Text('Ravi'),
                        Text('Ravi'),
                      ],
                    ),
                  ),
                ),
                DataCell(Text('19')),
                DataCell(Text('Student')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Jane')),
                DataCell(Text('43')),
                DataCell(Text('Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Professor')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}