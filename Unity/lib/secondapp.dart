import 'package:flutter/material.dart';

class secondApp extends StatelessWidget {
  const secondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second app')),
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

                Flexible(
                  child: Container(
                    child: Text('setting',style: TextStyle(fontSize: 30,color: Colors.white)),
                    margin: EdgeInsets.fromLTRB(150, 20, 0, 0),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Flexible(
                  child: Container(
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
                ),

                Flexible(
                  child: Container(
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
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
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
                ),

                Flexible(
                  child: Container(
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
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
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
                ),

                Flexible(
                  child: Container(
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
                ),
              ],
            ),

            Row(
              children: [
                Flexible(

                  child: Container(
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
                        Flexible(

                          child: Container(
                            child: Icon(Icons.account_circle_rounded,color: Colors.white),
                            padding: EdgeInsets.fromLTRB(190, 0, 0, 0),

                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ],
            ),

            // Row(
            //   children: [
            //     Flexible(
            //
            //       child: Container(
            //         margin: EdgeInsets.fromLTRB(3, 10, 0, 0),
            //         padding: EdgeInsets.all(10),
            //         width: 380,
            //         height: 50,
            //         alignment: Alignment.centerLeft,
            //         decoration: BoxDecoration(color: Colors.blueAccent.shade400,borderRadius: BorderRadius.circular(20)),
            //         child: Row(
            //           children: [
            //             Icon(Icons.access_alarm_outlined,color: Colors.white),
            //             Text('just on display',style: TextStyle(color: Colors.white)),
            //             Flexible(
            //
            //               child: Container(
            //                 child: Icon(Icons.account_circle,color: Colors.white),
            //                 padding: EdgeInsets.fromLTRB(215, 0, 0, 0),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
