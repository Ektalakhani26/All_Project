import 'package:flutter/material.dart';

class Kaushik extends StatelessWidget {
  const Kaushik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.teal.shade800,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.teal.shade700)),onPressed: () {
                          Navigator.pop(context);
                        }, child: Icon(Icons.arrow_back,size: 40,color: Colors.white),)
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 30,
                            minRadius: 10,
                            backgroundImage: AssetImage('assets/kaushik.jpg'),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Breket',style: TextStyle(color: Colors.white,fontSize: 25)),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.local_phone,size: 30,color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.video_call,size: 30,color: Colors.white),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.dehaze_outlined,size: 30,color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Container(
                        child: Text('hiiii'),
                        padding: EdgeInsets.only(left: 20),
                      ),
                      Container(
                        child: Text('3:45 PM'),
                        margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(color: Colors.green.shade400,borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 230),
              child: Row(
                children: [
                  Container(
                    child: Text('bol'),
                    padding: EdgeInsets.only(left: 20),
                  ),
                  Container(
                    child: Text('3:50 PM'),
                    margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  ),
                  Container(
                    child: Icon(Icons.remove_red_eye_outlined,color: Colors.blue.shade700),
                    margin: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 20,
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: Text('Today',style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Container(
              width: 230,
              height: 40,
              decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                children: [
                  Container(
                    child: Text('ketala ui banavya?'),
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Spacer(),
                  Container(
                    child: Text('3:55 PM'),
                    margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 280,
              height: 40,
              decoration: BoxDecoration(color: Colors.green.shade400,borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  Container(
                    child: Text('kai nai banavyu'),
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Spacer(),
                  Container(
                    child: Text('4:00 PM'),
                    margin: EdgeInsets.fromLTRB(35, 10, 0, 0),
                  ),
                  Container(
                    child: Icon(Icons.remove_red_eye_outlined,color: Colors.blue.shade700),
                    margin: EdgeInsets.fromLTRB(5, 10, 10, 0),
                  ),
                ],
              ),
            ),

                Container(
                 // width: 200,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.circular(20)),
                        child: Text('1 UNREAD MESSAGE'),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10,10, 0, 0),
                    width: 130,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Text('okkkk'),
                      Spacer(),
                      Container(
                        child: Text('4:00 PM'),
                        margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                      ),
                    ],
                  ),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                ),
              ],
            ),
            SizedBox(
              height: 280,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    // width: 300,
                    // height: 40,
                    decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Icon(Icons.insert_emoticon,color: Colors.black26),
                          margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Message',style: TextStyle(color: Colors.black26,fontSize: 20)),
                        ),
                        Container(
                          padding:  EdgeInsets.only(left: 80),
                          child: Icon(Icons.attachment_outlined,color: Colors.black26),
                        ),
                        Container(
                          child: Icon(Icons.currency_rupee_outlined,color: Colors.black26),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.camera_alt,color: Colors.black26),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(Icons.mic,size: 35,color: Colors.white),
                  decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green.shade500),
                ),
              ],
            ),
      ],
        ),
    );
  }
}
