import 'dart:async';

import 'package:demo123/network/db.dart';
import 'package:flutter/material.dart';
import 'package:demo123/utils/colors.dart';
import 'package:demo123/utils/icons.dart';
import 'package:demo123/utils/strings.dart';

Widget commonContaineratt1(context, Map atten) {
  return GestureDetector(
    onTap: atten['onTap'],
    child: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 12,
          width: MediaQuery.of(context).size.width / 2,
          color: att1,
          child: Center(
              child: Text(
            atten['text'],
            style: const TextStyle(fontSize: 20.0),
          )),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 20,
          width: MediaQuery.of(context).size.width / 2,
          color: grey,
          child: Center(
              child: Text(
            atten['title'],
            // style: const TextStyle(fontSize: 15.0),
          )),
        )
      ],
    ),
  );
}



Widget commonContainerdec(context, data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Column(
          children: [

            Container(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1,
              color: white,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 4,
                    color: data['status']
                        ? attgreen
                        : attred,
                    child: Center(
                        child: Text(
                      (data['status']) ? 'Present' : 'Absent',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: white,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                  const SizedBox(width:60.0),
                  Center(
                    child: Text(
                      data['date'] ?? '',
                      style: TextStyle(color: blue, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class December extends StatefulWidget {
  const December({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => December1();
}

class December1 extends State {
  @override
  void initState() {
    super.initState();
    FirebaseApi.selectAtt().then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clrgrey,
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(arrowback),
        ),
        title: Text(
          attendance,
          style: TextStyle(color: white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: FirebaseApi.attendanceList.length,
          itemBuilder: (context, index) {
            return commonContainerdec(
                context, FirebaseApi.attendanceList[index]);
          }),
    );
  }
}

Widget commoncontainerjan(context, day1) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: [
        Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width / 1,
              color: white,
              child: ListTile(
                title: Text(
                  day1['text2'],
                  style: const TextStyle(fontSize: 20.0),
                ),
                trailing: Column(
                  children: [
                    Text(day1['incoming1'],
                        style: const TextStyle(fontSize: 15.0)),
                    const SizedBox(height: 10.0),
                    Text(day1['outcoming1'],
                        style: const TextStyle(fontSize: 15.0)),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 15,
              width: MediaQuery.of(context).size.width / 1,
              color: att1,
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 4,
                    color: attgreen,
                    child: Center(
                        child: Text(
                      present,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: white,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                  const SizedBox(width: 150.0),
                  Center(
                    child: Text(
                      day1['date1'],
                      style:
                          TextStyle(color: blue, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
