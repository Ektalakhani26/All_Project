import 'package:flutter/material.dart';
import 'package:untitled/screens/adminlogin.dart';
import 'package:untitled/screens/adminprofile.dart';
import 'package:untitled/screens/annouadmin.dart';
import 'package:untitled/screens/attadmin.dart';
import 'package:untitled/screens/broshadmin.dart';
import 'package:untitled/screens/cpassadmin.dart';
import 'package:untitled/screens/feedback.dart';
import 'package:untitled/screens/feesadmin.dart';
import 'package:untitled/screens/gallaryadmin.dart';
import 'package:untitled/screens/materialadmin.dart';
import 'package:untitled/screens/studdetail.dart';
import 'package:untitled/screens/studentlist.dart';
import 'package:untitled/utils/colors.dart';
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

class dashBoardAdmin extends StatefulWidget {
  dashBoardAdmin({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<dashBoardAdmin> {
  @override
  Widget build(BuildContext context) {
    List<Map> datadash = [
      {
        'icondata': 'assett/STULIST.png',
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => slist(),
              ));
        },
        'title1': slst
      },
      {
        'icondata': 'assett/an.png',
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => annouadmin(),
              ));
        },
        'title1': notice
      },
      {
        'icondata': 'assett/at2.png',
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Attendenceadmin(),
              ));
        },
        'title1': attendance
      },
      {
        'icondata': 'assett/F1.png',
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdFees(),
              ));
        },
        'title1': fees
      },
      {
        'icondata': 'assett/gallary.png',
        'onTap1': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListGallaryAdmin(),
              ));
        },
        'title1': gallery
      },
      {
        'icondata': 'assett/material1.jpg',
        'onTap1': () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => adminmaterial()));
        },
        'title1': material
      },
    ];
    List<Map> datadr = [
      {
        'icondata': icabtcmp,
        'title': abtcmp,
        'iconbtn': arrowforword,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => broshadmin(),
              ));
        }
      },
      // {
      //   'icondata': icpassword,
      //   'title': changepass,
      //   'iconbtn': arrowforword,
      //   'ontap': () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => cpass(),
      //         ));
      //   }
      // },
      {
        'icondata': icfedd,
        'title': feedbackadmin,
        'iconbtn': arrowforword,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => feedback(),
              ));
        }
      },
      {
        'icondata': iclogout,
        'title': logout,
        'iconbtn': arrowforword,
        'ontap': () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(surelogout),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.remove('name');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (c) => loginadmin()),
                                (route) => false);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => loginadmin(),
                            //     ));
                          },
                          child: Text(yes)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return dashBoardAdmin();
                            }));
                          },
                          child: Text(no))
                    ],
                  ));
        }
      },
    ];
    Widget commonContainerdash(context, Map datadr, Color clr) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: clr,
          ),
          // print(data.length.isOdd);
          child: ListTile(
              onTap: datadr['ontap'],
              leading: Icon(
                datadr['icondata'],
                color: white,
              ),
              title: Text(
                datadr['title'],
                style: TextStyle(color: white),
              )),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(children: [
            Image(image: AssetImage('assett/logo2.PNG')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(ifl,
                  style: TextStyle(
                      color: black, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return commonContainerdash(context, datadr[index], blue);
                },
                itemCount: datadr.length,
              ),
            ),
          ]),
        ),
        appBar: AppBar(
          backgroundColor: blue,
          title: Text(
            dashBord,
            style: TextStyle(color: white),
          ),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //       icon: Icon(icnotification, color: white)),
          // ],
        ),

        //backgroundColor: Color(0xff03508C),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ListView(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    // margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assett/stu.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                      // borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assett/stu1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assett/stu2.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assett/stu.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assett/stu 3.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  //  onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      // crossAxisSpacing: 0.5,
                      mainAxisSpacing: 30.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: datadash.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shadowColor: blue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          elevation: 10.0,
                          child: GestureDetector(
                            onTap: datadash[index]['onTap1'],
                            child: Column(
                              children: [
                                Image.asset(
                                  datadash[index]['icondata'],
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 0.12,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  datadash[index]['title1'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: blue,
                                      fontSize: 16.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                      // return Column(
                      //     children: [
                      //   GestureDetector(
                      //     onTap: datadash[index]['onTap1'],
                      //     child: Card(
                      //       // margin: EdgeInsets.all(10),
                      //       shadowColor: blue,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //       ),
                      //       elevation: 10.0,
                      //       child: Image.asset(
                      //         datadash[index]['icondata'],
                      //         //width: 100 ,
                      //         // height: 100,
                      //         width: MediaQuery.of(context).size.width * 0.3,
                      //         height: MediaQuery.of(context).size.height * 0.12,
                      //       ),
                      //     ),
                      //   ),
                      //   // SizedBox(
                      //   //   height: 10,
                      //   // ),
                      //   Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //     child: Text(
                      //       datadash[index]['title1'],
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.w500,
                      //           color: blue,
                      //           fontSize: 16.0),
                      //     ),
                      //   )
                      // ]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
