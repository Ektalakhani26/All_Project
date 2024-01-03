
import 'package:flutter/material.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';


Widget commonContainernotice(context, Map data, Color clr) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            children: [

              Text('Announcement detail : ${ data['anndetail']}')
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: clr,
            boxShadow: [
              BoxShadow(
                color: blue.withOpacity(0.6), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 3, // blur radius
                offset: Offset(3, 3), // changes position of shadow

              )
            ],
          ),
          child: Center(
            child: ListTile(

              title: Text(data['topicname']??'',
                // data['title'],
                style: TextStyle(
                    color: blue, fontWeight: FontWeight.w500, fontSize: 18),
              ),
              trailing: Text('Date :${ data['date']??''}',style: TextStyle(color: blue),),
            ),
          ),
        ),
      ),
    ),
  );
}

class Notice1 extends StatefulWidget {
  Notice1({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice1> {
  @override
  void initState() {
    super.initState();
    MyDataBase.selectData().then((value) {

      setState(() {});

    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(arrowback, color: white)),
            title: Text(
              notice,
              style: TextStyle(color: white),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: MyDataBase.allData.length,
              itemBuilder: (context, index) {
                return commonContainernotice(
                    context, MyDataBase.allData[index], white);
              })),
    );
  }
}
