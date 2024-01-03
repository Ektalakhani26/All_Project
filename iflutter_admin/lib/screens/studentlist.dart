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
import 'package:untitled/screens/studdetail.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class slist extends StatefulWidget {
  const slist({Key? key}) : super(key: key);

  @override
  _SlistState createState() => _SlistState();
}

class _SlistState extends State<slist> {
  Widget commonContainerlst(
      context,
      Map profile2,
      ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 7,
        child: Container(
          height: 180,
          // height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: blue, width: 1.0),
            color: white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Name  : ${profile2['Name'] }',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
              Text(
                'College :  ${profile2['College']} ',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'Course  :  ${profile2['Course']}',
                style: TextStyle(fontSize: 15),
              ),
              MaterialButton(
                height: 30,
                minWidth: MediaQuery.of(context).size.width / 3,
                color: blue,
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => adminsdetail(profile2)));
                  });
                },
                child: Text(
                  detail,
                  style: TextStyle(fontSize: 16, color: white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    MyDataBase.selectUserDataStudent().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            shadowColor: org,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(arrowback)),
            title: Text(slst),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                return commonContainerlst(context, studentList[index]);
              }),
        ));
  }
}
// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:untitled/common/widgets.dart';
// import 'package:untitled/network/shred%20data.dart';
// import 'package:untitled/screens/dashboardadmin.dart';
// import 'package:untitled/screens/studdetail.dart';
//
// import 'package:untitled/utils/colors.dart';
// import 'package:untitled/utils/icons.dart';
// import 'package:untitled/utils/strings.dart';
// class slist extends StatefulWidget {
//   const slist({Key? key}) : super(key: key);
//
//   @override
//   _SlistState createState() => _SlistState();
// }
//
// class _SlistState extends State<slist> {
//   Widget commonContainerlst(context, Map lst) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Card(
//         elevation: 7,
//         child: Container(
//           height: 180,
//           // height: MediaQuery.of(context).size.height / 4,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             border: Border.all(color: blue, width: 1.0),
//             color: white,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 lst['title'],
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.left,
//               ),
//               Text(
//                 lst['clg'],
//                 style: TextStyle(fontSize: 15),
//               ),
//               Text(
//                 lst['course'],
//                 style: TextStyle(fontSize: 15),
//               ),
//               MaterialButton(
//                 height: 30,
//                 minWidth: MediaQuery.of(context).size.width / 3,
//                 color: blue,
//                 onPressed: () {
//                   setState(() {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => adminsdetail()));
//                   });
//                 },
//                 child: Text(
//                   detail,
//                   style: TextStyle(fontSize: 16, color: white),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: blue,
//             shadowColor: org,
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(arrowback)),
//             title: Text(slst),
//             centerTitle: true,
//           ),
//           body: ListView.builder(
//               itemCount: lst.length,
//               itemBuilder: (context, index) {
//                 return commonContainerlst(context, lst[index]);
//               }),
//         ));
//   }
// }
// class slist extends StatefulWidget {
//   const slist({Key? key}) : super(key: key);
//
//   @override
//   _SlistState createState() => _SlistState();
// }
//
// class _SlistState extends State<slist> {
//   Widget commonContainerlst(
//       context,
//       Map profile2,
//       ) {
//     return Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Card(
//         elevation: 7,
//         child: Container(
//           height: 180,
//           // height: MediaQuery.of(context).size.height / 4,
//           width: MediaQuery.of(context).size.width,
//           padding: EdgeInsets.all(10.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//             border: Border.all(color: blue, width: 1.0),
//             color: white,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 'Name  : ${profile2['Name'] }',
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.left,
//               ),
//               Text(
//                 'College :  ${profile2['College']} ',
//                 style: TextStyle(fontSize: 15),
//               ),
//               Text(
//                 'Course  :  ${profile2['Course']}',
//                 style: TextStyle(fontSize: 15),
//               ),
//               MaterialButton(
//                 height: 30,
//                 minWidth: MediaQuery.of(context).size.width / 3,
//                 color: blue,
//                 onPressed: () {
//                   setState(() {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => adminsdetail(profile2)));
//                   });
//                 },
//                 child: Text(
//                   detail,
//                   style: TextStyle(fontSize: 16, color: white),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     MyDataBase.selectUserDataStudent().then((value) {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: blue,
//             shadowColor: org,
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(arrowback)),
//             title: Text(slst),
//             centerTitle: true,
//           ),
//           body: ListView.builder(
//               itemCount: studentList.length,
//               itemBuilder: (context, index) {
//                 return commonContainerlst(context, studentList[index]);
//               }),
//         ));
//   }
// }
// // import 'dart:io';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:path/path.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:untitled/common/widgets.dart';
// // import 'package:untitled/network/shred%20data.dart';
// // import 'package:untitled/screens/dashboardadmin.dart';
// // import 'package:untitled/screens/studdetail.dart';
// //
// // import 'package:untitled/utils/colors.dart';
// // import 'package:untitled/utils/icons.dart';
// // import 'package:untitled/utils/strings.dart';
// // class slist extends StatefulWidget {
// //   const slist({Key? key}) : super(key: key);
// //
// //   @override
// //   _SlistState createState() => _SlistState();
// // }
// //
// // class _SlistState extends State<slist> {
// //   Widget commonContainerlst(context, Map lst) {
// //     return Padding(
// //       padding: const EdgeInsets.all(15.0),
// //       child: Card(
// //         elevation: 7,
// //         child: Container(
// //           height: 180,
// //           // height: MediaQuery.of(context).size.height / 4,
// //           width: MediaQuery.of(context).size.width,
// //           padding: EdgeInsets.all(10.0),
// //           decoration: BoxDecoration(
// //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
// //             border: Border.all(color: blue, width: 1.0),
// //             color: white,
// //           ),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: [
// //               Text(
// //                 lst['title'],
// //                 style: TextStyle(fontSize: 18),
// //                 textAlign: TextAlign.left,
// //               ),
// //               Text(
// //                 lst['clg'],
// //                 style: TextStyle(fontSize: 15),
// //               ),
// //               Text(
// //                 lst['course'],
// //                 style: TextStyle(fontSize: 15),
// //               ),
// //               MaterialButton(
// //                 height: 30,
// //                 minWidth: MediaQuery.of(context).size.width / 3,
// //                 color: blue,
// //                 onPressed: () {
// //                   setState(() {
// //                     Navigator.of(context).push(MaterialPageRoute(
// //                         builder: (context) => adminsdetail()));
// //                   });
// //                 },
// //                 child: Text(
// //                   detail,
// //                   style: TextStyle(fontSize: 16, color: white),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //           appBar: AppBar(
// //             backgroundColor: blue,
// //             shadowColor: org,
// //             leading: IconButton(
// //                 onPressed: () {
// //                   Navigator.of(context).pop();
// //                 },
// //                 icon: Icon(arrowback)),
// //             title: Text(slst),
// //             centerTitle: true,
// //           ),
// //           body: ListView.builder(
// //               itemCount: lst.length,
// //               itemBuilder: (context, index) {
// //                 return commonContainerlst(context, lst[index]);
// //               }),
// //         ));
// //   }
// // }