import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signin/screen/searchbar.dart';


import 'everyday.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';

import 'fwd.dart';
import 'myntra.dart';
import 'profile.dart';
class Luxe extends StatefulWidget {
  const Luxe({Key? key}) : super(key: key);

  @override
  State<Luxe> createState() => _LuxeState();
}

class _LuxeState extends State<Luxe> with TickerProviderStateMixin{
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
    Size size = MediaQuery.of(context).size;
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Fwd(),));
                  },
                  child: Icon(Icons.line_axis,color: Colors.black,),
                ),
                Text('Fwd'),
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
                  },
                  child:  Icon(Icons.diamond_outlined,color: Colors.deepOrange),
                ),
                Text('Luxe',style: TextStyle(color: Colors.deepOrange)),
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
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child:  Text('Myntra-Luxe',style: TextStyle(fontSize: size.width/15,fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 50,),
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
                    Container(
                      height: size.height/4,
                      width: size.width,
                      child: Image(image: AssetImage('assets/luxe1.jpg'),fit: BoxFit.fill),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height/13,
                                width: size.width*0.2,
                                child: Image(image: AssetImage('assets/black.jpg'),fit: BoxFit.fill,),
                              ),
                              Text('BRAND'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Container(
                                height: size.height/13,
                                width: size.width*0.2,
                                child: Image(image: AssetImage('assets/black1.jpg'),fit: BoxFit.fill,),
                              ),
                              Text('WOMEN'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Container(
                                height: size.height/13,
                                width: size.width*0.2,
                                child: Image(image: AssetImage('assets/black3.jpg'),fit: BoxFit.fill,),
                              ),
                              Text('MEN'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Container(
                                height: size.height/13,
                                width: size.width*0.2,
                                child: Image(image: AssetImage('assets/black2.jpg'),fit: BoxFit.fill,),
                              ),
                              Text('WATCHES'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Container(
                                height: size.height/13,
                                width: size.width*0.2,
                                child: Image(image: AssetImage('assets/black.jpg'),fit: BoxFit.fill,),
                              ),
                              Text('HANDBAGES'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Container(
                                height: size.height/13,
                                width: size.width*0.2,
                                child: Image(image: AssetImage('assets/foot1.jpg'),fit: BoxFit.fill,),
                              ),
                              Text('FOOTWARE'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      child:
                      CarouselSlider(
                        items: [
                          Container(
                            height: size.height/3,
                            width: size.width,

                            child: Image(image: AssetImage('assets/black4.jpg'),fit: BoxFit.fill,),
                          ),
                          // SizedBox(width: 10,),
                          Container(
                            height: size.height/3,
                            width: size.width,
                            // color: Colors.deepOrange,
                            child: Image(image: AssetImage('assets/black5.jpg'),fit: BoxFit.fill,),
                          ),
                          //SizedBox(width: 10,),
                          Container(
                            height: size.height/3,
                            width: size.width,
                            child: Image(image: AssetImage('assets/black6.jpg'),fit: BoxFit.fill,),
                          ),
                          //SizedBox(width: 10,),
                          Container(
                            height: size.height/3,
                            width: size.width,
                            child: Image(image: AssetImage('assets/black7.jpg'),fit: BoxFit.fill,),
                          ),
                        ],
                        options: CarouselOptions(
                          //enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 900),
                          //  viewportFraction: 0.8,
                        ),),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}