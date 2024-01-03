import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BottomNavigationBar/BottomNavigationbar.dart';
import 'loginscreen/login.dart';
import 'model.dart';
import 'screens/HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.blueAccent.shade400,primarySwatch: Colors.blue)
      ),
      title: 'Material App',
      home:SpalcScreen(),
    );
  }
}

//===================SpalcScreen====================

class SpalcScreen extends StatefulWidget {
  const SpalcScreen({Key? key}) : super(key: key);

  @override
  State<SpalcScreen> createState() => SpalcScreenState();
}

class SpalcScreenState extends State<SpalcScreen> {
  static const String spalc = "Spalc";
  static const String login = "Login";
  @override
  void initState() {
    // TODO: implement initState
    saved();
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 1) , () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNavigationBar1(),));
    // },);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Image(image: AssetImage('assets/spalce.jpeg'),fit: BoxFit.fill,),
          ],
        ),
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
            context, MaterialPageRoute(builder: (context) => HomeScreen())),);
      }
      else if(Spalc){
        Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage())),);
      }
      else{
        Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CrovsolScreen())),);
      }
    }
    else{
      Timer(Duration(seconds: 1), () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CrovsolScreen())),);
    }
  }
}


//============CrovsolScreen================


class CrovsolScreen extends StatefulWidget {
  const CrovsolScreen({Key? key}) : super(key: key);

  @override
  State<CrovsolScreen> createState() => _CrovsolScreenState();
}

class _CrovsolScreenState extends State<CrovsolScreen> {
  List<model> listofmodel = [];
  int current =0;
  PageController _pagecontrol = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listofmodel.add(model('assets/c1.jpg'));
    listofmodel.add(model('assets/c4.jpg'));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i=0;i<listofmodel.length;i++)...[
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
                pref.setBool(SpalcScreenState.spalc, true);
                current==listofmodel.length-1 ? Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),)) : 'skip<<' ;

                _pagecontrol.animateToPage(current+1, duration: Duration(seconds: 2), curve: Curves.linear);

              }, child: Text((current==listofmodel.length-1) ? 'Get Strated' : 'Next',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            ],
          ),
        ],
      ),

      body: Center(
        child:  PageView.builder(
          itemCount: listofmodel.length,
          controller: _pagecontrol,
          onPageChanged: (value) {
            current = value ;
            setState(() {

            });
          },
          itemBuilder: (context, index) {
            return OtherScreen.pera(listofmodel[index]);
          },),
      ),
    );
  }
}

// ==================== other Screeen=============


class OtherScreen extends StatefulWidget {
  OtherScreen({Key? key}) : super(key: key);

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Center(
        child: Container(
          width: size.width*0.9,
            height: size.height/3,
            color: Colors.teal,
            child: Image(image: AssetImage('${obj!.img}'),fit: BoxFit.fill,)),
      ),

    );
  }
}



