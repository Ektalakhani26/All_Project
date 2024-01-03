import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:unity/myrewards.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 350,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.search),
                Container(
                  padding: EdgeInsets.only(right: 200),
                  child:
                      Text('Search', style: TextStyle(color: Colors.black26)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text('My',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.red.shade700)),
              Text(
                'M',
                style: TextStyle(
                    fontSize: 70,
                    fontStyle: FontStyle.italic,
                    color: Colors.yellowAccent.shade400),
              ),
              Container(
                padding: EdgeInsets.only(left: 110),
                child: Text('9271',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w900)),
              ),
              Text('pts',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 250),
            child: Text('view history',
                style: TextStyle(fontSize: 20, color: Colors.blue)),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SizedBox(
              //   width: 25,
              // ),
              Stack(
                children: [
                  Container(
                    width: 350,
                    height: 15,
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.red.shade900,
                          Colors.red.shade600,
                          Colors.red.shade400,
                          Colors.yellowAccent.shade700,
                          Colors.yellowAccent.shade700,
                          Colors.yellow.shade400,
                          Colors.yellow.shade800
                        ]),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    margin: EdgeInsets.fromLTRB(25, 4, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    margin: EdgeInsets.fromLTRB(100, 4, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    margin: EdgeInsets.fromLTRB(190, 4, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    width: 7,
                    height: 7,
                    margin: EdgeInsets.fromLTRB(270, 4, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    width: 25,
                    height: 15,
                    margin: EdgeInsets.fromLTRB(330, 0, 0, 0),
                    padding: EdgeInsets.only(bottom: 100),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black38, width: 3)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '0',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                '1500',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                '3000',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                '4500',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text(
                '6000',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 5,
            color: Colors.black26,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'My Rewards',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 90),
                child: Text(
                  'View all',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyRewards(),
                        ));
                  },
                  child: Icon(Icons.arrow_forward_outlined,
                      size: 20, color: Colors.black),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 290),
            margin: EdgeInsets.only(top: 10),
            child:
                Text('6000 pts', style: TextStyle(fontWeight: FontWeight.w800)),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,border: GradientBoxBorder(gradient: LinearGradient(colors: [
                      Colors.yellowAccent,Colors.red]),width: 5),),
                        child: CircleAvatar(
                          maxRadius: 50,
                          minRadius: 20,
                          backgroundImage: AssetImage('assets/combo.jpg'),
                        ),
                    //),
                  ),
                 // ),
                ],
              ),


              Stack(
                children: [
                  Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(shape: BoxShape.circle,border: GradientBoxBorder(gradient: LinearGradient(colors: [
                   Colors.yellowAccent,Colors.red]),width: 5),),
                  child: CircleAvatar(
                    maxRadius: 20,
                    minRadius: 5,
                    backgroundImage: AssetImage('assets/french.jpg'),
                  ),
                ),
               ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle,border: GradientBoxBorder(gradient: LinearGradient(colors: [
                      Colors.yellowAccent,Colors.red]),width: 5),),
                    child: CircleAvatar(
                      maxRadius: 50,
                      minRadius: 20,
                      backgroundImage: AssetImage('assets/meal.jpg'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('  Mcdonalds\nCombo offer',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Big Bager\n\t\tCombo',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Happy Meal', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Special Offer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.only(left: 70),
                child:
                    Text('Offer Detail', style: TextStyle(color: Colors.blue)),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.arrow_forward_outlined),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 150,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black26)),
                    child: Column(
                      children: [
                        Container(
                          child: Image(image: AssetImage('assets/b1.jpg')),
                          padding: EdgeInsets.only(top: 10),
                        ),
                        Text('Cheeseburger'),
                        Text('Combo Meal'),
                        Text('Rp 45.000',
                            style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    // height: 20,
                    bottom: -10,
                    left: 30,
                    child: Container(
                      width: 95,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.watch_later_rounded,
                              size: 15, color: Colors.white),
                          Text('Tambah',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 150,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black26)),
                    child: Column(
                      children: [
                        Container(
                          child: Image(image: AssetImage('assets/b4.jpg')),
                          padding: EdgeInsets.only(top: 20),
                        ),
                        Container(
                          child: Text('Spicy Burger'),
                          padding: EdgeInsets.only(top: 5),
                        ),
                        Text('Combo Meal'),
                        Text('Rp 36.000',
                            style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    // height: 20,
                    bottom: -10,
                    left: 30,
                    child: Container(
                      width: 95,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.watch_later_rounded,
                              size: 15, color: Colors.white),
                          Text('Tambah',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
