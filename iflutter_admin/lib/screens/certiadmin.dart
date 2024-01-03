import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

List<Map> cer=[];

class admincerti extends StatefulWidget {
  const admincerti({Key? key}) : super(key: key);
  @override
  _admincertiState createState() => _admincertiState();
}

class _admincertiState extends State<admincerti> {
  TextEditingController certiController = TextEditingController();
  Widget comm(context,index){
    //cer.clear();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){},
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width /5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: blue, width: 1.0),
            color: white,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  //dar=NameController.text;
                  cer[index]['title'].toString(),
                  style: TextStyle(color: black),
                ),
                trailing: MaterialButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0))),
                  minWidth: MediaQuery.of(context).size.width / 5,
                  height: 40,
                  color: blue,
                  onPressed: () {},
                  child: Text(
                    'upload',
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(certificate),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(arrowback)),
      ),
      body: ListView.builder(
          itemCount: cer.length,
          //scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return comm(context, index);
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: blue,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              contentPadding: EdgeInsets.all(30.0),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                          certificate,
                          style: TextStyle(
                              color: black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        enterName,
                        style: TextStyle(color: black, fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: certiController,
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
                        hintText: 'Enter certificate',
                      ),
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: MaterialButton(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0))),
                        minWidth: MediaQuery.of(context).size.width / 3,
                        height: 40,
                        color: blue,
                        onPressed: () {
                          cer.add({
                            "title": certiController.text,
                          });
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          ok,
                          style: TextStyle(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        child: Icon(icadd),
      ),
    );
  }
}
// class admincerti extends StatefulWidget {
//   const admincerti({Key? key}) : super(key: key);
//
//   @override
//   _admincertiState createState() => _admincertiState();
// }
//
// class _admincertiState extends State<admincerti> {
//   final key = GlobalKey<FormState>();
//
//   TextEditingController certiController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: blue,
//         title: Text(certificate),
//         centerTitle: true,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             icon: Icon(arrowback)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         elevation: 3,
//         backgroundColor: blue,
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => SimpleDialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               contentPadding: EdgeInsets.all(30.0),
//               children: [
//                 Form(
//                   key: key,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Center(
//                           child: Text(
//                             certificate,
//                             style: TextStyle(
//                                 color: black,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w700),
//                           )),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Center(
//                         child: Text(
//                           enterName,
//                           style: TextStyle(color: black, fontSize: 17),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       TextFormField(
//                         controller: certiController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: black),
//                             borderRadius: BorderRadius.only(
//                               topRight: Radius.circular(10.0),
//                               topLeft: Radius.circular(10.0),
//                               bottomLeft: Radius.circular(10.0),
//                               bottomRight: Radius.circular(10.0),
//                             ),
//                           ),
//                         ),
//                         maxLines: 1,
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Center(
//                         child: MaterialButton(
//                           elevation: 5,
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                               BorderRadius.all(Radius.circular(20.0))),
//                           minWidth: MediaQuery.of(context).size.width / 3,
//                           height: 40,
//                           color: blue,
//                           onPressed: () {
//                             if (key.currentState!.validate()) {
//                               certi1 = certiController.text;
//                               Navigator.of(context).pop();
//                             }
//
//                             setState(() {
//                               Navigator.pop(context);
//                             });
//                           },
//                           child: Text(
//                             ok,
//                             style: TextStyle(color: white),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//         child: Icon(icadd),
//       ),
//     );
//   }
// }
