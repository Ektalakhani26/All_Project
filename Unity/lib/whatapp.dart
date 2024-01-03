import 'package:flutter/material.dart';
import 'package:unity/error.dart';
import 'package:unity/kaushik.dart';
import 'package:unity/sangita.dart';

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
             height: 170,
            color: Colors.teal.shade800,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child:Text('WhatsApp',style: TextStyle(color: Colors.white,fontSize: 35 )),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 30),
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 20),
                      child: Icon(Icons.search,color: Colors.white,size: 30),
                    ),
                    Container(
                      //margin: EdgeInsets.only(right: 10),
                      child: Icon(Icons.dehaze_rounded,color: Colors.white,size: 30),
                    ),
                  ],
                ),
                  //Spacer(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                     // margin: EdgeInsets.only(top),
                      child: Icon(Icons.groups,size: 30,color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                       margin: EdgeInsets.only(left: 20),
                      child: Text('Chats',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('Status',style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('Calls',style: TextStyle(color: Colors.white,fontSize: 20)),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 5,
                      width: 90,
                      //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //padding: EdgeInsets.only(right: 90),
                      color: Colors.white,
                    ),
                    Container(
                      height: 9,
                      width: 40,
                      //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //padding: EdgeInsets.only(right: 90),
                      color: Colors.teal.shade800,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
           // color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sangita()));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/sangita.jpg'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Text('Sangita Class',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                        Container(
                          child: Text('4:09 PM',style: TextStyle(color: Colors.black38)),
                          margin: EdgeInsets.only(left: 100),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text('ap kab nikal rahe hoo',style: TextStyle(color: Colors.black38)),
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 100, 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),)
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
           // color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Kaushik()));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/kaushik.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Breket',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                        ),
                        Container(
                          child: Text('3:00 PM',style: TextStyle(color: Colors.black38)),
                          margin: EdgeInsets.only(left: 90),

                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      child: Text('Tu ne kitne Ui banaye',style: TextStyle(color: Colors.black38)),
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 140, 10),
                    ),
                  ],
                ),
              ],
            ),)
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            //color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorA()));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/Error1.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Error',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 90, 0),
                        ),
                        Container(
                          child: Text('3:30 PM',style: TextStyle(color: Colors.black38)),
                          margin: EdgeInsets.only(left: 85),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      child: Text('class ae avvani??',style: TextStyle(color: Colors.black38)),
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 165, 10),
                    ),
                  ],
                ),
              ],
            ),)
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
           // color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Margin(),));

            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/margin1.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Margin',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 55, 0),
                        ),
                        Container(
                          child: Text('4:09 PM',style: TextStyle(color: Colors.lightGreenAccent.shade700)),
                          margin: EdgeInsets.only(left: 100),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text('None',style: TextStyle(color: Colors.black38)),
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 200, 10),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(color: Colors.lightGreenAccent.shade400,borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            //color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Pointer(),));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/pointer1.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Pointer',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                        ),
                        Container(
                          child: Text('9:00 PM',style: TextStyle(color: Colors.lightGreenAccent.shade700)),
                          margin: EdgeInsets.only(left: 80),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text('kai UI banavu?',style: TextStyle(color: Colors.black38)),
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0, 145, 10),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(color: Colors.lightGreenAccent.shade400,borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
           // color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Mom(),));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/Mom.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Mom',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 72, 0),
                        ),
                        Container(
                          child: Text('7:00 AM',style: TextStyle(color: Colors.lightGreenAccent.shade700)),
                          margin: EdgeInsets.only(left: 100),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),

                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 195),
                          child: Text('Photo',style: TextStyle(color: Colors.black38)),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(color: Colors.lightGreenAccent.shade400,borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('10',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            //color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dad(),));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/dad.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Dad',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 75, 0),
                        ),
                        Container(
                          child: Text('10:55 PM',style: TextStyle(color: Colors.black38)),
                          margin: EdgeInsets.only(left: 100),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      child: Text('Online',style: TextStyle(color: Colors.black38)),
                      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 0, 230, 10),
                    ),
                  ],
                ),
              ],
            ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
           // color: Colors.black12,
            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Diii(),));
            }, child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  maxRadius: 40,
                  minRadius: 20,
                  backgroundImage: AssetImage('assets/Dii1.jpg'),
                ),
                Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Container(
                          child: Text('Diiii',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 20)),
                          padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                        ),
                        Container(
                          child: Text('2:00 PM',style: TextStyle(color: Colors.lightGreenAccent.shade700)),
                          margin: EdgeInsets.only(left: 100),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      children: [
                        Container(
                          child: Text('tane leti javani 6 mare??',style: TextStyle(color: Colors.black38)),
                          // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          padding: EdgeInsets.fromLTRB(0, 0,80, 10),
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(color: Colors.lightGreenAccent.shade400,borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('2',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
