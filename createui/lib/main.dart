import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Setting App'),
          backgroundColor: Colors.black45,
          leading: Icon(Icons.settings),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    //margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    //child: Icon(Icons.account_circle_rounded),
                  ),

                  // Container(
                  //   margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  //   child: Icon(Icons.account_circle_rounded),
                  //),

                  Container(

                    child: Container(
                      child: Text('setting',style: TextStyle(fontSize: 30,color: Colors.white)),
                      margin: EdgeInsets.fromLTRB(150, 20, 0, 0),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Container(
                    width: 180,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                    //child: Text("  Weather \n moniterning",style: TextStyle(fontSize: 15)),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.pink.shade200,borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Text("  Weather \n moniterning",style: TextStyle(fontSize: 15)),
                        Container(
                            child: Icon(Icons.warehouse_outlined),
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 180,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                    //child: Text("  Cloud \n storage",style: TextStyle(fontSize: 15)),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.blue.shade100,borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Text("  Cloud \n storage",style: TextStyle(fontSize: 15)),
                        Container(
                            child: Icon(Icons.cloud),
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 180,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                   padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                   // child: Text(" private \n property",style: TextStyle(fontSize: 15)),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.deepOrange.shade200,borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Text(" private \n property",style: TextStyle(fontSize: 15)),
                        Container(
                            child: Icon(Icons.private_connectivity),
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 180,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                    //child: Text(" Hide \n perpose",style: TextStyle(fontSize: 15)),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.amber.shade200,borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Text(" Hide \n perpose",style: TextStyle(fontSize: 15)),
                        Container(
                            child: Icon(Icons.hail_outlined),
                          margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 180,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                   // child: Text("  Weather \n moniterning",style: TextStyle(fontSize: 15)),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.lightGreen.shade200,borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Text("  Weather \n moniterning",style: TextStyle(fontSize: 15)),
                        Container(
                            child: Icon(Icons.warehouse),
                          margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 180,
                    height: 150,
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                   padding: EdgeInsets.fromLTRB(70, 10, 0, 0),
                   // child: Text("About",style: TextStyle(fontSize: 15)),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.purple.shade200,borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                         Text("About",style: TextStyle(fontSize: 15)),
                        Container(
                            child: Icon(Icons.account_balance_outlined),
                          margin: EdgeInsets.fromLTRB(5, 5, 0, 5)
                        ),
                      ],
                    ),
                  ),
                ],
              ),

                      Row(
                        children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.fromLTRB(3,10, 0, 0),
                                width: 380,
                                height: 50,
                                decoration: BoxDecoration(color: Colors.blueAccent.shade400,borderRadius: BorderRadius.circular(20)),

                                child:Row(
                                  children: [
                                    Icon(Icons.safety_check,color: Colors.white),
                                    Text('About on program',style: TextStyle(color: Colors.white)),
                                    Container(
                                        child: Icon(Icons.account_circle_rounded,color: Colors.white),
                                      padding: EdgeInsets.fromLTRB(190, 0, 0, 0),

                                    ),
                                  ],
                                ),

                              ),
                           ],
                       ),

                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(3, 10, 0, 0),
                            padding: EdgeInsets.all(10),
                            width: 380,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(color: Colors.blueAccent.shade400,borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Icon(Icons.access_alarm_outlined,color: Colors.white),
                                Text('just on display',style: TextStyle(color: Colors.white)),
                                Container(
                                    child: Icon(Icons.account_circle,color: Colors.white),
                                    padding: EdgeInsets.fromLTRB(215, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
