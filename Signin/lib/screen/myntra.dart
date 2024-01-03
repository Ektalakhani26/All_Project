import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';
import 'package:signin/addtocartscreen/add1.dart';
import 'package:signin/screen/searchbar.dart';
import 'beauty.dart';
import 'beauty1.dart';
import 'everyday.dart';
import 'footware.dart';
import 'fwd.dart';
import 'kids.dart';
import 'luxe.dart';
import 'men.dart';
import 'profile.dart';
import 'women.dart';

class Myntra extends StatefulWidget {
  const Myntra({Key? key}) : super(key: key);

  @override
  State<Myntra> createState() => _MyntraState();
}

class _MyntraState extends State<Myntra> with TickerProviderStateMixin{

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
                   child:  Icon(Icons.home,color: Colors.deepOrange),
                 ),
                 Text('Home',style: TextStyle(color: Colors.deepOrange)),
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
                        padding: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/myntra.jpg'),
                          maxRadius: 30,
                        ),
                    ),
                   // SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 40, 100, 0),
                         child: Text('BECOME',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 11)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text('INSIDER',style: TextStyle(color: Colors.deepOrangeAccent.shade100,fontWeight: FontWeight.bold)),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,color: Colors.deepOrangeAccent.shade100,size: 15,)
                          ],
                        ),
                      ],
                    ),
               // SizedBox(height: 30,),
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
                        height: 40,
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
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                            },
                            child:  Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(50) ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/fashio.jpg')),
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text('Fashion',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Beauty(),));
                            },
                            child:  Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.black87,style: BorderStyle.solid,width: 3)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Image(image: AssetImage('assets/beauty1.jpg')),
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                  Text('Beauty',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:  Row(
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Men(),));
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/men.jpg'),
                                    maxRadius: 40,
                                    minRadius: 30,
                                  ),
                                ),
                                Text('Men'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Women(),));
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/women.jpg'),
                                    maxRadius: 40,
                                    minRadius: 30,
                                  ),
                                ),
                                Text('Women'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Kids(),));
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/kids.jpg'),
                                    maxRadius: 40,
                                    minRadius: 30,
                                  ),
                                ),
                                Text('Kids'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FootWare(),));
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/footware.jpg'),
                                    maxRadius: 40,
                                    minRadius: 30,
                                  ),
                                ),
                                Text('Footware'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Beauty1(),));
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage('assets/beauty.jpg'),
                                    maxRadius: 40,
                                    minRadius: 30,
                                  ),
                                ),
                                Text('BEAUTY'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/gagets.jpg'),
                                  maxRadius: 40,
                                  minRadius: 40,
                                ),
                                Text('GADGETS'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/accessories.jpg'),
                                  maxRadius: 40,
                                  minRadius: 40,
                                ),
                                Text('ACCESSORIES'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/home.jpg'),
                                  maxRadius: 40,
                                  minRadius: 40,
                                ),
                                Text('HOME'),
                              ],
                            ),
                            SizedBox(width: 10,),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/slay on.jpg'),
                                  maxRadius: 40,
                                  minRadius: 40,
                                ),
                                Text('Slay On Fleek'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: size.width*0.9,
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Sign Up For Exciting Deals!',
                                style: TextStyle(color: Colors.white,fontSize: 19)),
                            SizedBox(width: 10,),
                            Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: size.width,
                        height: size.height/7,
                        color: Colors.pink.shade50,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                width: size.width*0.9,
                                height: size.height/9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(child: Text('New User?',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300))),
                                    Expanded(child: Text('Flat ₹200 Off',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                     // SizedBox(height: 10,),
                      SingleChildScrollView(
                        child:
                        CarouselSlider(
                          items: [
                            Container(
                              child: Image(image: AssetImage('assets/off1.jpg')),
                            ),
                            Container(
                              // color: Colors.deepOrange,
                              child: Image(image: AssetImage('assets/off2.jpg')),
                            ),
                            Container(
                              child: Image(image: AssetImage('assets/off3.jpg')),
                            ),
                            Container(
                              child: Image(image: AssetImage('assets/off4.jpg')),
                            ),
                            Container(
                              child: Image(image: AssetImage('assets/off5.jpg')),
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
                     // SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: size.height/15,
                            width: size.width*0.3-5,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.cyan.shade700),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('100% Original',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                                Text('Product',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height/15,
                            width: size.width*0.3-5,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.cyan.shade700),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Free Shopping',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                                Text('On 1st Order',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height/15,
                            width: size.width*0.3-5,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.cyan.shade700),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Easy Returns',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                                Text('& Refunds',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text('ALL-TIME FAVOURITES',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
                      SizedBox(height: 10,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         InkWell(
                           child: Container(
                             height: size.height/5,
                             width: size.width*0.5-10,
                             decoration: BoxDecoration(color: Colors.white,
                                 boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                 border: Border.all(width: 1)),
                             child: Column(
                               children: [
                                 Container(
                                   width: size.width*0.5,
                                   height: size.height/6,
                                   child:Image(image: AssetImage('assets/t-shirt.jpg'),fit: BoxFit.fill,),
                                 ),
                                 Text('Under ₹350'),
                               ],
                             ),
                           ),
                           onTap: () {
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Add1(),));
                           },
                         ),
                         InkWell(
                           child: Container(
                             height: size.height/5,
                             width: size.width*0.5-10,
                             decoration: BoxDecoration(color: Colors.white,
                                 boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                 border: Border.all(width: 1)),
                             child: Column(
                               children: [
                                 Container(
                                   width: size.width*0.5,
                                   height: size.height/6,
                                   child: Image(image: AssetImage('assets/krutas.jpg'),fit: BoxFit.fill),
                                 ),
                                 Text('Under ₹350'),
                               ],
                             ),
                           ),
                         ),
                       ],
                     ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width*0.5-10,
                              decoration: BoxDecoration(color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width*0.5,
                                    height: size.height/6,
                                    child: Image(image: AssetImage('assets/krurta.jpg'),fit: BoxFit.fill),
                                  ),

                                  Text('Under ₹350'),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width*0.5-10,
                              decoration: BoxDecoration(color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width*0.5,
                                    height: size.height/6,
                                    child:  Image(image: AssetImage('assets/jeans.jpg'),fit: BoxFit.fill),
                                  ),

                                  Text('Under ₹350'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width*0.5-10,
                              decoration: BoxDecoration(color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width*0.5,
                                    height: size.height/6,
                                    child:  Image(image: AssetImage('assets/dresses.jpg'),fit: BoxFit.fill),
                                  ),

                                  Text('Under ₹350'),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width*0.5-10,
                              decoration: BoxDecoration(color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width*0.5,
                                    height: size.height/6,
                                    child: Image(image: AssetImage('assets/shorts.jpg'),fit: BoxFit.fill),
                                  ),

                                  Text('Under ₹350'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width*0.5-10,
                              decoration: BoxDecoration(color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width*0.5,
                                    height: size.height/6,
                                    child:  Image(image: AssetImage('assets/shoes.jpg'),fit: BoxFit.fill),
                                  ),

                                  Text('Under ₹350'),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: size.height/5,
                              width: size.width*0.5-10,
                              decoration: BoxDecoration(color: Colors.white,
                                  boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
                                  border: Border.all(width: 1)),
                              child: Column(
                                children: [
                                  Container(
                                    width: size.width*0.5,
                                    height: size.height/6,
                                    child:  Image(image: AssetImage('assets/krutas.jpg'),fit: BoxFit.fill),
                                  ),
                                  Text('Under ₹350'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Image(image: AssetImage('assets/banner.jpg')),
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
                                  height: size.height/15,
                                  decoration :  BoxDecoration(
                                      gradient: LinearGradient(colors: [Colors.cyan.shade200,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                   // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      Text('FEATURED',style: TextStyle(color: Colors.white,fontSize: 30)),
                                      SizedBox(width: 10,),
                                      Text('BRANDS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  height: size.height/3+10,
                                  width: size.width,
                                  color: Colors.cyan.shade400,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [

                                           InkWell(
                                             child: Container(
                                               child: Image(image: AssetImage('assets/biba.jpg')),
                                               width: size.width*0.6,
                                               height: size.height/2,
                                               // height: size.height*0.6,
                                             ),
                                             onTap: () {

                                             },
                                           ),
                                        InkWell(
                                          onTap: () {

                                          },
                                          child: Container(
                                            child: Image(image: AssetImage('assets/faces.jpg')),
                                            width: size.width*0.6,
                                            height: size.height/2,
                                            // height: size.height*0.6,
                                          ),
                                        ),
                                            InkWell(
                                              onTap: () {

                                              },
                                              child:  Container(
                                                child: Image(image: AssetImage('assets/jewellery.jpg')),
                                                width: size.width*0.6,
                                                height: size.height/2,
                                                // height: size.height*0.6,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {

                                              },
                                              child: Container(
                                                child: Image(image: AssetImage('assets/lorial.jpg')),
                                                width: size.width*0.6,
                                                height: size.height/2,
                                                // height: size.height*0.6,
                                              ),
                                            ),

                                        InkWell(
                                          onTap: () {

                                          },
                                          child:Container(
                                            child: Image(image: AssetImage('assets/maybelline.jpg')),
                                            width: size.width*0.6,
                                            height: size.height/3-20,
                                            // height: size.height*0.6,
                                          ),
                                        ),


                                       InkWell(
                                         onTap: () {

                                         },
                                         child: Container(
                                           child: Image(image: AssetImage('assets/miraggio.jpg')),
                                           width: size.width*0.6,
                                           height: size.height/2,
                                           // height: size.height*0.6,
                                         ),
                                       ),

                                        InkWell(
                                          onTap: () {

                                          },
                                          child:  Container(
                                            child: Image(image: AssetImage('assets/smartwatch.jpg')),
                                            width: size.width*0.6,
                                            height: size.height/2,
                                            // height: size.height*0.6,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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



