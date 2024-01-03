import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';


class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  TaskPage createState() => TaskPage();
}

class TaskPage extends State<Task> {
  File? file;
  UploadTask? task1;


  String t1 = '1';
  String t2 = '2';
  String t3 = '3';
  String pro = '1';

  Widget commonContainertask(context, int index, Function() onTap) {
    pro = MyDataBase.taskdata[index]['static'] == 'Pending' ||
            MyDataBase.taskdata[index]['static'] == null
        ? '1'
        : MyDataBase.taskdata[index]['static'] == 'Development'
            ? '2'
            : '3';
    return Card(
      elevation: 4,
      color: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: clrgrey, width: 2)),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Topic : ${MyDataBase.taskdata[index]['topicname'] ?? ''}',
                  style: TextStyle(color: black, fontSize: 18),
                ),
                trailing: Text(
                  'Date : ${MyDataBase.taskdata[index]['date'] ?? ''}',
                  style: TextStyle(color: black, fontSize: 18),
                ),
              ),
              Text(
                'Task : ${MyDataBase.taskdata[index]['task'] ?? ''}',
                style: TextStyle(color: black, fontSize: 13),
              ),
              SizedBox(height: 15),
              Text(
                'Duedate : ${MyDataBase.taskdata[index]['duedate'] ?? ''}',
                style: TextStyle(color: black, fontSize: 13),
              ),
              SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Pending'),
                  Radio(
                      value: t1,
                      groupValue: pro,
                      onChanged: (val) {
                        setState(() {
                          MyDataBase.taskdata[index]['static'] = 'Pending'.toString();
                        });
                      }),
                  Text('Develoment'),
                  Radio(
                      value: t2,
                      groupValue: pro,
                      onChanged: (val) {
                        setState(() {
                          MyDataBase.taskdata[index]['static'] = 'Development'.toString();
                        });
                      }),
                  Text('Finish'),
                  Radio(
                      value: t3,
                      groupValue: pro,
                      onChanged: (val) {
                        setState(() {
                          MyDataBase.taskdata[index]['static'] = 'Finish'.toString();
                        });
                      }),

                ],
              ),
              MaterialButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                height: 45,
                color: blue,
                onPressed: () {},
                child: Text(
                  Submit,
                  style: TextStyle(color: white),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    MyDataBase.selectDatatask().then((value) {
      print(MyDataBase.taskdata.length);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          task,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            arrowback,
            color: white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: MyDataBase.taskdata.length,
          itemBuilder: (context, index) {
            return commonContainertask(context, index, () {
              //selectFile(index);
            });
          }),
    );
  }
}
