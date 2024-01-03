import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: MediaQuery1(),
      ),
    );
  }
}

class MediaQuery1 extends StatefulWidget {
  const MediaQuery1({Key? key}) : super(key: key);

  @override
  State<MediaQuery1> createState() => _MediaQueryState();
}

class _MediaQueryState extends State<MediaQuery1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
          //color: Colors.blueAccent,
          width: size.width*0.9,
          height: size.height/10,
          decoration: BoxDecoration(color: Colors.purple.shade700,borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Setting',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                    margin: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    child: Icon(Icons.settings,size: size.height/25,color: Colors.white,),
                    margin: EdgeInsets.only(right: 20),
                  ),

                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('home',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                    margin: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    child: Icon(Icons.home,size: size.height/25,color: Colors.white,),
                    margin: EdgeInsets.only(right: 20),
                  ),
                ],
              ),
             // Text('Setting',style: TextStyle(fontSize: size.height/15),),
              //Icon(Icons.account_balance,size: size.width/20,),
            ],
          ),

        ),
          //SizedBox(width: 10,),
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(20)),
            width: size.width*0.9,
            height: size.height/10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Setting',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                      margin: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      child: Icon(Icons.settings,size: size.height/25,color: Colors.white),
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('home',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                      margin: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      child: Icon(Icons.home,size: size.height/25,color: Colors.white,),
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
                // Text('Setting',style: TextStyle(fontSize: size.height/15),),
                //Icon(Icons.account_balance,size: size.width/20,),
              ],
            ),

          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(color: Colors.green.shade700,borderRadius: BorderRadius.circular(20)),
            width: size.width*0.9,
            height: size.height/10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Setting',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                      margin: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      child: Icon(Icons.settings,size: size.height/25,color: Colors.white),
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('home',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                      margin: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      child: Icon(Icons.home,size: size.height/25,color: Colors.white),
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
                // Text('Setting',style: TextStyle(fontSize: size.height/15),),
                //Icon(Icons.account_balance,size: size.width/20,),
              ],
            ),

          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
            width: size.width*0.9,
            height: size.height/10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Setting',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                      margin: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      child: Icon(Icons.settings,size: size.height/25,color: Colors.white),
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('home',style: TextStyle(fontSize: size.height/25,color: Colors.white),),
                      margin: EdgeInsets.only(left: 20),
                    ),
                    Container(
                      child: Icon(Icons.home,size: size.height/25,color: Colors.white),
                      margin: EdgeInsets.only(right: 20),
                    ),
                  ],
                ),
                // Text('Setting',style: TextStyle(fontSize: size.height/15),),
                //Icon(Icons.account_balance,size: size.width/20,),
              ],
            ),

          ),
      ],
      ),
    );
  }
}

