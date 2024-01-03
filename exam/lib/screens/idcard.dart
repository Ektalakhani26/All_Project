import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';


class Id extends StatefulWidget {
  const Id({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Id1();
}

class Id1 extends State {
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
        title: Text(digiid),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assett/123.jpg'),
            colorFilter: ColorFilter.mode(
                Colors.white70.withOpacity(0.2), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Text(
                ifl,
                style: TextStyle(
                    fontSize: 20.0, color: id1, fontWeight: FontWeight.w700),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    height: MediaQuery.of(context).size.height / 4,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(20.0)),
                      border: Border.all(color: black),
                      image: DecorationImage(
                        image: NetworkImage(
                          profile1['url']
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    profile1['Name'],
                    style: TextStyle(
                        fontSize: 22.0,
                        color: id2,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    profile1['Address']??'',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(dobtitle,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(profile1['DateOfBirth']??'', style: TextStyle(fontSize: 18.0)),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(coursetitle,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(profile1['Course']??'', style: TextStyle(fontSize: 18.0)),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text(contnotitle,
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(profile1['Personalmobile']??'', style: TextStyle(fontSize: 18.0)),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


