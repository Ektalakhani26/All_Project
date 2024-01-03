import 'package:demo123/network/db.dart';
import 'package:flutter/material.dart';
import 'package:demo123/utils/colors.dart';
import 'package:demo123/utils/icons.dart';
import 'package:demo123/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class MaterialStudent extends StatefulWidget {
  const MaterialStudent({Key? key}) : super(key: key);

  @override
  MaterialStudentState createState() => MaterialStudentState();
}

class MaterialStudentState extends State<MaterialStudent> {

  Widget common2(context,index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 4,
          color: white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                children: [
                  Text(
                    MyDataBase.mlink[index]['topic'].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: black),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  GestureDetector(onTap: ()=>launch(MyDataBase.mlink[index]['link'].toString(),),
                    child: Text( MyDataBase.mlink[index]['link'].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void initState() {
    super.initState();
    MyDataBase.selectDatalink().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(arrowback, size: 25, color: white),
        ),
        title: Padding(
          padding: EdgeInsets.all(70.0),
          child: Text(
            material,
            style: TextStyle(color: white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: MyDataBase.mlink.length,
          itemBuilder: (context, index) {
            return common2(context ,index);
          }),
    );
  }
}
