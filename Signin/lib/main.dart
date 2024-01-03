import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin/model.dart';
import 'package:signin/screen/myntra.dart';
import 'signup/Login1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: Crovsol(),
      ),
    );
  }
}

class Crovsol extends StatefulWidget {
  Crovsol({Key? key}) : super(key: key);

  @override
  State<Crovsol> createState() => CrovsolState();
}

class CrovsolState extends State<Crovsol> {
  // _CrovsolState(this.uname, this.pa);
  static const String spalc = "Spalc";
  static const String login = "Login";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saved();
    //read();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
        child: Image(image: AssetImage('assets/mlogo.png')),
      ),
    );
  }
  void saved() async {
     SharedPreferences pref1 = await SharedPreferences.getInstance();
    SharedPreferences pref = await SharedPreferences.getInstance();
   var Spalc = pref.getBool(spalc);
    var LogIn = pref1.getBool(login);
   if(Spalc != null && LogIn != null){
     if(Spalc && LogIn){
       Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => Myntra())),);
     }
     else if(Spalc){
       Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => Login1())),);
     }
     else{
       Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (context) => Login())),);
     }
   }
   else{
     Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => Login())),);
   }
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<model> listdata = [];
  int current =0;
  PageController _pagecontrol = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata.add(model('assets/img1.jpg', 'Topic modeling can assign application descriptions to topics with a certain probability. What we want, however, is to cluster applications with similar descriptions within the same group. It would appear reasonable to consider obtained topics as separate clusters, but unfortunately topic modeling does not provide a binary decision of whether a description belongs to a particular topic. Moreover, each description may be related to many topics, and even with equal probability, so it would not be clear how to choose a specific cluster for a given application description.'));
    listdata.add(model('assets/img2.jpg', 'Implementation Highlight Designer works by recording the actions a user takes in the browser, and converting these actions into a mobile application description. Mobile applications are represented as a directed graph of pagelets. Each pagelet represents one page that might be seen on the mobile device. Pagelets are described in two parts:'));
    listdata.add(model('assets/img3.jpg', 'Transition events that describe the navigation element in the pagelet that causes a transition to the next pagelet. These events also store the sequence of interactions that were demonstrated on the existing Web site to reach the page from which the next pagelets content will be clipped. Each transition is represented by an arrow on the storyboard view'));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 for(int i=0;i<listdata.length;i++)...[
                   Padding(
                       padding: EdgeInsets.all(10),
                        child: Container(
                              width: (current==i)? 12 : 6,
                             height: (current==i) ? 12 : 6,
                          decoration: BoxDecoration(color: (current==i)?Colors.blueAccent : Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                   ),
                 ],
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () async{
                setState(() {

                });
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool(CrovsolState.spalc, true);
                current==listdata.length-1 ? Navigator.push(context, MaterialPageRoute(builder: (context) => Login1(),)) : 'skip<<' ;

                _pagecontrol.animateToPage(current+1, duration: Duration(seconds: 2), curve: Curves.linear);

              }, child: Text((current!=listdata.length-1) ? 'skip<<' : 'Get Started'),),
            ],
          ),
        ],
      ),

      body: Center(
        child:  PageView.builder(
          itemCount: listdata.length,
          controller: _pagecontrol,
          onPageChanged: (value) {
            current = value ;
            setState(() {

            });
          },
          itemBuilder: (context, index) {
            return OtherScreen.pera(listdata[index]);
          },),
      ),
    );
  }
}

/* ==================================================================
*********************************************************************
* =============================================================================
* =========================================================================
* ===============================================================================
* =============================================================================
* =
* =
* =
 */
class OtherScreen extends StatefulWidget {
   OtherScreen(model listdata, {Key? key}) : super(key: key);
   model? obj;
   OtherScreen.pera(this.obj);

  @override

  State<OtherScreen> createState() => _OtherScreenState(obj!);
}

class _OtherScreenState extends State<OtherScreen> {
  model? obj;
  _OtherScreenState(this.obj);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150),
                width: 300,
                height: 250,
                //color: obj.color,
                //decoration: BoxDecoration(color: color[index]),
                child:  Image(image: AssetImage('${obj!.img}')),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.all(20),
                child:  Text('${obj!.desc}'),
              ),
            ],
          ),
        ),

    );
  }
}


