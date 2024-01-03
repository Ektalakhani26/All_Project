
import 'package:flutter/material.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';

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
