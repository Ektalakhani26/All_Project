import 'package:flutter/material.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  void initState() {
    super.initState();
    MyDataBase.selectDatafeed1().then((value) {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
  // print(feed);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: const Text('Feedback'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(arrowback)),
      ),
      body: ListView.builder(
        itemCount: MyDataBase.feed.length,
          itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  MyDataBase.feed[index]['feedname'],style: TextStyle(color: black),
                ),
              ),
            ),
            Divider(thickness: 2,),
          ],
        );
      })
    );
  }
}
