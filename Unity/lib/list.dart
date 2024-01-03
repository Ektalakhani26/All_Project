// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               width: 500,
//               height: 200,
//               color: Colors.blue,
//             ),
//             Expanded(
//               flex: 1,
//               child: ListView(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(3),
//                     child: Container(
//                       width: 500,
//                       height:  100,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 500,
//               height: 100,
//               color: Colors.blue,
//             ),
//           ],
//         ),
//
//       ),
//     );
//   }
// }

//============================= list bilder=====================================================
//==============================================================================================
//==============================================================================================

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(3),
            child: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            color: Colors.black,
                          ),
                          Container(
                            width: 200,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white54, borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.search,color: Colors.black),
                                Container(
                                  //padding: EdgeInsets.only(right: 200),
                                  child: Text('Search for app', style: TextStyle(color: Colors.black38)),
                                ),
                                Icon(Icons.mic,color: Colors.black),
                              ],
                            ),
                          ),
                          Icon(Icons.save,color: Colors.white,),
                          Stack(
                            children:[
                              CircleAvatar(
                                maxRadius: 20,
                                minRadius: 20,
                                backgroundImage: AssetImage('assets/ekta2.jpg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  //color: Colors.red,
                                  child: Image(image: AssetImage('assets/p6.jpg')),
                                  decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text('figthing',style: TextStyle(color: Colors.white),),
                                ),
                                Text('Action * Runner',style: TextStyle(color: Colors.white38),),
                                Container(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text('4.2*  97MB',style: TextStyle(color: Colors.white38))),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  child: Image(image: AssetImage('assets/p7.jpg')),
                                  decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 55),
                                  child: Text('Shoter',style: TextStyle(color: Colors.white),),
                                ),
                                Text('Arcade * Match ',style: TextStyle(color: Colors.white38),),
                                Container(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text('4.4*  86MB',style: TextStyle(color: Colors.white38))),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  child: Image(image: AssetImage('assets/p8.jpg')),
                                  decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text('Aztecs',style: TextStyle(color: Colors.white),),
                                ),
                                Text('Action * Runner',style: TextStyle(color: Colors.white38),),
                                Container(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text('3.2*  80MB',style: TextStyle(color: Colors.white38))),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  child: Image(image: AssetImage('assets/p9.jpg')),
                                  decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 50),
                                  child: Text('MakeUp',style: TextStyle(color: Colors.white),),
                                ),
                                Container(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                                Container(
                                    padding: EdgeInsets.only(right: 30),
                                    child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 100,
                                  child: Image(image: AssetImage('assets/p10.jpg')),
                                  decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                ),
                                Container(
                                  child: Text('Bubble Shooter',style: TextStyle(color: Colors.white),),
                                ),
                                Text('Puzzle *Match',style: TextStyle(color: Colors.white38),),
                                Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text('4.4*  86MB',style: TextStyle(color: Colors.white38))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 20,

        ),
      ),
    );
  }
}
