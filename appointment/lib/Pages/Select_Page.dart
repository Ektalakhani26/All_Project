// import 'package:appointment/Pages/Login_Page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.blue.shade400,
//         child: Column(
//           //mainAxisAlignment: MainAxisAlignment.center,
//
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.4,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/doctor2.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//
//             ),
//             Card(
//               color:Opacity(0.5),
//               margin: EdgeInsets.all(20.0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Welcome to Your Appointment App",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24.0,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 16.0),
//                     Text(
//                       "Your one-stop solution for managing appointments and healthcare.",
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 16.0,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 25.0),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => LogInPage()),
//                               );
//                             },
//                             icon: Icon(Icons.medical_services),
//                             label: Text("Login as Doctor"),
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 16.0),
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => LogInPage()),
//                               );
//                             },
//                             icon: Icon(Icons.person),
//                             label: Text("Login as Patient"),
//                             style: ButtonStyle(
//                               backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//



import 'package:appointment/Pages/Login_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Selection_Page extends StatefulWidget {
  Selection_Page({Key? key});

  @override
  State<Selection_Page> createState() => _HomePageState();
}

class _HomePageState extends State<Selection_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/screen2.jpg"),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    margin: EdgeInsets.all(20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to Your Appointment App !!",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            "Your one-stop solution for managing appointments and healthcare.",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LogInPage()),
                                    );
                                  },
                                  icon: Icon(Icons.medical_services,color: Colors.white),
                                  label: Text("Login as Doctor",style: TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => LogInPage()),
                                    );
                                  },
                                  icon: Icon(Icons.person,color: Colors.white),
                                  label: Text("Login as Patient",style: TextStyle(color: Colors.white)),
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
