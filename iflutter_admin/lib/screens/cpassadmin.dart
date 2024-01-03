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
class cpass extends StatefulWidget {
  const cpass({Key? key}) : super(key: key);

  @override
  _cpassState createState() => _cpassState();
}

class _cpassState extends State<cpass> {
  final key1 = GlobalKey<FormState>();

  TextEditingController opasscontroller = TextEditingController();
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController renewpasscontroller = TextEditingController();

  bool passChange = true;
  bool passChange1 = true;
  bool passChange2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(arrowback)),
        title: Text(rpass),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assett/logo.PNG'),
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              Form(
                  key: key1,
                  child: Column(
                    children: [
                      sizeBox(50.0),
                      sizeBox(10.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          oldpasswordtitle,
                          style: TextStyle(fontSize: 18, color: blue),
                        ),
                      ),
                      sizeBox(10.0),
                      Txtfield(
                        validate: (val) => validatePassword(val),
                        obscuretxt: passChange,
                        controllervalue: opasscontroller,
                        hinttxt: oldpassword,
                        labletxt: enterpass,
                        suffixic: IconButton(
                          onPressed: () {
                            setState(() {
                              passChange = !passChange;
                            });
                          },
                          icon: Icon(
                            passChange == false ? logineye : logineyeonoff,
                            color: blue,
                          ),
                        ),
                      ),
                      sizeBox(10.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          newpasswordtitle,
                          style: TextStyle(fontSize: 18, color: blue),
                          //textAlign: TextAlign.left,
                        ),
                      ),
                      sizeBox(10.0),
                      Txtfield(
                        validate: (val) => validatePassword(val),
                        obscuretxt: passChange1,
                        controllervalue: newpasscontroller,
                        hinttxt: newpassword,
                        labletxt: enterpass,
                        suffixic: IconButton(
                          onPressed: () {
                            setState(() {
                              passChange1 = !passChange1;
                            });
                          },
                          icon: Icon(
                            passChange1 == false ? logineye : logineyeonoff,
                            color: blue,
                          ),
                        ),
                      ),
                      sizeBox(10.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          reenterpass,
                          style: TextStyle(fontSize: 18, color: blue),
                          //textAlign: TextAlign.left,
                        ),
                      ),
                      sizeBox(10.0),
                      Txtfield(
                        // validate: (val) => validatePassword(val),
                        validate: (val) {
                          if (val!.isEmpty) {
                            return 'Please re-enter your new password';
                          }
                          if (val != newpasscontroller.text) {
                            return 'Password must be same..';
                          }
                          return null;
                        },
                        obscuretxt: passChange2,
                        controllervalue: renewpasscontroller,
                        hinttxt: reenterpassword,
                        labletxt: enterpass,
                        suffixic: IconButton(
                          onPressed: () {
                            setState(() {
                              passChange2 = !passChange2;
                            });
                          },
                          icon: Icon(
                            passChange2 == false ? logineye : logineyeonoff,
                            color: blue,
                          ),
                        ),
                      ),
                      sizeBox(50.0),
                    ],
                  )),
              MaterialButton(
                height: 50,
                minWidth: 150,
                color: blue,
                onPressed: () {
                  if (key1.currentState!.validate()) {
                    opasscp = opasscontroller.text;
                    newpasscp = newpasscontroller.text;
                    repasscp = renewpasscontroller.text;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: blue,
                        duration: Duration(seconds: 3),
                        content: Text(
                          resetsuccess,
                          style: TextStyle(color: white),
                        ),
                      ),
                    );
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return dashBoardAdmin();
                    }));
                  }

                  setState(() {});
                },
                child: Text(rbtn,
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
