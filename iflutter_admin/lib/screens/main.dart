import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/screens/adminlogin.dart';
import 'package:untitled/screens/dashboardadmin.dart';
import 'package:untitled/screens/examadmin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();

  var chaek = pref.getString('name');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: Myapp(),
        // home: examAdmin(),
        home: chaek == null ? const loginadmin() : dashBoardAdmin(),
      ),
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController snamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController coursecontroller = TextEditingController();
  TextEditingController mobcontroller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     Mydatabase.selectData();
  //   });
  // }

  Map selecteddata = {};

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: key,
            child: Column(
              children: [
                //   TextFormField(
                //     controller: snamecontroller..text = selecteddata['sname'] ?? '',
                //     decoration: InputDecoration(
                //       label: const Text('sname'),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8.0),
                //     child: TextFormField(
                //       controller: emailcontroller..text = selecteddata['email'] ?? '',
                //       decoration: InputDecoration(
                //         label: const Text('Email'),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //       ),
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8.0),
                //     child: TextFormField(
                //       controller: coursecontroller
                //         ..text = selecteddata['course'] ?? '',
                //       keyboardType: TextInputType.phone,
                //       decoration: InputDecoration(
                //         label: const Text('course'),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //       ),
                //     ),
                //   ),
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8.0),
                //     child: TextFormField(
                //       controller: mobcontroller..text = selecteddata['mob'] ?? '',
                //       keyboardType: TextInputType.phone,
                //       decoration: InputDecoration(
                //         label: const Text('mob'),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //         ),
                //       ),
                //     ),
                //   ),
                //   ElevatedButton(
                //       onPressed: () {
                //         Mydatabase.insertdata(
                //           sname: snamecontroller.text,
                //           email: emailcontroller.text,
                //           course: coursecontroller.text,
                //           mob: mobcontroller.text,
                //         );
                //       },
                //       child: const Text('Insert')),
                //   ElevatedButton(
                //       onPressed: () {
                //         Mydatabase.updateData(
                //           sname: snamecontroller.text,
                //           email: emailcontroller.text,
                //           course: coursecontroller.text,
                //           mob: mobcontroller.text,
                //           keyvalue: selecteddata['key'],
                //         );
                //       },
                //       child: const Text('update')),
                //   ElevatedButton(
                //     onPressed: () {
                //       Mydatabase.selectData().then((value) {
                //         setState(() {});
                //       });
                //     },
                //     child: const Text('Select'),
                //   ),
                //   ElevatedButton(
                //     onPressed: () {
                //       var index;
                //       Mydatabase.deleteData(
                //           // keyvalue: Mydatabase.allData[index]['key']
                //           );
                //     },
                //     child: const Text('delete'),
                //   ),
                //   Expanded(
                //     child: ListView.builder(
                //       itemCount: Mydatabase.allData.length,
                //       itemBuilder: (context, index) {
                //         return ListTile(
                //           onTap: () {
                //             Mydatabase.deleteData(
                //                 keyvalue: Mydatabase.allData[index]['key']);
                //             selecteddata.clear();
                //             selecteddata = Mydatabase.allData[index];
                //             setState(() {});
                //           },
                //           title: Text(Mydatabase.allData[index]['sname'] ?? ''),
                //           subtitle: Text(Mydatabase.allData[index]['course'] ?? ''),
                //         );
                //       },
                //     ),
                //   ),
              ],
            )),
      ),
    );
  }
}

/*ppBar: AppBar(
        backgroundColor: Colors.black54,
        //title: Text('make my trip'),
        actions: [
          Icon(Icons.book),
          Container(
            height: 70,
            width: 100,
            padding: EdgeInsets.only(bottom: 1.0, top: 5.0, left: 7.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.all(Radius.ci
              rcular(20.0)),
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.all(3.0)),
                Icon(
                  Icons.note,
                  color: Colors.red,
                ),
                Padding(padding: EdgeInsets.only(left: 5.0)),
                Text('biz',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(left: 5.0)),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ],
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 500,
              margin:
                  EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Icon(
                    Icons.note,
                    color: Colors.red,
                  ),
                  Expanded(
                    // flex: 1,
                    child: Icon(Icons.search),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text('try mumbai to pune bus'),
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Container(
                  height: 80,
                  width: 500,
                  margin: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: (20.0),
                          child: Icon(
                            Icons.flight,
                            color: Colors.blue,
                          ),
                        ),
                        Text('flights'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: (20.0),
                          child: Icon(
                            Icons.account_balance_sharp,
                            color: Colors.purpleAccent,
                          ),
                        ),
                        Text('hotels'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: (20.0),
                          child: Icon(
                            Icons.train,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text('train&bus'),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          radius: (20.0),
                          child: Icon(
                            Icons.nature_people,
                            color: Colors.cyan,
                          ),
                        ),
                        Text('holiday package'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 150,
              width: 500,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.car_rental,
                        color: Colors.blue,
                        size: 50,
                      ),
                      Text('airports cab'),
                      Icon(
                        Icons.car_repair,
                        color: Colors.blue,
                        size: 50,
                      ),
                      Text('self drive'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.purpleAccent,
                        size: 50,
                      ),
                      Text('home stay'),
                      Icon(
                        Icons.location_on,
                        color: Colors.purpleAccent,
                        size: 50,
                      ),
                      Text('nearby getaway'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.drive_eta,
                        color: Colors.orangeAccent,
                        size: 50,
                      ),
                      Text('outstation cab'),
                      Icon(
                        Icons.note,
                        color: Colors.orangeAccent,
                        size: 50,
                      ),
                      Text('trains PNR status'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.cyan,
                        size: 50,
                      ),
                      Text('activities tours'),
                      Icon(
                        Icons.home_repair_service,
                        color: Colors.cyan,
                        size: 50,
                      ),
                      Text('visa service'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 500,
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(8.0)),
                  Icon(Icons.event),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    'event & festival',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Icon(Icons.card_giftcard),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    'gift card',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Icon(Icons.local_offer),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    'offers',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  Icon(Icons.drive_eta_sharp),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Text(
                    'hyd.',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 70,
                  width: 500,
                  margin: EdgeInsets.only(top: 10.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'did you get vaccinated?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text('you can download your certificate '),
                          ],
                        ),
                      ),
                      Icon(Icons.science_outlined),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 500,
                  margin: EdgeInsets.only(left: 10.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(
                        Icons.book_online,
                        color: Colors.blueAccent,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Text('book your'),
                            Text('vaccine slot'),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.download_sharp,
                        color: Colors.blueAccent,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Text('download your '),
                            Text('certificate'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 500,
                  margin: EdgeInsets.only(left: 10.0, top: 1.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 30.0),
                      ),
                      Text(
                        'already download certificate, vire here',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 160.0),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Icon(
                      Icons.settings,
                      color: Colors.deepOrange,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      'what\'s new',
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                  ],
                ),
                Container(
                    height: 40,
                    width: 500,
                    margin: EdgeInsets.only(left: 5.0),
                    color: Colors.white,
                    child: Row(children: [
                      Container(
                        height: 20,
                        width: 200,
                        margin: EdgeInsets.only(left: 40.0),
                        color: Colors.blueAccent,
                        child: Text(
                          'travel news',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 200,
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        color: Colors.grey,
                        child: Text(
                          'announcement',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ]))
              ],
            ),
            Container(
              height: 50,
              width: 500,
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //SizedBox(width: 20),
                  Column(
                    children: [
                      Icon(
                        Icons.home,
                        color: Colors.blue,
                      ),
                      Text(
                        'home',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  //SizedBox(width: 50),
                  Column(
                    children: [
                      Icon(
                        Icons.trip_origin,
                        color: Colors.white,
                      ),
                      Text(
                        'my trips',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  // SizedBox(width: 50),
                  Column(
                    children: [
                      Icon(
                        Icons.local_offer_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'offers',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  //  SizedBox(width: 50),
                  Column(
                    children: [
                      Icon(
                        Icons.panorama_wide_angle_select,
                        color: Colors.white,
                      ),
                      Text(
                        'trip ideas',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  //  SizedBox(width: 50),
                  Column(
                    children: [
                      Icon(
                        Icons.photo,
                        color: Colors.white,
                      ),
                      Text(
                        'tripmoney',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  // SizedBox(width: 20),
                ],
              ),
            )
          ],
        ),
      ]),
    );


    body: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),Container(
            height: 50,
            width: 50,
            color: Colors.yellow,
          ),
        ],
      ),
      // body: Row(
      //   children: [
      //     Icon(Icons.note),
      //     // SizedBox(width: 5,),
      //     Expanded(
      //       flex: 3,
      //       child: Container(
      //         color: Colors.red,
      //         child: Text(
      //           'biz',
      //           style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: Container(
      //           color: Colors.yellow,child: Icon(Icons.arrow_forward_ios)),
      //     ),
      //   ],
      // ),
    );*/
/* return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          print('ok');
        },
        child: Icon(Icons.add, size: 40,),
        elevation: 50,

      ),
      appBar: AppBar(
        title: Text('NET E IMS'),
        actions: [
          Icon(Icons.account_box_sharp),
          Icon(Icons.qr_code),
        ],
        bottom: PreferredSize(
            child: Container(
              height: 50,
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Icon(Icons.account_box_sharp, color: Colors.white),
                  Text('sutex bank college of computer application and science',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ],
              ),
            ),
            preferredSize: Size(0, 100)),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Column(
              children: [
                Icon(
                  Icons.account_box,
                  size: 60,
                ),
                Text('gangani jinal vinodbhai',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(padding: EdgeInsets.all(10.0)),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('profile'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.list),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('attendance'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.work),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('teaching work'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.money_outlined),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('fees'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.book),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('assignment'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.store),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('syllabus'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.book_online),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('e-book'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.note),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('notice'),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.people_alt),
                    Padding(padding: EdgeInsets.only(left: 10.0,bottom: 40.0)),
                    Text('staff list'),
                  ],
                )
              ],
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Row(
                  children: [
                    Icon(Icons.notification_important, color: Colors.white),
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    Text('please download and fill the form',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: 200,
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 25.0, left: 25.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 25.0, right: 60.0)),
                        Icon(Icons.account_circle_rounded,
                            size: 30, color: Colors.grey),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //Padding(padding: EdgeInsets.only(top: 30.0)),
                        Text('Attendance',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        // Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text('90%',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 200,
                    margin: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 25.0, left: 25.0),
                    // margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 60.0)),
                            Icon(Icons.speaker_phone_sharp,
                                size: 30, color: Colors.grey),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //Padding(padding: EdgeInsets.only(top: 30.0)),
                            Text('notice board',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            // Padding(padding: EdgeInsets.only(bottom: 10.0)),
                            Text('199',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: 200,
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 25.0, left: 25.0),
                // margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 25.0, right: 60.0)),
                        Icon(Icons.dashboard, size: 30, color: Colors.grey),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //Padding(padding: EdgeInsets.only(top: 30.0)),
                        Text('discussion board',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        // Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text('45',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 200,
                    margin: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 25.0, left: 25.0),
                    // margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 60.0)),
                            Icon(Icons.departure_board,
                                size: 30, color: Colors.grey),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //Padding(padding: EdgeInsets.only(top: 30.0)),
                            Text('teaching topics',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            // Padding(padding: EdgeInsets.only(bottom: 10.0)),
                            Text('0',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 80,
                width: 200,
                margin: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, right: 25.0, left: 25.0),
                //margin: EdgeInsets.all(15.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 25.0, right: 60.0)),
                        Icon(Icons.book, size: 30, color: Colors.grey),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //Padding(padding: EdgeInsets.only(top: 30.0)),
                        Text('assignment book',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        // Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text('-',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 200,
                    //margin: EdgeInsets.all(15.0),
                    margin: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, right: 25.0, left: 25.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 25.0, right: 60.0)),
                            Icon(Icons.bookmarks_sharp,
                                size: 30, color: Colors.grey),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //Padding(padding: EdgeInsets.only(top: 30.0)),
                            Text('syllabus',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            // Padding(padding: EdgeInsets.only(bottom: 10.0)),
                            Text('-',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 430,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text('fees summary',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 144,
                    padding: EdgeInsets.all(25.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('total amount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text('14,175',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.blueAccent)),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 143,
                    padding: EdgeInsets.all(25.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('paid amount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text('0',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.lightGreen)),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 143,
                    padding: EdgeInsets.all(25.0),
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(5.0, 5.0),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('amount',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        Text('14,175',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.redAccent)),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );*/
/*return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.monetization_on_outlined),
        title: Container(
          child: Column(
            children: [
              Text('\$12,000'),
              Text('vesu'),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height: 150,
                width: 250,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_rounded, size: 40, color: Colors.white),
                      Text('load money',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,

                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.zoom_out_map,
                              size: 40, color: Colors.white),
                          Text('Request money',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 150,
                width: 250,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.print, size: 40, color: Colors.white),
                      Text('marchent money',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 40, color: Colors.white),
                          Text('send money',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 140,
                width: 520,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:
                          Icon(Icons.search_rounded),
                        ),
                      ],
                     // crossAxisAlignment: CrossAxisAlignment.start,

                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20.0, left: 350.0)),
                        Text('shell darwen',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Padding(padding: const EdgeInsets.only(bottom: 30.0)),
                        Text('marchent payment',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Text('=\$30',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Text('6/5/19',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                height: 140,
                width: 520,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child:
                          Icon(Icons.search_rounded),
                        ),
                      ],
                      // crossAxisAlignment: CrossAxisAlignment.start,

                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20.0, left: 350.0)),
                        Text('jhon deo',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Padding(padding: const EdgeInsets.only(bottom: 30.0)),
                        Text('marchent payment',
                            style:
                                TextStyle(fontSize: 15, color: Colors.white)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Text('=\$30',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Text('6/5/19',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );*/

/* return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),l
          actions: [
            Icon(Icons.search_rounded),
            Icon(Icons.mic),
            Icon(Icons.shopping_cart),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 250,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 350.0, right: 350.0, bottom: 30.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black87, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: const [
                            Colors.blueAccent,
                            Colors.green,
                          ])),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('realme',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 50, color: Colors.white)),
                        Text('narzo',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 50, color: Colors.white)),
                        Text('50A',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 80, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 200.0, bottom: 250.0),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child:
                              Icon(Icons.favorite_rounded, color: Colors.black),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child:
                              Icon(Icons.forward_rounded, color: Colors.black),
                          decoration: BoxDecoration(
                              color: Colors.black12, shape: BoxShape.circle),
                        )
                      ],
                    )),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(15.0)),
                Text('select variant',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
                Divider(
                  color: Colors.black87,
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(15.0)),
                Icon(Icons.color_lens),
                Padding(padding: const EdgeInsets.only(left: 10.0)),
                Text('color:'),
                Text('Oxygen blue',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(padding: const EdgeInsets.only(right: 1250.0)),
                Text('2 more'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(15.0)),
                Icon(Icons.storage),
                Padding(padding: const EdgeInsets.only(left: 10.0)),
                Text('storage:'),
                Text('64 GB', style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(padding: const EdgeInsets.only(right: 1274.0)),
                Text('2 more'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(15.0)),
                Text('realme  Narzo  50A (Oxygen Blue , 64GB ) ( 4 GB RAM)',
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(10.0)),
                Container(
                  height: 30,
                  width: 50,
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Text('4.4*'),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10.0)),
                Text('1,01,393 ratings'),
              ],
            ),
            Row(
              children: [
                Padding(padding: const EdgeInsets.all(15.0)),
                Text('12,999'),
                Icon(Icons.monetization_on_outlined),
                Text('11,499'),
                Text('11% off'),
              ],
            ),
            Row(
              children: [
                Container(
                    height: 50,
                    width: 750,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black87, width: 1.0),
                      // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text('ADD TO CART'),
                    )),
                Container(
                    height: 50,
                    width: 750,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(color: Colors.black87, width: 1.0),
                      // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text('BUY NOW',
                          style: TextStyle(backgroundColor: Colors.amber)),
                    )),
              ],
            ),
          ],
        ));*/

/*return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('jinal'),

              ],
            ),


            )
          ],
        )
        ),



      appBar: AppBar(
        // leading: Icon(Icons.menu),
        title: Text('My First Page'),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications),
          Icon(Icons.search),
        ],
        bottom: PreferredSize(
            child: Container(
              height: 50,
              color: Colors.yellow,
            ),
            preferredSize: Size(0, 100)),
      ),
    );*/
/* return Scaffold(
        floatingActionButton: FloatingActionButton(
        onPressed: ()
    {
      print('hjgnhbhgtng');
    },
    child: Icon(Icons.add, size: 40,),
    elevation: 50,

    ),
    body: Container(
    // color: Colors.green,
    height: 300,
    width: 300,
    child: Text('Hello'),
    margin: EdgeInsets.all(50.0),
    padding: EdgeInsets.all(120.0),
    // padding: EdgeInsets.symmetric(vertical: 50.0),
    decoration: BoxDecoration(
    color: Colors.yellow,
    border: Border(
    right: BorderSide(color: Colors.red, width: 5.0),
    ),
    //border: Border.all(color: Colors.red, width: 5.0),
    //borderRadius: BorderRadius.all(Radius.circular(20.05))
    //borderRadius: BorderRadius.only(
    //bottomRight: Radius.circular(250.0),
    //topRight: Radius.circular(250.0))
    // shape: BoxShape.circle,
    )
    ,
    //  child: Column(
    // mainAxisAlignment: MainAxisAlignment.start,
    //crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisSize: MainAxisSize.min,
    // children: [
    //   Text('Hello : '),
    //   Text('World'),
    //   Icon(Icons.ac_unit_outlined)
    // ],

    //),
    // body: Center(
    // child: Icon(
    //   Icons.add_chart,
    //   size: 50,
    //   color: Colors.yellow,
    // ),
    // child: Text(
    //   'hello',
    //   maxLines: 2,
    //   style: TextStyle(
    //     fontSize: 50.0,
    //     color: Colors.green,
    //     fontStyle: FontStyle.italic,
    //     fontWeight: FontWeight.bold,
    //     // letterSpacing: 10.0,
    //   ),
    // ),
    // ),
    );*/
