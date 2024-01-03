import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class Attendenceadmin extends StatefulWidget {
  const Attendenceadmin({Key? key}) : super(key: key);

  @override
  _attendenceState createState() => _attendenceState();
}

class _attendenceState extends State<Attendenceadmin> {
  String toDayDate = "";
  DateTime? dateA;

  _currentDate() {
    dateA = DateTime.now();
    odateA = dateA!.day.toString() ?? "23";
    omonthA = dateA!.month.toString() ?? "56";
    oyearA = dateA!.year.toString() ?? "50";
    setState(() {
      toDayDate = odateA + ' / ' + omonthA + ' / ' + oyearA;
    });
  }

  bool? ab = false;
  var index;

  List<Map> attStudentList = [];

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _currentDate();
  //   MyDataBase.selectUserDataStudent().then((value) {
  //     setState(() {
  //       print(value);
  //     });
  //   });
  // }
  //
  // void initState() {
  //   super.initState();
  //   MyDataBase.selectUserDataattendence(attStudentList).then((value) {
  //     setState(() {});
  //   });
  // }
  void initState() {
    attStudentList.clear();
    studentList.forEach((element) {
      attStudentList.add({
        'Name': element['Name'],
        'Key': element['key'],
        'status': false,
      });
    });
    super.initState();
    _currentDate();
  }

  // //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            arrowback,
            color: white,
          ),
        ),
        title: Text(attendance),
        actions: [
          TextButton(
              onPressed: () {
                MyDataBase.insertAtt(studentsAtt: attStudentList).then((value) {
                  Navigator.pop(context);
                });
              },
              child: Text(
                Submit,
                style: TextStyle(color: white),
              ))
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: blue, width: 1.0),
                color: white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Today Date: ' + toDayDate ?? '',
                  style: TextStyle(color: black, fontSize: 20),
                ),
              ),
              // print(dateA);
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    studentName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Text('Attendence',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ],
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
             // shrinkWrap: true,
            //  physics: NeverScrollableScrollPhysics(),
              itemCount: attStudentList.length,
              itemBuilder: (context, index) => Container(
                height: 60,
                width: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          attStudentList[index]['Name'],
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Checkbox(
                        value: attStudentList[index]['status'],
                        onChanged: (val) {
                          setState(
                            () {
                              attStudentList[index]['status'] =
                                  !attStudentList[index]['status'];
                            },
                          );
                        },
                      ),

                      //             Expanded(
                      //                 child: Text(
                      //                   att[index]['titleA'],
                      //                   style: TextStyle(fontSize: 15),
                      //                 )),
                      //             Padding(
                      //               padding: const EdgeInsets.only(right: 20),
                      //               child: Radio<String>(
                      //                   value: att[index]['Ispresent'],
                      //                   groupValue:  att[index]['Attendence'],
                      //                   onChanged: (val) {
                      //                     setState(() {
                      //                       att[index]['Attendence'] = val.toString();
                      //                     });
                      //                   }),
                      //             ),
                      //             Radio<String>(
                      //                 value: att[index]['IsAbsent'],
                      //                 groupValue:  att[index]['Attendence'],
                      //                 onChanged: (val) {
                      //                   setState(() {
                      //                     att[index]['Attendence'] = val.toString();
                      //                   });
                      //                 }),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //  ),
                      //  ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlwaysDisableFocusNode extends FocusNode {
  bool get hasfocus => false;
}
