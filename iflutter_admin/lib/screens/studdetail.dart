import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/common/widgets.dart';
import 'package:untitled/network/shred%20data.dart';
import 'package:untitled/screens/adminprofile.dart';
import 'package:untitled/screens/attadmin.dart';
import 'package:untitled/screens/attenadminstudetail.dart';
import 'package:untitled/screens/certiadmin.dart';
import 'package:untitled/screens/dashboardadmin.dart';
import 'package:untitled/screens/examadmin.dart';
import 'package:untitled/screens/feesadmin.dart';
//import 'package:untitled/screens/profile.dart';
import 'package:untitled/screens/sprofileadmin.dart';
import 'package:untitled/screens/taskadmin.dart';

import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';
Widget commonContainersdetail(context, Map datasdetail, Color clr) {
  // var icondata;

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: datasdetail['onTap1'],
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            color: clr,
            boxShadow: [
              BoxShadow(
                color: blue.withOpacity(0.6), //color of shadow
                spreadRadius: 2, //spread radius
                blurRadius: 3, // blur radius
                offset: Offset(3, 3), // changes position of shadow
                //first paramerter of offset is left-right
                //second parameter is top to down
              ),
            ],
          ),
          // print(data.length.isOdd);
          child: Padding(
            padding: const EdgeInsets.only(left: 0.50, top: 10, right: 40),
            child: ListTile(
              leading: Image.asset(
                datasdetail['icondata'],
                width: MediaQuery.of(context).size.width / 7,
                height: MediaQuery.of(context).size.height / 1,
              ),
              // color: Color(0xff03508C),

              title: Text(
                datasdetail['title'],
                style: TextStyle(
                    color: blue, fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class adminsdetail extends StatefulWidget {
  Map studentDetail;
  adminsdetail(this.studentDetail,{Key? key}) : super(key: key);

  @override
  _Notice1State createState() => _Notice1State();
}

class _Notice1State extends State<adminsdetail> {
  @override
  Widget build(BuildContext context) {
    List<Map> datasdetail = [
      {
        'icondata': 'assett/profile.png',
        'title': profile,
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pro1(widget.studentDetail),
              ));
          // 'title1': 'bdhbbhg'
        },
        //'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
      },
      // {
      //   'icondata': 'assett/at2.png',
      //   'title': attendance,
      //   'onTap1': () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => December(),
      //         ));
      //     // 'title1': 'bdhbbhg'
      //   },
      //   //'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
      // },
      {
        'icondata': 'assett/F1.png',
        'title': fees,
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdFees(),
              ));
        },
      },
      {
        'icondata': 'assett/t1.png',
        'title': task,
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskAdmin(),
              ));
          // 'title1': 'bdhbbhg'
        },
        //'detail': 'vfyhguj'
      },
      {
        'icondata': 'assett/exam (1).png',
        'title': exam,
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => examAdmin(),
              ));
          // 'title1': 'bdhbbhg'
        },
        // 'detail': 'holiday all day'
      },
      // {
      //   'icondata': 'assett/c2.png',
      //   'title': certificate,
      //   'onTap1': () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => admincerti(),
      //         ));
      //     // 'title1': 'bdhbbhg'
      //   },
      //   //'detail': 'come fast'
      // },
    ];
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: blue,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(arrowback, color: white)),
            title: Text(widget.studentDetail['Name']??''),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: datasdetail.length,
              itemBuilder: (context, index) {
                return commonContainersdetail(
                    context, datasdetail[index], white);
                //  index.isOdd ? Color(0xffF36F24) : Color(0xffF03508c));
              })),
    );
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
// import 'package:untitled/screens/attadmin.dart';
// import 'package:untitled/screens/attenadminstudetail.dart';
// import 'package:untitled/screens/certiadmin.dart';
// import 'package:untitled/screens/dashboardadmin.dart';
// import 'package:untitled/screens/examadmin.dart';
// import 'package:untitled/screens/feesadmin.dart';
// import 'package:untitled/screens/sprofileadmin.dart';
// import 'package:untitled/screens/taskadmin.dart';
//
// import 'package:untitled/utils/colors.dart';
// import 'package:untitled/utils/icons.dart';
// import 'package:untitled/utils/strings.dart';
// Widget commonContainersdetail(context, Map datasdetail, Color clr) {
//   // var icondata;
//
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: GestureDetector(
//       onTap: datasdetail['onTap1'],
//       child: Padding(
//         padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
//         child: Container(
//           height: 70,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(6.0)),
//             color: clr,
//             boxShadow: [
//               BoxShadow(
//                 color: blue.withOpacity(0.6), //color of shadow
//                 spreadRadius: 2, //spread radius
//                 blurRadius: 3, // blur radius
//                 offset: Offset(3, 3), // changes position of shadow
//                 //first paramerter of offset is left-right
//                 //second parameter is top to down
//               ),
//             ],
//           ),
//           // print(data.length.isOdd);
//           child: Padding(
//             padding: const EdgeInsets.only(left: 0.50, top: 10, right: 40),
//             child: ListTile(
//               leading: Image.asset(
//                 datasdetail['icondata'],
//                 width: MediaQuery.of(context).size.width / 7,
//                 height: MediaQuery.of(context).size.height / 1,
//               ),
//               // color: Color(0xff03508C),
//
//               title: Text(
//                 datasdetail['title'],
//                 style: TextStyle(
//                     color: blue, fontWeight: FontWeight.w500, fontSize: 18),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// class adminsdetail extends StatefulWidget {
//   adminsdetail({Key? key}) : super(key: key);
//
//   @override
//   _Notice1State createState() => _Notice1State();
// }
//
// class _Notice1State extends State<adminsdetail> {
//   @override
//   Widget build(BuildContext context) {
//     List<Map> datasdetail = [
//       {
//         'icondata': 'assett/profile.png',
//         'title': profile,
//         'onTap1': () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => proadmin(),
//               ));
//           // 'title1': 'bdhbbhg'
//         },
//         //'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
//       },
//       {
//         'icondata': 'assett/at2.png',
//         'title': attendance,
//         'onTap1': () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => December(),
//               ));
//           // 'title1': 'bdhbbhg'
//         },
//         //'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
//       },
//       {
//         'icondata': 'assett/F1.png',
//         'title': fees,
//         'onTap1': () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => AdFees(),
//               ));
//         },
//       },
//       {
//         'icondata': 'assett/t1.png',
//         'title': task,
//         'onTap1': () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => TaskAdmin(),
//               ));
//           // 'title1': 'bdhbbhg'
//         },
//         //'detail': 'vfyhguj'
//       },
//       {
//         'icondata': 'assett/exam (1).png',
//         'title': exam,
//         'onTap1': () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => examAdmin(),
//               ));
//           // 'title1': 'bdhbbhg'
//         },
//         // 'detail': 'holiday all day'
//       },
//       {
//         'icondata': 'assett/c2.png',
//         'title': certificate,
//         'onTap1': () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => admincerti(),
//               ));
//           // 'title1': 'bdhbbhg'
//         },
//         //'detail': 'come fast'
//       },
//     ];
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: blue,
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(arrowback, color: white)),
//             title: Text(studentDetail),
//             centerTitle: true,
//           ),
//           body: ListView.builder(
//               itemCount: datasdetail.length,
//               itemBuilder: (context, index) {
//                 return commonContainersdetail(
//                     context, datasdetail[index], white);
//                 //  index.isOdd ? Color(0xffF36F24) : Color(0xffF03508c));
//               })),
//     );
//   }
// }