import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:exam/screens/profile.dart';
import 'package:exam/screens/task.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';
import 'attendance.dart';
import 'brousher.dart';
import 'changepass.dart';
import 'exam.dart';
import 'feedback.dart';
import 'fees.dart';
import 'gallery.dart';
import 'idcard.dart';
import 'login.dart';
import 'material.dart';
import 'notice.dart';


Widget commonContainer(context, Map data, Color clr) {
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
        leading: Icon(
          data['icondata'],
          color: white,
        ),
        title: Text(data['title'], style: TextStyle(color: white)),
        onTap: data['ontap'],
      ),
    ),
  );
}

class DashBord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashBordPage();
}

class DashBordPage extends State {
  File? img;

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userEmail = pref.getString('user') ?? '';
    MyDataBase.selectUserData(userEmail).then((value) {
      // setState(() {});
    });
  }

  selectImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    img = File(image!.path);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
    FirebaseApi.getBrousherImage();
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    List<Map> data = [
      {
        'icondata': icperson,
        'title': profile,
        // 'iconbtn': arrowforword,
        'ontap': () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pro1(),
              ),
            );
          });
        }
      },
      {
        'icondata': icpassword,
        'title': changepass,
        // 'iconbtn': arrowforword,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => cpass(),
              ));
        }
      },
      {
        'icondata': icabtcmp,
        'title': abtcmp,
        // 'iconbtn': arrowforword,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(),
              ));
        }
      },
      {
        'icondata': icdigiid,
        'title': digiid,
        // 'iconbtn': arrowforword,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Id(),
              ));
        }
      },
      {
        'icondata': Icons.feedback_outlined,
        'title': feedback,
        // 'iconbtn': arrowforword,
        'ontap': () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FeedbackForm(),
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
                                MaterialPageRoute(builder: (c) => Login()),
                                (route) => false);
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Login(),
                            //     ));
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (context) {
                            //   return Project();
                            // }));
                          },
                          child: Text(yes)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(no))
                    ],
                  ));
        }
      },
    ];

    List data1 = [
      {
        'title': attendance,
        'icondata': 'assett/Attendence.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => December(),
          ));
        }
      },
      {
        'title': notice,
        'icondata': 'assett/notice.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Notice1(),
          ));
        }
      },
      {
        'title': task,
        'icondata': 'assett/task1.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Task(),
          ));
        }
      },
      {
        'title': material,
        'icondata': 'assett/material1.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MaterialStudent(),
          ));
        }
      },
      {
        'title': exam,
        'icondata': 'assett/exam.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Exam(),
          ));
        }
      },
      // {
      //   'title': certificate,
      //   'icondata': 'assett/certificate.jpg',
      //   'onTap': () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => Certi(),
      //     ));
      //   }
      // },
      {
        'title': gallery,
        'icondata': 'assett/gallery.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ListGallarystudent(),
          ));
        }
      },
      {
        'title': fees,
        'icondata': 'assett/Fees.jpg',
        'onTap': () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Fee(),
          ));
        }
      },
    ];

    return Scaffold(
      drawer: Drawer(
        child: Column(children: [
          Image(image: AssetImage('assett/logo2.PNG')),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(profile1['Name'] ?? '',
                style: TextStyle(
                    color: black, fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return commonContainer(context, data[index], blue);
              },
              itemCount: data.length,
            ),
          ),
        ]),
      ),
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          IFlutter,
          style: TextStyle(color: white),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CarouselSlider(
              items: [
                Container(
                  // margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assett/stu.jpg'), fit: BoxFit.cover),
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
                        image: AssetImage('assett/stu.jpg'), fit: BoxFit.cover),
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
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                //scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.3,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: data1[index]['onTap'],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            data1[index]['icondata'],
                            width: 50,
                            height: 50,
                          ),
                          Text(data1[index]['title']),
                        ],
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Card(
                elevation: 15,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        FeesSummery,
                        style: TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                        color: black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Divider(thickness: 1,),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Fee(),
                          ));
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 120,
                                color: blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(Total,
                                            style: TextStyle(
                                                color: white, fontSize: 14)),
                                        Text(Ammount,
                                            style: TextStyle(
                                                color: white, fontSize: 14)),
                                        Text(
                                          profile1['fees'] ?? '0',
                                          style: TextStyle(color: white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 70,
                                color: org,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(Paid,
                                            style: TextStyle(
                                                color: white, fontSize: 14)),
                                        Text(Ammount,
                                            style: TextStyle(
                                                color: white, fontSize: 14)),
                                        Text(
                                          FirebaseApi.paidFees,
                                          style: TextStyle(color: white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: 120,
                                width: 70,
                                color: blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(Remain,
                                            style: TextStyle(
                                                color: white, fontSize: 14)),
                                        Text(Ammount,
                                            style: TextStyle(
                                                color: white, fontSize: 14)),
                                        Text(
                                          '${int.parse(profile1['fees'] ?? '0') - int.parse(FirebaseApi.paidFees)}',
                                          style: TextStyle(color: white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
