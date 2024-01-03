import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:intl/intl.dart';
import '../HomeScreen.dart';

class ActualHomeScreen extends StatefulWidget {
  const ActualHomeScreen({super.key});

  @override
  State<ActualHomeScreen> createState() => _ActualHomeScreenState();
}

var _userEmail;
var _userId;
late DateTime datePicked;
TextEditingController _notesContoller = TextEditingController();
late DatabaseReference ref;

_logOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null)
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
  });
}

class _ActualHomeScreenState extends State<ActualHomeScreen> {

  _getUserInfo() async {
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _userEmail = user?.email;
      _userId = user?.uid;

      print('USER ID IS : $_userId');
    });
  }

  Future<void> _addData(String text, DateTime datePicked) async {
    await ref.child('user-node').child(_userId).set({'Date' : datePicked.toString(), 'Notes': text}).then((value) => (value) {
      print('Data Saved Successfully');
    });
  }

  _readData() async {
    await _getUserInfo();
    final snapshot = await ref.child('user-node').child(_userId).get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datePicked = DateTime.now();
    ref = FirebaseDatabase.instance.ref();
    _readData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: LoadingAnimationWidget.waveDots(
                  color: Colors.deepOrange, size: 100),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              actions: [
                PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'logout') {
                      _logOut(context);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Logout'),
                      value: 'logout',
                    )
                  ],
                )
              ],
              title: Text(_userEmail
                  .toString()
                  .substring(0, _userEmail.toString().indexOf('@'))),
            ),
            body: Padding(
              padding: EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [

                  Text('To Do List',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 22,
                          fontWeight: FontWeight.w900)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () async {
                          datePicked = await _showDatePicker(context);
                          //print(DateFormat('yMMMMEEEEd').format(datePicked!));
                          setState(() {});
                        },
                        child: Icon(Icons.date_range),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(DateFormat('yMMMMEEEEd')
                              .format(datePicked)
                              .toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _notesContoller,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Your Notes',
                      hintStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      //disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {

                        _addData(_notesContoller.text, datePicked);

                      }, child: Text('Add Note')),
                      ElevatedButton(
                          onPressed: () {}, child: Text('Update Note')),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Container(
                      color: Colors.blue.shade100,

                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  _showDatePicker(BuildContext context) async {
    DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    return datePicked;
  }


}
