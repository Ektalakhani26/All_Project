import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                    child: Icon(Icons.search,size: 30),
                  margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
                ),
                Spacer(),
                Container(
                  child: Icon(Icons.camera_alt,size: 30,),
                  margin: EdgeInsets.fromLTRB(240, 50, 0, 0),
                ),
                Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.blue.shade100,borderRadius: BorderRadius.circular(40)),
                  margin: EdgeInsets.fromLTRB(30, 50, 0, 0),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 5,
              color: Colors.blue.shade100,
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            ),
            Row(
              children: [
                Container(
                  child: Text("Message",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                ),
                Spacer(),
                Container(
                  child: Text("Active",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  margin: EdgeInsets.fromLTRB(80, 15, 0, 0),
                ),
                Spacer(),
                Container(
                  child: Text("Groups",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                  margin: EdgeInsets.fromLTRB(80, 15, 0, 0),
                ),
              ],
            ),
            Container(
              width: 200,
              height: 5,
              color: Colors.blue.shade100,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            SizedBox(
              width: 100,
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 100,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children:[
                    CircleAvatar(
                      maxRadius:40,
                      minRadius: 20,
                      backgroundImage: AssetImage('assets/shivi.jpg'),
                    ),
                    Positioned(
                      bottom: 5,
                      right: -9,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 3)),
                        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: Icon(Icons.add,color: Colors.white),
                      ),
                    ),

                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children:[
                    CircleAvatar(
                      maxRadius:40,
                      minRadius: 20,
                      backgroundImage: AssetImage('assets/shivi2.jpg'),
                    ),
                    Positioned(
                      bottom: 5,
                      right: -9,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.lightGreenAccent,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 3)),
                        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),

                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children:[
                    CircleAvatar(
                      maxRadius:40,
                      minRadius: 20,
                      backgroundImage: AssetImage('assets/shivi3.jpg'),
                    ),
                    Positioned(
                      bottom: 5,
                      right: -9,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.lightGreenAccent,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 3)),
                        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),

                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children:[
                    CircleAvatar(
                      maxRadius:40,
                      minRadius: 20,
                      backgroundImage: AssetImage('assets/shivi4.jpg'),
                    ),
                    Positioned(
                      bottom: 5,
                      right: -9,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.lightGreenAccent,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.white,width: 3)),
                        margin: EdgeInsets.fromLTRB(10, 20, 0, 0),

                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(45, 5, 0, 0),
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(45, 5, 0, 0),
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 10,
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(40, 5, 0, 0),
                ),
              ],
            ),

            Column(
              children: [

                Container(
                  width: 350,
                  height: 350,
                  color: Colors.black12,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Column(

                    children: [
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Row(

                        //mainAxisAlignment: MainAxisAlignment.start,
                       // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children:[
                              Container(

                                child: CircleAvatar(
                                  maxRadius:30,
                                  minRadius: 20,
                                  backgroundImage: AssetImage('assets/shivi.jpg'),

                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  child: Text('Live Music Concert',style: TextStyle(fontWeight: FontWeight.bold)),
                                //margin: EdgeInsets.fromLTRB(10, 0, 0, 15),
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              ),
                              Container(
                                child: Text('2 days ago -1.2M views',style: TextStyle(color: Colors.black26)),
                                //margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                padding: EdgeInsets.fromLTRB(25, 5, 0, 10),
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  child: Icon(Icons.dehaze_rounded),
                                margin: EdgeInsets.fromLTRB(70, 1, 0, 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(

                        children: [
                          SizedBox(
                            width: 0,
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                          Stack(

                            clipBehavior: Clip.none,
                            children:[
                              Container(
                                  height: 220,
                                width: 330,
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                                clipBehavior: Clip.none,
                                child: Image(image: AssetImage('assets/concert2.jpg'),alignment: Alignment.center,filterQuality: FilterQuality.high,)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [

                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 70,
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Container(
                                        child: Text('Like'),
                                      padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                                    ),
                                    Icon(Icons.done,color: Colors.blue.shade900),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 100,
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text('Subscribe'),
                                      padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                                    ),
                                    Icon(Icons.save_rounded,color: Colors.blue.shade900),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 70,
                                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text('Save'),
                                      padding: EdgeInsets.fromLTRB(5, 3, 0, 0),
                                    ),
                                    Icon(Icons.save_alt,color: Colors.blue.shade900),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 10,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children:[
                        CircleAvatar(
                          maxRadius:30,
                          minRadius: 20,
                          backgroundImage: AssetImage('assets/neha.jpg'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text('Neha kakkar'),
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        ),
                        Container(
                          child: Text('Last seen 5 min ago',style: TextStyle(color: Colors.black26) ),
                          margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                          padding: EdgeInsets.fromLTRB(15,0, 0, 0),
                        ),
                      ],
                    ),
                      Container(
                        child: Icon(Icons.camera_alt),
                        margin: EdgeInsets.only(left: 100),
                      ),
                  ],
                ),
                SizedBox(
                  width: 20,
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 10,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children:[
                        CircleAvatar(
                          maxRadius:30,
                          minRadius: 20,
                          backgroundImage: AssetImage('assets/tej.jpg'),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text('Tejasswi'),
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 5, 30, 0),
                        ),
                        Container(
                          child: Text('Last seen 10 min ago',style: TextStyle(color: Colors.black26) ),
                          margin: EdgeInsets.fromLTRB(25, 5, 0, 0),
                          padding: EdgeInsets.fromLTRB(15,0, 0, 10),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Container(
                        child: Icon(Icons.camera_alt),
                        margin: EdgeInsets.only(left: 93),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
