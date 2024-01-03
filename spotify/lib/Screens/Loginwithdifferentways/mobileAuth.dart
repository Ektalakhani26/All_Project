import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../Widgets/Txt.dart';
import '../HomeScreen.dart';

class MobileAuth extends StatefulWidget {
  @override
  _MobileAuthState createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
  Country? _selectedCountry;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _phoneNumberController = TextEditingController();
  String verificationId = '';

  /* Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      _auth.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone verification failed: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verificationId, [int? forceResendingToken]) {
      this.verificationId = verificationId;
      print('Please check your phone for the verification code.');
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await _auth.verifyPhoneNumber(
      phoneNumber: _selectedCountry!.callingCode + _phoneNumberController.text,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }*/
  Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      _auth.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException authException) {
      print('Phone verification failed: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verificationId, [int? forceResendingToken]) {
      this.verificationId = verificationId;
      print('Please check your phone for the verification code.');
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    String phoneNumber = '+${_selectedCountry?.callingCode}${_phoneNumberController.text}'; // Ensure you add a "+" at the beginning.

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }


  Future<void> verifyOTP(String otp) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(), // Replace with your home screen widget
        ),
      );
    } catch (e) {
      print('Error verifying OTP: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    initCountry();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onPressed() async {
    final country = await Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return PickerPage();
    }));
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Txt('Enter phone number', fontSize: 30, fontWeight: FontWeight.w700),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.black, border: BorderDirectional(bottom: BorderSide(color: Colors.white24, width: 1))),
                height: size.height / 15,
                width: size.width * 0.9,
                child: Text('${_selectedCountry?.name ?? ""}', style: TextStyle(fontSize: 18),),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: _onPressed,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.black, border: BorderDirectional(end: BorderSide(color: Colors.white24, width: 1))),
                      height: size.height / 12 - 1,
                      width: size.width * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '(${_selectedCountry?.callingCode ?? ""})',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 19),
                      child: Container(
                        color: Colors.black,
                        child: TextFormField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Enter Phone Number',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text("We'll send you a code by SMS to confirm your phone number."),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, right: 10),
                child: Text("We may occasionally send you service-based message."),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  fixedSize: MaterialStateProperty.all(Size(size.width / 3, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  verifyPhone();
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(),));
                  _settingModalBottomSheet(context);
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      isScrollControlled:true,
      builder: (BuildContext bc) {
        return Container(
          height: 900,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  // Handle validation or checks here
                },
                onSubmit: (String verificationCode) {
                  verifyOTP(verificationCode);
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  fixedSize: MaterialStateProperty.all(Size(120, 40)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {
                  // Call verifyOTP function here
                },
                child: Text('Submit', style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PickerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Country'),
      ),
      body: Container(
        child: CountryPickerWidget(
          onSelected: (country) => Navigator.pop(context, country),
        ),
      ),
    );
  }
}

