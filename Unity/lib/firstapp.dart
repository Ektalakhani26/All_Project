import 'package:flutter/material.dart';
import 'package:unity/foodapp.dart';
import 'package:unity/fourthapp.dart';
import 'package:unity/secondapp.dart';
import 'package:unity/thirdapp.dart';
import 'package:unity/whatapp.dart';

class firstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(title: Text('Flutter Button')),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => secondApp(),));
                  },
                    child: Text('setting',style: TextStyle(color: Colors.black)),
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.yellowAccent),side: MaterialStatePropertyAll(BorderSide(width: 4,color: Colors.black38))),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => thirdApp(),));
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        minRadius: 20,
                        backgroundImage: AssetImage('assets/music1.png'),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WhatsApp(),));
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        minRadius: 20,
                        backgroundImage: AssetImage('assets/whats.png'),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
                Row(
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodApp(),));
                    },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            maxRadius: 40,
                            minRadius: 20,
                            backgroundImage: AssetImage('assets/food.jpg'),
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                ),
            Row(
              children: [
                ElevatedButton(onPressed: () {
                 // Navigator.pushNamed(context, '/ForthApp');
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ForthApp(),));
                },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        maxRadius: 40,
                        minRadius: 20,
                       // backgroundImage: AssetImage('assets/food.jpg'),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
              ],
        ),
      ),
    );
  }
}
