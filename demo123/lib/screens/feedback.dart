import 'package:demo123/network/db.dart';
import 'package:demo123/utils/colors.dart';
import 'package:demo123/utils/icons.dart';
import 'package:demo123/utils/strings.dart';
import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  Feedback createState() => Feedback();
}

class Feedback extends State<FeedbackForm> {
  TextEditingController feedbackController = TextEditingController();

  void initState() {
    super.initState();
    MyDataBase.selectDatafeed().then((value) {
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
            Navigator.of(context).pop();
          },
          icon: Icon(arrowback),
        ),
        title: Text(feedbackform),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: feedbackController,
              // validator: (val) {
              //   return (val!.isEmpty) ? enterstate : null;
              // },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(icfedd),
                hintText: feedback11,
                labelText: feedbackform12,
              ),
            ),
          ),
          MaterialButton(
            color: blue,
            onPressed: () {
              MyDataBase.feedinsertdata(
                feedname: feedbackController.text,
              );
            },
            child: Text(
              submit,
              style: TextStyle(color: white),
            ),
          )
        ],
      ),
    );
  }
}
