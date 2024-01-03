import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

Widget common1container(String key, String value) {
  // print(data1);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(flex: 2, child: Text(key)),
            Text(' :   '),
            Expanded(flex: 3, child: Text(value)),
          ],
        ),
        Divider()
      ],
    ),
  );
}

class pro1 extends StatefulWidget {
  Map detail;

  pro1(this.detail, {Key? key}) : super(key: key);

  _pro1State createState() => _pro1State();
}

class _pro1State extends State<pro1> {
  // File? img;

  String url =
      'https://firebasestorage.googleapis.com/v0/b/abhb-aefd5.appspot.com/o/images%2Fuploadpro.webp?alt=media&token=025370cd-ed23-4b2b-a1e0-02b545818bee';

  getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);

    Reference storageReference = FirebaseStorage.instance
        .ref('images/')
        .child(DateTime.now().toString());

    UploadTask task1 = storageReference.putFile(file!);

    print('++++');
    await (await task1).ref.getDownloadURL().then((value) {
      print('---');
      print(value);
      url = value;
    });
    setState(() {});
  }

  File? file;

  //

  void initState() {
    super.initState();
    MyDataBase.selectUserData().then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {});
      });
    });
  }

  // Map selecteddataform = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  arrowback,
                                  color: white,
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.8,
                            ),
                            // Padding(padding: EdgeInsets.only(left: 110.0)),
                            Text(profile,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: white)),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(200, 100.0)),
                      )),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 2,
                    // color: Colors.yellow,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          color: clrgrey,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(url)
                            // image: (img != null)
                            //     ? FileImage(img!)
                            //     : AssetImage('assett/abc.PNG') as ImageProvider,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Text(
                    editprofile,
                    style: TextStyle(fontSize: 16, color: blue),
                  )),
              SizedBox(
                height: 20,
              ),
              // ListView.builder(
              //     itemCount: Mydatabase.temp.length,
              //     itemBuilder: (context, index) {
              //       return common1container(
              //           context, Mydatabase.temp[index]['']);
              //     })

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    children: [
                      common1container('Name', '${widget.detail['Name']}'),
                      common1container('Address', '${widget.detail['Address']}'),
                      common1container('Email', '${widget.detail['Email']}'),
                      common1container('DateOfBirth', '${widget.detail['DateOfBirth']}'),
                      common1container('Personalmobile', '${widget.detail['Personalmobile']}'),
                      common1container('FathersNumber', '${widget.detail['FathersNumber']}'),
                      common1container('gender', '${widget.detail['gender']}'),
                      common1container('College', '${widget.detail['College']}'),
                      common1container('City', '${widget.detail['City']}'),
                      common1container('State', '${widget.detail['State']}'),
                      common1container('Country', '${widget.detail['Country']}'),
                      common1container('Pincode', '${widget.detail['Pincode']}'),
                      common1container('Course', '${widget.detail['Course']}'),
                      common1container('Bloodgroup', '${widget.detail['Bloodgroup']}'),
                    ],
                  ),
                  // child: ListView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     scrollDirection: Axis.vertical,
                  //     shrinkWrap: true,
                  //     itemCount: widget.detail.length,
                  //     itemBuilder: (context, index) {
                  //       return (widget.detail.keys.toList()[index] != 'Pass' &&
                  //               widget.detail.keys.toList()[index] != 'Username')
                  //           ? common1container(widget.detail.keys.toList()[index] ?? '',
                  //               widget.detail.values.toList()[index] ?? '')
                  //           : Container();
                  //     }),
                ),
              )
            ],
          ),
        ));
  }
}

//
// import 'package:untitled/utils/strings.dart';
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
//
// Widget commoncontaineradpro(context, Map dataprofile) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Row(
//       children: [
//         Expanded(flex: 2, child: Text(dataprofile['title'])),
//         Text(' :   '),
//         Expanded(flex: 3, child: Text(dataprofile['title1'])),
//       ],
//     ),
//   );
// }
//
// class pro1 extends StatefulWidget {
//   const pro1({Key? key}) : super(key: key);
//
//   @override
//   _pro1State createState() => _pro1State();
// }
//
// class _pro1State extends State<pro1> {
//   File? img;
//
//   selectImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     img = File(image!.path);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Container(
//                         height: MediaQuery.of(context).size.height / 5,
//                         width: double.infinity,
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 80.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               IconButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   icon: Icon(
//                                     arrowback,
//                                     color: white,
//                                   )),
//                               Padding(padding: EdgeInsets.only(left: 110.0)),
//                               Text(profile,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 25,
//                                       color: white)),
//                             ],
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           color: blue,
//                           borderRadius: BorderRadius.vertical(
//                               bottom: Radius.elliptical(200, 100.0)),
//                         )),
//                     Container(
//                       height: MediaQuery.of(context).size.height / 3,
//                       width: MediaQuery.of(context).size.width / 2,
//                       // color: Colors.yellow,
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 60.0),
//                         child: Container(
//                           height: MediaQuery.of(context).size.height / 2.5,
//                           width: MediaQuery.of(context).size.width / 2.5,
//                           /* margin: EdgeInsets.only(
//                         top: MediaQuery.of(context).size.height / 10,
//                         bottom: 20.0,
//                         right: 10.0,
//                         left: 10.0,
//                       ),*/
//                           decoration: BoxDecoration(
//                               color: black12,
//                               borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: (img != null)
//                                     ? FileImage(img!)
//                                     : AssetImage('assett/abc.PNG') as ImageProvider,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       selectImage();
//                     },
//                     child: Text(
//                       editprofile,
//                       style: TextStyle(fontSize: 16, color: blue),
//                     )),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: ListView.separated(
//                       physics: NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       itemCount: dataprofile.length,
//                       separatorBuilder: (context, index) => const Divider(),
//                       itemBuilder: (context, index) {
//                         return commoncontaineradpro(context, dataprofile[index]);
//                       }),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }
