import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/dashboardadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

// List <Map> feesad =[
//   {
//     'title':'dankhara bansi',
//     'amount':'2000',
//     'date':'05/05/2022'
//   },
//   {
//     'title':'gangani jinal',
//     'amount':'6000',
//     'date':'03/06/2021'
//   }
// ];

class AdFees extends StatefulWidget {
  @override
  State<AdFees> createState() => AdminFees();
}

class AdminFees extends State<AdFees> {
  @override
  void initState() {
    super.initState();
    MyDataBase.selectUserDataFee().then((value) {
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
          icon: Icon(
            arrowback,
            color: white,
          ),
        ),
        title: Text(fees),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Student name',
                style: TextStyle(fontWeight: FontWeight.bold,color: blue, fontSize: 15),
              ),
              // SizedBox(width: 90),
              Text(
                'Amount',
                style: TextStyle(fontWeight: FontWeight.bold,color: blue, fontSize: 15),
              ),
              // SizedBox(
              //   width: 50,
              // ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: MyDataBase.allFeesList.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 12,
                      color: white,
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(MyDataBase.allFeesList[index]
                                          ['sName'],style: TextStyle(fontWeight:FontWeight.bold)),
                                      Text(MyDataBase.allFeesList[index]
                                          ['amount'],style: TextStyle(fontWeight:FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      ' date : ${MyDataBase.allFeesList[index]['date']}')
                                ],
                              ))
                        ],
                      ),
                    ),
                  )),
        ),
      ]),
    );
  }
}

// return Scaffold(
//   appBar: AppBar(
//     backgroundColor: blue,
//     leading: IconButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       icon: Icon(
//         arrowback,
//         color: white,
//       ),
//     ),
//     title: Text(Fees, style: TextStyle(color: white)),
//     centerTitle: true,
//   ),
//   body: SingleChildScrollView(
//     child: Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Container(
//               height: 150,
//               width: MediaQuery.of(context).size.width / 1.1,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 border: Border.all(color: blue, width: 1.0),
//                 color: white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         width: MediaQuery.of(context).size.width / 3.8,
//                         color: blue,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(TotalAmmount,
//                                     style: TextStyle(
//                                         color: white, fontSize: 14)),
//                                 Text(TAmmount,
//                                     style: TextStyle(
//                                         color: white, fontSize: 14)),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         width: MediaQuery.of(context).size.width / 3.8,
//                         color: org,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(PaidAmmount,
//                                     style: TextStyle(
//                                         color: white, fontSize: 14)),
//                                 Text(PAmmount,
//                                     style: TextStyle(
//                                         color: white, fontSize: 14)),
//                                 // Text(
//                                 //   Paid,
//                                 //   style: TextStyle(color: white),
//                                 // ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 130,
//                         width: MediaQuery.of(context).size.width / 3.8,
//                         color: blue,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(RemainAmmount,
//                                     style: TextStyle(
//                                         color: white, fontSize: 14)),
//                                 Text(RAmmount,
//                                     style: TextStyle(
//                                         color: white, fontSize: 14)),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

// SizedBox(
//   height: 20,
// ),
// Text(
//   ReceiptDetail,
//   style: TextStyle(color: black, fontSize: 25),
// ),
// SizedBox(
//   height: 15,
// ),
// ListTile(
//   title: Text(
//     ReceiptNo,
//     style: TextStyle(color: black, fontSize: 20),
//   ),
//   trailing: Text(
//     No1,
//     style: TextStyle(color: black, fontSize: 20),
//   ),
// ),
// SizedBox(
//   height: 5,
// ),
// ListTile(
//   title: Text(
//     Date,
//     style: TextStyle(
//         color: black, fontSize: 20, fontStyle: FontStyle.italic),
//   ),
//   trailing: MaterialButton(
//     elevation: 5,
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(20.0))),
//     minWidth: MediaQuery.of(context).size.width / 3,
//     height: 40,
//     color: blue,
//     onPressed: () {
//       showModalBottomSheet(
//           shape: RoundedRectangleBorder(
//               borderRadius:
//               BorderRadius.all(Radius.circular(20.0))),
//           context: context,
//           builder: (context) {
//             return Column();
//           });
//     },
//     child: Text(
//       Upload,
//       style: TextStyle(color: white),
//     ),
//   ),
// ),
// Divider(),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:untitled/common/widgets.dart';
// import 'package:untitled/network/shred%20data.dart';
// import 'package:untitled/screens/dashboardadmin.dart';
//
// import 'package:untitled/utils/colors.dart';
// import 'package:untitled/utils/icons.dart';
// import 'package:untitled/utils/strings.dart';
// class AdFees extends StatefulWidget {
//   @override
//   State<AdFees> createState() => AdminFees();
// }
//
// class AdminFees extends State<AdFees> {
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
//         title: Text(Fees, style: TextStyle(color: white)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Container(
//                   height: 150,
//                   width: MediaQuery.of(context).size.width / 1.1,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     border: Border.all(color: blue, width: 1.0),
//                     color: white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: Container(
//                             height: 130,
//                             width: MediaQuery.of(context).size.width / 3.8,
//                             color: blue,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(TotalAmmount,
//                                         style: TextStyle(
//                                             color: white, fontSize: 14)),
//                                     Text(TAmmount,
//                                         style: TextStyle(
//                                             color: white, fontSize: 14)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: 130,
//                             width: MediaQuery.of(context).size.width / 3.8,
//                             color: org,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(PaidAmmount,
//                                         style: TextStyle(
//                                             color: white, fontSize: 14)),
//                                     Text(PAmmount,
//                                         style: TextStyle(
//                                             color: white, fontSize: 14)),
//                                     // Text(
//                                     //   Paid,
//                                     //   style: TextStyle(color: white),
//                                     // ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: 130,
//                             width: MediaQuery.of(context).size.width / 3.8,
//                             color: blue,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(RemainAmmount,
//                                         style: TextStyle(
//                                             color: white, fontSize: 14)),
//                                     Text(RAmmount,
//                                         style: TextStyle(
//                                             color: white, fontSize: 14)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               // SizedBox(
//               //   height: 20,
//               // ),
//               // Text(
//               //   ReceiptDetail,
//               //   style: TextStyle(color: black, fontSize: 25),
//               // ),
//               // SizedBox(
//               //   height: 15,
//               // ),
//               // ListTile(
//               //   title: Text(
//               //     ReceiptNo,
//               //     style: TextStyle(color: black, fontSize: 20),
//               //   ),
//               //   trailing: Text(
//               //     No1,
//               //     style: TextStyle(color: black, fontSize: 20),
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 5,
//               // ),
//               // ListTile(
//               //   title: Text(
//               //     Date,
//               //     style: TextStyle(
//               //         color: black, fontSize: 20, fontStyle: FontStyle.italic),
//               //   ),
//               //   trailing: MaterialButton(
//               //     elevation: 5,
//               //     shape: RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               //     minWidth: MediaQuery.of(context).size.width / 3,
//               //     height: 40,
//               //     color: blue,
//               //     onPressed: () {
//               //       showModalBottomSheet(
//               //           shape: RoundedRectangleBorder(
//               //               borderRadius:
//               //               BorderRadius.all(Radius.circular(20.0))),
//               //           context: context,
//               //           builder: (context) {
//               //             return Column();
//               //           });
//               //     },
//               //     child: Text(
//               //       Upload,
//               //       style: TextStyle(color: white),
//               //     ),
//               //   ),
//               // ),
//               // Divider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
