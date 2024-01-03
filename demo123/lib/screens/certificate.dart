

import 'package:flutter/material.dart';
import 'package:demo123/utils/colors.dart';
import 'package:demo123/utils/icons.dart';
import 'package:demo123/utils/strings.dart';

class Certi extends StatefulWidget {
  const Certi({Key? key}) : super(key: key);

  @override
  _CertiState createState() => _CertiState();
}

class _CertiState extends State<Certi> {
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
                icon: Icon(
                  arrowback,
                )),
            title: Text(certificate),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: white, //background color of box

                boxShadow: [
                  BoxShadow(
                    color: blue,
                    blurRadius: 6.0, // soften the shadow
                    spreadRadius: 0.5, //extend the shadow
                    offset: Offset(
                      3.0, // Move to right 10  horizontally
                      3.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
              child: ListTile(
                title: Text(
                  certificate,
                  style: TextStyle(fontSize: 18, color: blue),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icdownload,
                      size: 25,
                      color: blue,
                    )),
              ),
            ),
          )),
    );
  }
}