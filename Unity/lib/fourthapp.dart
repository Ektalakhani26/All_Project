import 'package:flutter/material.dart';
import 'package:unity/topgames.dart';

class ForthApp extends StatelessWidget {
  const ForthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.search),
                    Container(
                      //padding: EdgeInsets.only(right: 200),
                      child: Text('Search for app', style: TextStyle(color: Colors.black38)),
                    ),
                    Icon(Icons.mic,color: Colors.black),
                  ],
                ),
              ),
              Icon(Icons.save,color: Colors.white,),
              Stack(
                children:[
                  CircleAvatar(
                  maxRadius: 20,
                  minRadius: 20,
                    backgroundImage: AssetImage('assets/ekta2.jpg'),
              ),
             ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap:() {

                  },
                child:Text('For you',style: TextStyle(color: Colors.white),),
              ),
              InkWell(
                onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TopChats(),));
                },
                child: Text('Top charts',style: TextStyle(color: Colors.white),),
              ),
              InkWell(
                onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Kids(),));
                },
                child: Text('Kids',style: TextStyle(color: Colors.white),),
              ),
              Text('Events',style: TextStyle(color: Colors.white),),
              Text('Premium',style: TextStyle(color: Colors.white),),
            ],
          ),
          //*******************************************************************************
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                              width: 300,
                              margin: EdgeInsets.only(left: 10),
                              //color: Colors.purple[600],
                              child: Image(image: AssetImage('assets/home.jpg'),)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 300,
                              margin: EdgeInsets.only(left: 10),
                              //color: Colors.purple[600],
                              child: Image(image: AssetImage('assets/home2.jpg'),)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 300,
                              margin: EdgeInsets.only(left: 10),
                              //color: Colors.purple[600],
                              child: Image(image: AssetImage('assets/home3.jpg'),)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              width: 300,
                              margin: EdgeInsets.only(left: 10),
                              //color: Colors.purple[600],
                              child: Image(image: AssetImage('assets/home4.jpg'),)
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(
                          child: Text('Top-related games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white)),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TopGames(),));
                        }, child: Icon(Icons.arrow_forward_outlined)),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                //color: Colors.red,
                                child: Image(image: AssetImage('assets/p6.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 50),
                                child: Text('figthing',style: TextStyle(color: Colors.white),),
                              ),
                              Text('Action * Runner',style: TextStyle(color: Colors.white38),),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('4.2*  97MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p7.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 55),
                                child: Text('Shoter',style: TextStyle(color: Colors.white),),
                              ),
                              Text('Arcade * Match ',style: TextStyle(color: Colors.white38),),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('4.4*  86MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p8.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 50),
                                child: Text('Aztecs',style: TextStyle(color: Colors.white),),
                              ),
                              Text('Action * Runner',style: TextStyle(color: Colors.white38),),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.2*  80MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p9.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 50),
                                child: Text('MakeUp',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p10.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                child: Text('Bubble Shooter',style: TextStyle(color: Colors.white),),
                              ),
                              Text('Puzzle *Match',style: TextStyle(color: Colors.white38),),
                              Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text('4.4*  86MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(
                          child: Text('Suggested for you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white)),
                          margin: EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                //color: Colors.red,
                                child: Image(image: AssetImage('assets/p2.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 50),
                                child: Text('Shotter',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p1.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('SubeSuffer',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p3.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 60),
                                child: Text('Fighter',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p4.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 60),
                                child: Text('Mighty',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p5.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('Angry birds',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(
                          child: Text('Stylized games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white)),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Stylized(),));
                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(Icons.arrow_forward_outlined,color: Colors.blue)),
                        ),
                        // TextButton(onPressed: () {
                        // }, child: Icon(Icons.arrow_forward_outlined)),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                //color: Colors.red,
                                child: Image(image: AssetImage('assets/p11.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('difference',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p12.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 75),
                                child: Text('Clue',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p13.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 60),
                                child: Text('House',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p14.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 45),
                                child: Text('Barbi dall',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p15.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                child: Text('Temple Run-3',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(
                          child: Text('Offline games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white)),
                          margin: EdgeInsets.only(left: 10),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Offline(),));
                          },
                          child: Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(Icons.arrow_forward_outlined,color: Colors.blue)),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                //color: Colors.red,
                                child: Image(image: AssetImage('assets/p16.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 70),
                                child: Text('Train',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p17.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 25),
                                child: Text('Cooking City',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p18.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 40),
                                child: Text('Design Dry',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 40),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p19.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 35),
                                child: Text('Snaks',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 0),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                width: 150,
                                height: 100,
                                child: Image(image: AssetImage('assets/p20.jpg')),
                                decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 0),
                                child: Text('Home design',style: TextStyle(color: Colors.white),),
                              ),
                              Container(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Text('Simulation',style: TextStyle(color: Colors.white38),)),
                              Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Text('3.8*  134MB',style: TextStyle(color: Colors.white38))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      //width: 500,
                      // height: 500,
                        child: Image(image: AssetImage('assets/special.jpg'))
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        Container(
                          child: Text('Stylized games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white)),
                          margin: EdgeInsets.only(left: 10),
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    //width: 100,
                                    height: 70,
                                    //color: Colors.red,
                                    child: Image(image: AssetImage('assets/p21.png')),
                                    decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Word Trip',style: TextStyle(color: Colors.white)),
                                      Text('Word trip is the perfect word game to relax',style: TextStyle(color: Colors.white38)),
                                      Text('your mind and become a word legend!',style: TextStyle(color: Colors.white38)),
                                      Text('4.4* 82MB',style: TextStyle(color: Colors.white38)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    //width: 100,
                                    height: 70,
                                    //color: Colors.red,
                                    child: Image(image: AssetImage('assets/p21.jpg')),
                                    decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Angry Birds 2',style: TextStyle(color: Colors.white)),
                                      Text('play the angry birds game enjoyed by',style: TextStyle(color: Colors.white38)),
                                      Text('millions of players every day!',style: TextStyle(color: Colors.white38)),
                                      Text('4.3* 245MB',style: TextStyle(color: Colors.white38)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    //width: 100,
                                    height: 65,
                                    //color: Colors.red,
                                    child: Image(image: AssetImage('assets/p22.jpg')),
                                    decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Difference - find difference',style: TextStyle(color: Colors.white)),
                                      Text('find difference in picture. easy & hard',style: TextStyle(color: Colors.white38)),
                                      Text('olevels. can you spot the difference!',style: TextStyle(color: Colors.white38)),
                                      Text('4.3* 52MB',style: TextStyle(color: Colors.white38)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: 70,
                                    height: 70,
                                    //color: Colors.red,
                                    child: Image(image: AssetImage('assets/p23.jpg')),
                                    decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Text('Tricky Doors',style: TextStyle(color: Colors.white)),
                                      Text('Slove the puzzles and open all the tricky doors',style: TextStyle(color: Colors.white38)),
                                      Text('to find a way our!',style: TextStyle(color: Colors.white38)),
                                      Text('4.4* 548MB',style: TextStyle(color: Colors.white38)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    //width: 100,
                                    height: 70,
                                    //color: Colors.red,
                                    child: Image(image: AssetImage('assets/p24.jpg')),
                                    decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Worms Zone .io - hungry Snake',style: TextStyle(color: Colors.white)),
                                      Text('a fun,dynamic game with cool graphics! get',style: TextStyle(color: Colors.white38)),
                                      Text('growing your worm right now!',style: TextStyle(color: Colors.white38)),
                                      Text('4.3* 123MB',style: TextStyle(color: Colors.white38)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    // width: 10,
                                    height: 65,
                                    //color: Colors.red,
                                    child: Image(image: AssetImage('assets/p25.jpg')),
                                    decoration: BoxDecoration(border: Border.all(width: 5,color: Colors.black26)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Carrom pool: Disc game',style: TextStyle(color: Colors.white)),
                                      Text('Relive your childhood memories in this hit',style: TextStyle(color: Colors.white38)),
                                      Text('multiple *carrom board game!*',style: TextStyle(color: Colors.white38)),
                                      Text('4.2* 65MB',style: TextStyle(color: Colors.white38)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
           // width: 500,
            height: 60,
            color: Colors.brown.shade900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Icon(Icons.videogame_asset_sharp,size: 30,color: Colors.white),
                    Text('Games',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Icon(Icons.apps,size: 28,color: Colors.white30),
                    Text('Apps',style: TextStyle(color: Colors.white30,fontWeight: FontWeight.w800),),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    Icon(Icons.local_offer_outlined,size: 28,color: Colors.white30),
                    Text('Offers',style: TextStyle(color: Colors.white30,fontWeight: FontWeight.w800),),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    Icon(Icons.book_outlined,size: 28,color: Colors.white30),
                    Text('Books',style: TextStyle(color: Colors.white30,fontWeight: FontWeight.w800),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
