import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signin/screen/searchbar.dart';

import 'everyday.dart';
import 'luxe.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';

import 'myntra.dart';
import 'profile.dart';

class Fwd extends StatefulWidget {
  const Fwd({Key? key}) : super(key: key);

  @override
  State<Fwd> createState() => _FwdState();
}

class _FwdState extends State<Fwd> with TickerProviderStateMixin {
  late AnimationController _bellController;
  late  AnimationController _favorite;

  @override
  void initState() {
    super.initState();

    _bellController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _favorite =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _bellController.dispose();
    _favorite.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        height: size.height/13,
        width: size.width,
        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Myntra(),));
                  },
                  child:  Icon(Icons.home,color: Colors.black),
                ),
                Text('Home',style: TextStyle(color: Colors.black)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => Fwd(),));
                  },
                  child: Icon(Icons.line_axis,color: Colors.deepOrange,),
                ),
                Text('Fwd',style: TextStyle(color: Colors.deepOrange)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EveryDay(),));
                  },
                  child:  Icon(Icons.directions_boat_filled_outlined,color: Colors.black),
                ),
                Text('Everyday'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Luxe(),));
                  },
                  child:  Icon(Icons.diamond_outlined,color: Colors.black),
                ),
                Text('Luxe'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                  },
                  child:  Icon(Icons.person_outline_rounded,color: Colors.black),
                ),
                Text('Profile'),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: size.height/9,
            width: size.width,
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 10,),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child:  Text('fwd-Women',style: TextStyle(fontSize: size.width/15,fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 80,),
                Expanded(
                  child:  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:  IconButton(
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        print(_bellController.status);
                        if (_bellController.isAnimating) {
                          // _bellController.stop();
                          _bellController.reset();
                        } else {
                          _bellController.repeat();
                        }
                      },
                      icon: Lottie.asset(LottieFiles.$63128_bell_icon,
                          controller: _bellController,
                          height: 45,
                          fit: BoxFit.cover),
                    ),
                  ),),

                SizedBox(width: 10,),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:   IconButton(
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        if (_favorite.status == AnimationStatus.dismissed) {
                          _favorite.reset();
                          _favorite.animateTo(0.6);
                        } else {
                          _favorite.reverse();
                        }
                      },
                      icon: Lottie.asset(Icons8.heart_color,
                          controller: _favorite,
                          height: 35,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:   Icon(Icons.shopping_bag_outlined,size: 35),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                          },
                          child:  Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(50) ),
                            alignment: Alignment.center,
                            child: Text('WOMEN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),

                          ),
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child:  Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.black87,style: BorderStyle.solid,width: 3)),
                            alignment: Alignment.center,
                            child: Text('MEN',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20)),

                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: size.height/5,
                            width: size.width*0.4,
                            //color: Colors.deepOrange,
                            child:  Image(image: AssetImage('assets/fwd1.jpg'),fit: BoxFit.fill,),
                          ),
                          Container(
                            height: size.height/5,
                            width: size.width*0.4,
                            //color: Colors.deepOrange,
                            child:  Image(image: AssetImage('assets/fwd2.jpg'),fit: BoxFit.fill,),
                          ),
                          Container(
                            height: size.height/5,
                            width: size.width*0.4,
                            //color: Colors.deepOrange,
                            child:  Image(image: AssetImage('assets/fwd3.jpg'),fit: BoxFit.fill,),
                          ),
                          Container(
                            height: size.height/5,
                            width: size.width*0.4,
                            //color: Colors.deepOrange,
                            child:  Image(image: AssetImage('assets/fwd4.jpg'),fit: BoxFit.fill,),
                          ),
                          Container(
                            height: size.height/5,
                            width: size.width*0.4,
                            //color: Colors.deepOrange,
                            child:  Image(image: AssetImage('assets/fwd5.jpg'),fit: BoxFit.fill,),
                          ),
                          Container(
                            height: size.height/5,
                            width: size.width*0.4,
                            //color: Colors.deepOrange,
                            child:  Image(image: AssetImage('assets/fwd6.jpg'),fit: BoxFit.fill,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: size.height/18,
                      width: size.width,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('HOT TRANDS FOR GENERATION',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 20,),
                    CarouselSlider(
                      items: [
                        Container(
                          height: size.height/7,
                          width: size.width*0.8-10,
                          child: Image(image: AssetImage('assets/offer1.jpg'),fit: BoxFit.fill,),
                        ),
                        Container(
                          height: size.height/7,
                          width: size.width*0.8-10,
                          child: Image(image: AssetImage('assets/offer2.jpg'),fit: BoxFit.fill,),
                        ),
                        Container(
                          height: size.height/7,
                          width: size.width*0.8-10,
                          child: Image(image: AssetImage('assets/offer3.jpg'),fit: BoxFit.fill,),
                        ),
                        Container(
                          height: size.height/7,
                          width: size.width*0.8-10,
                          child: Image(image: AssetImage('assets/offer4.jpg'),fit: BoxFit.fill,),
                        ),
                        Container(
                          height: size.height/7,
                          width: size.width*0.8-10,
                          child: Image(image: AssetImage('assets/offer5.jpg'),fit: BoxFit.fill,),
                        ),
                      ], options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: size.height/10,
                              width: size.width*0.4-30,
                              decoration: BoxDecoration(color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                  ,boxShadow: [BoxShadow(color: Colors.lightGreenAccent,offset: Offset(0, 2),blurRadius: 4,spreadRadius: 2)]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20,),
                                  Text('Fits Off',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text('Your Feed',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                ],
                              ),
                            ),
                            Positioned(
                              child:  CircleAvatar(
                                backgroundColor: Colors.red,
                                maxRadius: 18,
                                child: Icon(Icons.how_to_vote,color: Colors.black),
                              ),
                              left: 50,
                              bottom: 55,
                            ),

                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: size.height/10,
                              width: size.width*0.4-30,
                              decoration: BoxDecoration(color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                  ,boxShadow: [BoxShadow(color: Colors.lightGreenAccent,offset: Offset(0, 2),blurRadius: 5,spreadRadius: 2)]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20,),
                                  Text('Fresh Style',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text('Fab Prices',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                ],
                              ),
                            ),
                            Positioned(
                              child:  CircleAvatar(
                                backgroundColor: Colors.red,
                                maxRadius: 18,
                                child: Icon(Icons.percent,color: Colors.black),
                              ),
                              left: 50,
                              bottom: 55,
                            ),

                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: size.height/10,
                              width: size.width*0.4-30,
                              decoration: BoxDecoration(color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)
                                  ,boxShadow: [BoxShadow(color: Colors.lightGreenAccent,offset: Offset(0, 2),blurRadius: 5,spreadRadius: 2)]
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20,),
                                  Text('Celeb Style',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                  Text('Files',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                ],
                              ),
                            ),
                            Positioned(
                              child:  CircleAvatar(
                                backgroundColor: Colors.red,
                                maxRadius: 18,
                                child: Icon(Icons.favorite,color: Colors.black),
                              ),
                              left: 50,
                              bottom: 55,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: size.width,
                      height: size.height/7,
                      // color: Colors.red,
                      child: Image(image: AssetImage('assets/offer6.jpg'),fit: BoxFit.fill,),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: size.width*0.5-10,
                          height: size.height/3,
                          //color: Colors.red,
                          child: Image(image: AssetImage('assets/offer7.jpg'),fit: BoxFit.fill,),
                        ),
                        Container(
                          width: size.width*0.5-10,
                          height: size.height/3,
                          // color: Colors.red,
                          child: Image(image: AssetImage('assets/offer8.jpg'),fit: BoxFit.fill,),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: size.height/12,
                      width: size.width,
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text('TRENDING RN',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w900)),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: size.width,
                      height: size.height/3,
                      color: Colors.red,
                      child:  SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 10,),
                            Container(
                              width: size.width*0.5-10,
                              height: size.height/3,
                              child: Image(image: AssetImage('assets/fitness1.jpg'),fit: BoxFit.fill,),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: size.width*0.5-10,
                              height: size.height/3,
                              child: Image(image: AssetImage('assets/fitness2.jpg'),fit: BoxFit.fill,),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: size.width*0.5-10,
                              height: size.height/3,
                              child: Image(image: AssetImage('assets/fitness3.jpg'),fit: BoxFit.fill,),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: size.width*0.5-10,
                              height: size.height/3,
                              child: Image(image: AssetImage('assets/fitness4.jpg'),fit: BoxFit.fill,),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: size.width*0.5-10,
                              height: size.height/3,
                              child: Image(image: AssetImage('assets/fitness5.jpg'),fit: BoxFit.fill,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}