import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

List<Map> materiall=[];


class adminmaterial extends StatefulWidget {
  const adminmaterial({Key? key}) : super(key: key);

  @override
  _MexamState createState() => _MexamState();
}

class _MexamState extends State<adminmaterial> {


  TextEditingController materController =TextEditingController();
  TextEditingController matertitleController=TextEditingController();
  Widget common1(context, index) {
    //print(mlink);
    //print(MyDataBase.mlink[index]['topic'].toString());
    //materiall.clear();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        color: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: black12, width: 2)),
        child: Container(
          height: 120,
          //  color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(MyDataBase.mlink[index]['topic'].toString(),style: TextStyle(color: black),),
              ),
              // SizedBox(height: 5,),
              GestureDetector(
                onTap: ()=> launch(MyDataBase.mlink[index]['link'].toString()),
                child:Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      MyDataBase.mlink[index]['link'].toString(),style: TextStyle(color: blue),
                    ),
                  ),
                ) ,
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    MyDataBase.selectDatalink().then((value) {
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            arrowback,
            color: white,
          ),
        ),
        title: Text(material, style: TextStyle(color: white)),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: MyDataBase.mlink.length,
          //scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return common1(context, index);
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: blue,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SimpleDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  contentPadding: EdgeInsets.all(50.0),
                  insetPadding: EdgeInsets.symmetric(
                    vertical: 120,
                  ),
                  children: [
                    Column(
                      children: [
                        Center(
                            child: Text(
                              material,
                              style: TextStyle(
                                  color: black, fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: matertitleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            hintText: 'Enter Topic Link',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: materController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: black),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            hintText: addLink1,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: MaterialButton(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            minWidth: MediaQuery.of(context).size.width / 4.6,
                            height: 50,
                            color: blue,
                            onPressed: () {
                              MyDataBase.insertdatalink(
                                topic: matertitleController.text,
                                link: materController.text,
                              ).then((value) {
                                MyDataBase.selectDatalink().then((value) {
                                  setState(() {});
                                  Navigator.pop(context);
                                });
                              });
                            },

                            // materiall.add({
                            //   "link":materController.text,
                            child: Text(
                              addLink,
                              style: TextStyle(color: white),
                            ),


                          ),

                          // print(materiall.toString());

                        ),

                      ],
                    )
                  ],
                );
              });
        },
        child: Icon(icadd),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:untitled/utils/colors.dart';
// import 'package:untitled/utils/icons.dart';
// import 'package:untitled/utils/strings.dart';
//
// List<Map> materiall=[
//   // {
//   //   'link':'dskjckcjxvidhvchvjchv',
//   // },
//   // {
//   //   'link':'dshxusadhwusdysuc'
//   // },
//   // {
//   //   'link':'dhjdhsjcxhsajdhsjchxjc'
//   // }
// ];
//
// class adminmaterial extends StatefulWidget {
//   const adminmaterial({Key? key}) : super(key: key);
//
//   @override
//   _MexamState createState() => _MexamState();
// }
//
// class _MexamState extends State<adminmaterial> {
//
//   TextEditingController materController =TextEditingController();
//   Widget common1(context, index) {
//    //materiall.clear();
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 4,
//         color: white,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             side: BorderSide(color: black12, width: 2)),
//         child: Container(
//           height: 70,
//           //  color: Colors.white,
//           child: Center(
//               child: Text(
//             materiall[index]['link'].toString(),
//             style: TextStyle(color: black),
//           )),
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blue,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             arrowback,
//             color: white,
//           ),
//         ),
//         title: Text(material, style: TextStyle(color: white)),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//           itemCount: materiall.length,
//           //scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return common1(context, index);
//           }),
//       floatingActionButton: FloatingActionButton(
//         elevation: 3,
//         backgroundColor: blue,
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (context) => SimpleDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                     contentPadding: EdgeInsets.all(50.0),
//                     insetPadding: EdgeInsets.symmetric(
//                       vertical: 120,
//                     ),
//                     children: [
//                       Column(
//                         children: [
//                           Center(
//                               child: Text(
//                             material,
//                             style: TextStyle(
//                                 color: black, fontWeight: FontWeight.bold),
//                           )),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                              controller: materController,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(color: black),
//                                 borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(10.0),
//                                   topLeft: Radius.circular(10.0),
//                                   bottomLeft: Radius.circular(10.0),
//                                   bottomRight: Radius.circular(10.0),
//                                 ),
//                               ),
//                               hintText: addLink1,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Center(
//                             child: MaterialButton(
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                               minWidth: MediaQuery.of(context).size.width / 4.6,
//                               height: 50,
//                               color: blue,
//                               onPressed: () {
//                                 materiall.add({
//                                   "link":materController.text,
//                                 });
//                                // print(materiall.toString());
//                                 setState(() {
//                                   Navigator.pop(context);
//                                 });
//                               },
//                               child: Text(
//                                 addLink,
//                                 style: TextStyle(color: white),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ));
//         },
//         child: Icon(icadd),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:untitled/utils/colors.dart';
// import 'package:untitled/utils/icons.dart';
// import 'package:untitled/utils/strings.dart';
//
// List<Map> materiall=[
//   // {
//   //   'link':'dskjckcjxvidhvchvjchv',
//   // },
//   // {
//   //   'link':'dshxusadhwusdysuc'
//   // },
//   // {
//   //   'link':'dhjdhsjcxhsajdhsjchxjc'
//   // }
// ];
//
// class adminmaterial extends StatefulWidget {
//   const adminmaterial({Key? key}) : super(key: key);
//
//   @override
//   _MexamState createState() => _MexamState();
// }
//
// class _MexamState extends State<adminmaterial> {
//
//   TextEditingController materController =TextEditingController();
//   Widget common1(context, index) {
//    //materiall.clear();
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         elevation: 4,
//         color: white,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             side: BorderSide(color: black12, width: 2)),
//         child: Container(
//           height: 70,
//           //  color: Colors.white,
//           child: Center(
//               child: Text(
//             materiall[index]['link'].toString(),
//             style: TextStyle(color: black),
//           )),
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blue,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: Icon(
//             arrowback,
//             color: white,
//           ),
//         ),
//         title: Text(material, style: TextStyle(color: white)),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//           itemCount: materiall.length,
//           //scrollDirection: Axis.horizontal,
//           itemBuilder: (context, index) {
//             return common1(context, index);
//           }),
//       floatingActionButton: FloatingActionButton(
//         elevation: 3,
//         backgroundColor: blue,
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (context) => SimpleDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                     contentPadding: EdgeInsets.all(50.0),
//                     insetPadding: EdgeInsets.symmetric(
//                       vertical: 120,
//                     ),
//                     children: [
//                       Column(
//                         children: [
//                           Center(
//                               child: Text(
//                             material,
//                             style: TextStyle(
//                                 color: black, fontWeight: FontWeight.bold),
//                           )),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           TextFormField(
//                              controller: materController,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(color: black),
//                                 borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(10.0),
//                                   topLeft: Radius.circular(10.0),
//                                   bottomLeft: Radius.circular(10.0),
//                                   bottomRight: Radius.circular(10.0),
//                                 ),
//                               ),
//                               hintText: addLink1,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Center(
//                             child: MaterialButton(
//                               elevation: 5,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                               minWidth: MediaQuery.of(context).size.width / 4.6,
//                               height: 50,
//                               color: blue,
//                               onPressed: () {
//                                 materiall.add({
//                                   "link":materController.text,
//                                 });
//                                // print(materiall.toString());
//                                 setState(() {
//                                   Navigator.pop(context);
//                                 });
//                               },
//                               child: Text(
//                                 addLink,
//                                 style: TextStyle(color: white),
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ));
//         },
//         child: Icon(icadd),
//       ),
//     );
//   }
// }
