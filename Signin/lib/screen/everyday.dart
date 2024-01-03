import 'package:flutter/material.dart';
import 'package:signin/screen/searchbar.dart';

import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';

import 'fwd.dart';
import 'luxe.dart';
import 'myntra.dart';
import 'profile.dart';

class EveryDay extends StatefulWidget {
  const EveryDay({Key? key}) : super(key: key);

  @override
  State<EveryDay> createState() => _EveryDayState();
}

class _EveryDayState extends State<EveryDay> with TickerProviderStateMixin{
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
                  child:  Icon(Icons.directions_boat_filled_outlined,color: Colors.deepOrange),
                ),
                Text('Everyday',style: TextStyle(color: Colors.deepOrange)),
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
                Padding(
                  padding: EdgeInsets.only(top: 28),
                  child:   Text('Myntra Everyday',style: TextStyle(fontSize: size.width/15,fontWeight: FontWeight.bold)),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width,
                    height: size.height/4,
                    child: Image(image: AssetImage('assets/every1.jpg'),fit: BoxFit.fill,),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child : Text('CATEGORIES ON THE RISE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                  ),
                  SizedBox(height: 5,),
                  Padding(padding: EdgeInsets.only(left: 20),
                    child: Text('Get, Set, Restock!',style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/men.jpg'),
                            maxRadius: 30,
                          ),
                          Text('MENS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/women.jpg'),
                            maxRadius: 30,
                          ),
                          Text('WOMENS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/personalcare.jpg'),
                            maxRadius: 30,
                          ),
                          Text('PERSONAL',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/accessories.jpg'),
                            maxRadius: 30,
                          ),
                          Text('ACCESSORIES',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/kids.jpg'),
                            maxRadius: 30,
                          ),
                          Text('KIDS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/foot1.jpg'),
                            maxRadius: 30,
                          ),
                          Text('FOOTWARE',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/jewellery.jpg'),
                            maxRadius: 30,
                          ),
                          Text('JEWELLERY',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/home1.jpg'),
                            maxRadius: 30,
                          ),
                          Text('HOME & KITCHEN',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/gagets.jpg'),
                            maxRadius: 30,
                          ),
                          Text('GADGETS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/essntials.jpg'),
                            maxRadius: 30,
                          ),
                          Text('ESSENTIALS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(padding: EdgeInsets.only(left: 20),
                    child: Text('FASHION ESSENTIALS',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Container(
                        height: size.height/2,
                        width: size.width,
                        color: Colors.black12,
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Container(
                              width: size.width,
                              height: size.height/12,
                              decoration :  BoxDecoration(
                                  gradient: LinearGradient(colors: [Colors.cyan.shade200,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text('FASHION',style: TextStyle(color: Colors.white,fontSize: 30)),
                                  SizedBox(width: 10,),
                                  Text('ESSENTIALS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Expanded(
                              child: Container(
                                height: size.height/3+10,
                                width: size.width,
                                color: Colors.cyan.shade400,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image(image: AssetImage('assets/biba.jpg')),
                                        width: size.width*0.6,
                                        height: size.height/2,
                                        // height: size.height*0.6,
                                      ),
                                      Container(
                                          child: Image(image: AssetImage('assets/faces.jpg')),
                                          width: size.width*0.6,
                                          height: size.height/2
                                      ),
                                      Container(
                                        child: Image(image: AssetImage('assets/jewellery.jpg')),
                                        width: size.width*0.6,
                                        height: size.height/2,
                                      ),
                                      Container(
                                        child: Image(image: AssetImage('assets/lorial.jpg')),
                                        width: size.width*0.6,
                                        height: size.height/2,
                                      ),
                                      Container(
                                        child: Image(image: AssetImage('assets/maybelline.jpg')),
                                        width: size.width*0.6,
                                        height: size.height/3-20,
                                      ),
                                      Container(
                                        child: Image(image: AssetImage('assets/miraggio.jpg')),
                                        width: size.width*0.6,
                                        height: size.height/2,
                                      ),
                                      Container(
                                        child: Image(image: AssetImage('assets/smartwatch.jpg')),
                                        width: size.width*0.6,
                                        height: size.height/2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child : Text('SHOP BY CATEGORY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child : Text('Summertime Must-Buys',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/shoes.jpg')),
                            ),
                            Text('Under 299'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/t-shirt.jpg')),
                            ),
                            Text('Under 250'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/top.jpg')),
                            ),
                            Text('Under 150'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth7.jpg')),
                            ),
                            Text('Under 150'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth6.jpg')),
                            ),
                            Text('Under 150'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth5.jpg')),
                            ),
                            Text('Under 150'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth4.jpg')),
                            ),
                            Text('Under 150'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/krutas.jpg')),
                            ),
                            Text('Under 900'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/jeans.jpg')),
                            ),
                            Text('Under 799'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/s1.jpg')),
                            ),
                            Text('Under 300'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth1.jpg')),
                            ),
                            Text('Under 300'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth2.jpg')),
                            ),
                            Text('Under 300'),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Container(
                              height: size.height/8,
                              width: size.width*0.3,
                              //color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/cloth3.jpg')),
                            ),
                            Text('Under 300'),
                          ],
                        ),
                        SizedBox(width: 10,),
                      ],
                    ),
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