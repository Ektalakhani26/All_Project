
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';

Widget commonContainer(context, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 9,
      color: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: clrgrey, width: 2)),
      shadowColor: blue,
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: MediaQuery.of(context).size.width / 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Topicname :${ MyDataBase.examdata[index]['topicname'] ?? ''}',
                  style: TextStyle(color: black, fontSize: 18),
                ),
                trailing: Text(
                  'Date : ${ MyDataBase.examdata[index]['date'] ?? ''}',
                  style: TextStyle(color: black, fontSize: 18),
                ),
              ),
              GestureDetector(onTap:()=>launch(MyDataBase.examdata[index]['link']) ,
                child: Center(
                    child: Text(
                  'Link : ${ MyDataBase.examdata[index]['link'] ?? ''}',
                  style: TextStyle(color: grey, fontSize: 13),
                )),
              ),
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Time : ${MyDataBase.examdata[index]['time'] ?? ''}',
                  style: TextStyle(color: black, fontSize: 13),
                ),
              ),
              SizedBox(height: 17),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget commonContainer1(context, index, Color clr) {

  return Padding(
    padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
    child: Container(
      height: MediaQuery.of(context).size.height / 9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
        color: clr,
        boxShadow: [
          BoxShadow(
            color: blue.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          title: Text(
            'Topicname : ${ MyDataBase.resultdata[index]['topicname']}',
            style: TextStyle(
                color: blue, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          subtitle: Text(
            'Date  : ${ MyDataBase.resultdata[index]['date']}',
            style: TextStyle(color: blue, fontSize: 16),
          ),
          trailing: Text(
            MyDataBase.resultdata[index]['mark'],
            style: TextStyle(
                color: blue, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ),
    ),
  );
}

class Exam extends StatefulWidget {
  const Exam({Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Exam> {
  @override
  void initState() {
    super.initState();
    MyDataBase.selectDataexam().then((value) {
      setState(() {});
    });
    MyDataBase.selectDataresult().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blue,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(arrowback, color: white)),
          title: Text(
            examresult,
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: exam,
              ),
              Tab(
                text: result,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
                itemCount: MyDataBase.examdata.length,
                itemBuilder: (context, index) {
                  return commonContainer(context, index);
                }),
            ListView.builder(
                itemCount: MyDataBase.resultdata.length,
                itemBuilder: (context, index) {
                  return commonContainer1(context, index, white);
                }),
          ],
        ),
      ),
    );
  }
}
