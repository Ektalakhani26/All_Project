import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

Widget commonContainerdec(context, day) {
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
                  day['text1'],
                  style: const TextStyle(fontSize: 20.0),
                ),
                trailing: Column(
                  children: [
                    Text(day['incoming'],
                        style: const TextStyle(fontSize: 15.0)),
                    const SizedBox(height: 10.0),
                    Text(day['outcoming'],
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
                      day['date'],
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

class December extends StatefulWidget {
  const December({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => December1();
}

class December1 extends State {
  @override
  Widget build(BuildContext context) {
    List<Map> day = [
      {
        'text1': 'list view',
        'incoming': 'incoming:10:00',
        'outcoming': 'outcoming:5:00',
        'date': '06/12/2021'
      },
      {
        'text1': 'Navigation',
        'incoming': 'incoming:10:00',
        'outcoming': 'outcoming:5:00',
        'date': '04/01/2022'
      },
      {
        'text1': 'Textformfield',
        'incoming': 'incoming:10:00',
        'outcoming': 'outcoming:5:00',
        'date': '08/01/2022'
      },
      {
        'text1': 'grid view',
        'incoming': 'incoming:10:00',
        'outcoming': 'outcoming:5:00',
        'date': '10/01/2022'
      },
    ];
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
          itemCount: day.length,
          itemBuilder: (context, index) {
            return commonContainerdec(context, day[index]);
          }),
    );
  }
}
