import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';
import 'package:signin/screen/searchbar.dart';

class Men extends StatefulWidget {
  const Men({Key? key}) : super(key: key);

  @override
  State<Men> createState() => _MenState();
}

class _MenState extends State<Men> with TickerProviderStateMixin{

  late AnimationController _favoriteController;

  late AnimationController _bellController;


  @override
  void initState() {
    super.initState();

    _favoriteController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _bellController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat();
  }

  @override
  void dispose() {

    _favoriteController.dispose();

    _bellController.dispose();


    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height/9,
            width: size.width,
            decoration: BoxDecoration(
                boxShadow: [
              BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.only(top: 30),
                child:  InkWell(
                  onTap: () {
                        Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new,size: 30),
                ),
                ),
                SizedBox(width: 100,),
                Expanded(
                  child:  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:  IconButton(
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        print(_bellController.status);
                        if (_bellController.isAnimating) {
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
                  ),
                ),

                SizedBox(width: 10,),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child:   IconButton(
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        if (_favoriteController.status == AnimationStatus.dismissed) {
                          _favoriteController.reset();
                          _favoriteController.animateTo(0.6);
                        } else {
                          _favoriteController.reverse();
                        }
                      },
                      icon: Lottie.asset(Icons8.heart_color,
                          controller: _favoriteController,
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
          SizedBox(height: 10,),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
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
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
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
                      ],
                    ),
                   SizedBox(height: 10,),
                   SingleChildScrollView(
                          child:
                          CarouselSlider(
                            items: [
                              Container(
                                child: Image(image: AssetImage('assets/sell1.png')),
                              ),
                              Container(
                                // color: Colors.deepOrange,
                                child: Image(image: AssetImage('assets/sell2.jpg')),
                              ),
                              Container(
                                child: Image(image: AssetImage('assets/sell3.jpg')),
                              ),
                              Container(
                                child: Image(image: AssetImage('assets/sell4.jpg')),
                              ),
                              Container(
                                child: Image(image: AssetImage('assets/sell5.jpg')),
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
                    Image(image: AssetImage('assets/offer.jpg')),
                    SizedBox(height: 10,),
                    Container(
                      height: size.height/20,
                      width: size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(gradient: LinearGradient(
                          colors: [Colors.cyan.shade100,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
                      child:  Text('OFFER ENDS IN 03h : 15m :15s',style: TextStyle(fontSize: 20)),
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child:
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image(image: AssetImage('assets/biba.jpg')),
                           Image(image: AssetImage('assets/faces.jpg')),
                          Image(image: AssetImage('assets/jewellery.jpg')),
                          Image(image: AssetImage('assets/lorial.jpg')),
                          Image(image: AssetImage('assets/miraggio.jpg')),
                          Image(image: AssetImage('assets/maybelline.jpg')),
                          Image(image: AssetImage('assets/smartwatch.jpg')),
                        ],
                      ),
                    ),
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
              )),
        ],
      ),
    );
  }
}

//========================================================================================
//========================================================================================
//==============================WOMEN======================================================
//==============================================================================================
//=============================================================================================



// class Women extends StatefulWidget {
//   const Women({Key? key}) : super(key: key);
//
//   @override
//   State<Women> createState() => _WomenState();
// }
//
// class _WomenState extends State<Women> with TickerProviderStateMixin{
//
//   late AnimationController _favoriteController;
//
//   late AnimationController _bellController;
//
//
//   @override
//   void initState() {
//     super.initState();
//
//     _favoriteController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _bellController =
//     AnimationController(vsync: this, duration: const Duration(seconds: 1))
//       ..repeat();
//   }
//
//   @override
//   void dispose() {
//
//     _favoriteController.dispose();
//
//     _bellController.dispose();
//
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size =MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(padding: EdgeInsets.only(top: 30),
//                   child:  InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(Icons.arrow_back_ios_new,size: 30),
//                   ),
//                 ),
//                 SizedBox(width: 100,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBar(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favoriteController.status == AnimationStatus.dismissed) {
//                           _favoriteController.reset();
//                           _favoriteController.animateTo(0.6);
//                         } else {
//                           _favoriteController.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favoriteController,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10,),
//           Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/makup.jpg')),
//                             ),
//                             Text('Under 299'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/haircare.jpg')),
//                             ),
//                             Text('Under 250'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/top.jpg')),
//                             ),
//                             Text('Under 150'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/luxe.jpg')),
//                             ),
//                             Text('Under 900'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/jeans.jpg')),
//                             ),
//                             Text('Under 799'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/s1.jpg')),
//                             ),
//                             Text('Under 300'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       child:
//                       CarouselSlider(
//                         items: [
//                           Container(
//                             child: Image(image: AssetImage('assets/banner1.jpg')),
//                           ),
//                           Container(
//                             // color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/banner4.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/banner3.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/banner2.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/banner5.jpg')),
//                           ),
//                         ],
//                         options: CarouselOptions(
//
//                           //enlargeCenterPage: true,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: 0.8,
//                         ),),
//                     ),
//                     Image(image: AssetImage('assets/offer.jpg')),
//                     SizedBox(height: 10,),
//                     Container(
//                       height: size.height/20,
//                       width: size.width,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(gradient: LinearGradient(
//                           colors: [Colors.cyan.shade100,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
//                       child:  Text('OFFER ENDS IN 03h : 15m :15s',style: TextStyle(fontSize: 20)),
//                     ),
//                     // SingleChildScrollView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   child:
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Image(image: AssetImage('assets/biba.jpg')),
//                           Image(image: AssetImage('assets/faces.jpg')),
//                           Image(image: AssetImage('assets/jewellery.jpg')),
//                           Image(image: AssetImage('assets/lorial.jpg')),
//                           Image(image: AssetImage('assets/miraggio.jpg')),
//                           Image(image: AssetImage('assets/maybelline.jpg')),
//                           Image(image: AssetImage('assets/smartwatch.jpg')),
//                         ],
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/skincare.jpg')),
//                               ),
//                               Text('Under 299'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/haircare.jpg')),
//                               ),
//                               Text('Under 250'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/fragrances.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/appliances.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth6.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth5.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth4.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/bath.jpg')),
//                               ),
//                               Text('Under 900'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/jeans.jpg')),
//                               ),
//                               Text('Under 799'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/salon.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/grooming.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/perfum.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/budget.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }



//========================================================================================
//========================================================================================
//==============================Kids======================================================
//==============================================================================================
//=============================================================================================



// class Kids extends StatefulWidget {
//   const Kids({Key? key}) : super(key: key);
//
//   @override
//   State<Kids> createState() => _KidsState();
// }
//
// class _KidsState extends State<Kids> with TickerProviderStateMixin{
//   late AnimationController _bellController;
//   late  AnimationController _favorite;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bellController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _favorite =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _bellController.dispose();
//     _favorite.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(padding: EdgeInsets.only(top: 30),
//                   child:  InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(Icons.arrow_back_ios_new,size: 30),
//                   ),
//                 ),
//                 SizedBox(width: 100,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBar(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favorite.status == AnimationStatus.dismissed) {
//                           _favorite.reset();
//                           _favorite.animateTo(0.6);
//                         } else {
//                           _favorite.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favorite,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10,),
//           Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/shoes.jpg')),
//                             ),
//                             Text('Under 299'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/t-shirt.jpg')),
//                             ),
//                             Text('Under 250'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/top.jpg')),
//                             ),
//                             Text('Under 150'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/krutas.jpg')),
//                             ),
//                             Text('Under 900'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/jeans.jpg')),
//                             ),
//                             Text('Under 799'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/s1.jpg')),
//                             ),
//                             Text('Under 300'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       child:
//                       CarouselSlider(
//                         items: [
//                           Container(
//                             child: Image(image: AssetImage('assets/sell1.png')),
//                           ),
//                           Container(
//                             // color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/sell2.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/sell3.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/sell4.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/sell5.jpg')),
//                           ),
//                         ],
//                         options: CarouselOptions(
//
//                           //enlargeCenterPage: true,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: 0.8,
//                         ),),
//                     ),
//                     Image(image: AssetImage('assets/offer.jpg')),
//                     SizedBox(height: 10,),
//                     Container(
//                       height: size.height/20,
//                       width: size.width,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(gradient: LinearGradient(
//                           colors: [Colors.cyan.shade100,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
//                       child:  Text('OFFER ENDS IN 03h : 15m :15s',style: TextStyle(fontSize: 20)),
//                     ),
//                     // SingleChildScrollView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   child:
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Image(image: AssetImage('assets/biba.jpg')),
//                           Image(image: AssetImage('assets/faces.jpg')),
//                           Image(image: AssetImage('assets/jewellery.jpg')),
//                           Image(image: AssetImage('assets/lorial.jpg')),
//                           Image(image: AssetImage('assets/miraggio.jpg')),
//                           Image(image: AssetImage('assets/maybelline.jpg')),
//                           Image(image: AssetImage('assets/smartwatch.jpg')),
//                         ],
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/shoes.jpg')),
//                               ),
//                               Text('Under 299'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/t-shirt.jpg')),
//                               ),
//                               Text('Under 250'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/top.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth7.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth6.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth5.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth4.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/krutas.jpg')),
//                               ),
//                               Text('Under 900'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/jeans.jpg')),
//                               ),
//                               Text('Under 799'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/s1.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth1.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth2.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/cloth3.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }

//========================================================================================
//========================================================================================
//==============================Footware======================================================
//==============================================================================================
//=============================================================================================


// class FootWare extends StatefulWidget {
//   const FootWare({Key? key}) : super(key: key);
//
//   @override
//   State<FootWare> createState() => _FootWareState();
// }
//
// class _FootWareState extends State<FootWare> with TickerProviderStateMixin{
//   late AnimationController _bellController;
//   late  AnimationController _favorite;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bellController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _favorite =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _bellController.dispose();
//     _favorite.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(padding: EdgeInsets.only(top: 30),
//                   child:  InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(Icons.arrow_back_ios_new,size: 30),
//                   ),
//                 ),
//                 SizedBox(width: 100,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBar(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favorite.status == AnimationStatus.dismissed) {
//                           _favorite.reset();
//                           _favorite.animateTo(0.6);
//                         } else {
//                           _favorite.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favorite,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10,),
//           Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/foot1.jpg')),
//                             ),
//                             Text('Under 299'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/foot2.jpg')),
//                             ),
//                             Text('Under 250'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/foot3.jpg')),
//                             ),
//                             Text('Under 150'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/foot4.jpg')),
//                             ),
//                             Text('Under 900'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/jeans.jpg')),
//                             ),
//                             Text('Under 799'),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             Container(
//                               height: size.height/8,
//                               width: size.width*0.3,
//                               //color: Colors.deepOrange,
//                               child: Image(image: AssetImage('assets/s1.jpg')),
//                             ),
//                             Text('Under 300'),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       child:
//                       CarouselSlider(
//                         items: [
//                           Container(
//                             child: Image(image: AssetImage('assets/footb1.jpg')),
//                           ),
//                           Container(
//                             // color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/footb2.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/footb3.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/footb4.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/foot5.jpg')),
//                           ),
//                         ],
//                         options: CarouselOptions(
//
//                           //enlargeCenterPage: true,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: 0.8,
//                         ),),
//                     ),
//                     Image(image: AssetImage('assets/footb6.jpg')),
//                     SizedBox(height: 10,),
//                     Container(
//                       height: size.height/20,
//                       width: size.width,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(gradient: LinearGradient(
//                           colors: [Colors.cyan.shade100,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
//                       child:  Text('OFFER ENDS IN 03h : 15m :15s',style: TextStyle(fontSize: 20)),
//                     ),
//                     // SingleChildScrollView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   child:
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Image(image: AssetImage('assets/foot2.jpg')),
//                           Image(image: AssetImage('assets/foot1.jpg')),
//                           Image(image: AssetImage('assets/foot3.jpg')),
//                           Image(image: AssetImage('assets/foot8.jpg')),
//                           Image(image: AssetImage('assets/foot9.jpg')),
//                           Image(image: AssetImage('assets/foot10.jpg')),
//                           Image(image: AssetImage('assets/foot4.jpg')),
//                         ],
//                       ),
//                     ),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot5.jpg')),
//                               ),
//                               Text('Under 299'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot6.jpg')),
//                               ),
//                               Text('Under 250'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot7.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot11.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot2.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot6.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot4.jpg')),
//                               ),
//                               Text('Under 150'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot8.jpg')),
//                               ),
//                               Text('Under 900'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot9.jpg')),
//                               ),
//                               Text('Under 799'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot10.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot1.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot5.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/8,
//                                 width: size.width*0.3,
//                                 //color: Colors.deepOrange,
//                                 child: Image(image: AssetImage('assets/foot2.jpg')),
//                               ),
//                               Text('Under 300'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }
//

//========================================================================================
//========================================================================================
//==============================Beauty======================================================
//==============================================================================================
//=============================================================================================


// class Beauty1 extends StatefulWidget {
//   const Beauty1({Key? key}) : super(key: key);
//
//   @override
//   State<Beauty1> createState() => _Beauty1State();
// }
//
// class _Beauty1State extends State<Beauty1> with TickerProviderStateMixin{
//   late AnimationController _bellController;
//   late  AnimationController _favorite;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bellController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _favorite =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _bellController.dispose();
//     _favorite.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(padding: EdgeInsets.only(top: 30),
//                   child:  InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(Icons.arrow_back_ios_new,size: 30),
//                   ),
//                 ),
//                 SizedBox(width: 100,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => SearchBar(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favorite.status == AnimationStatus.dismissed) {
//                           _favorite.reset();
//                           _favorite.animateTo(0.6);
//                         } else {
//                           _favorite.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favorite,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 10,),
//           Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child:  Row(
//                         children: [
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                   backgroundImage: AssetImage('assets/foot1.jpg'),
//                                   maxRadius: 40,
//                                   minRadius: 30,
//                                 ),
//
//                               Text('Women'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                                CircleAvatar(
//                                   backgroundImage: AssetImage('assets/foot4.jpg'),
//                                   maxRadius: 40,
//                                   minRadius: 30,
//                                 ),
//
//                               Text('Women'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                                CircleAvatar(
//                                   backgroundImage: AssetImage('assets/foot2.jpg'),
//                                   maxRadius: 40,
//                                   minRadius: 30,
//                                 ),
//
//                               Text('Kids'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                   backgroundImage: AssetImage('assets/footware.jpg'),
//                                   maxRadius: 40,
//                                   minRadius: 30,
//                                 ),
//
//                               Text('Footware'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                              CircleAvatar(
//                                   backgroundImage: AssetImage('assets/beauty.jpg'),
//                                   maxRadius: 40,
//                                   minRadius: 30,
//                                 ),
//
//                               Text('BEAUTY'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage('assets/gagets.jpg'),
//                                 maxRadius: 40,
//                                 minRadius: 40,
//                               ),
//                               Text('GADGETS'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage('assets/accessories.jpg'),
//                                 maxRadius: 40,
//                                 minRadius: 40,
//                               ),
//                               Text('ACCESSORIES'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage('assets/home.jpg'),
//                                 maxRadius: 40,
//                                 minRadius: 40,
//                               ),
//                               Text('HOME'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: AssetImage('assets/slay on.jpg'),
//                                 maxRadius: 40,
//                                 minRadius: 40,
//                               ),
//                               Text('Slay On Fleek'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10,),
//                     SingleChildScrollView(
//                       child:
//                       CarouselSlider(
//                         items: [
//                           Container(
//                             child: Image(image: AssetImage('assets/banner1.jpg')),
//                           ),
//                           Container(
//                             // color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/banner4.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/banner3.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/banner2.jpg')),
//                           ),
//                           Container(
//                             child: Image(image: AssetImage('assets/banner5.jpg')),
//                           ),
//                         ],
//                         options: CarouselOptions(
//
//                           //enlargeCenterPage: true,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: 0.8,
//                         ),),
//                     ),
//                     Image(image: AssetImage('assets/offer.jpg')),
//                     SizedBox(height: 10,),
//                     Container(
//                       height: size.height/20,
//                       width: size.width,
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(gradient: LinearGradient(
//                           colors: [Colors.cyan.shade100,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
//                       child:  Text('OFFER ENDS IN 03h : 15m :15s',style: TextStyle(fontSize: 20)),
//                     ),
//                     // SingleChildScrollView(
//                     //   scrollDirection: Axis.horizontal,
//                     //   child:
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Image(image: AssetImage('assets/biba.jpg')),
//                           Image(image: AssetImage('assets/faces.jpg')),
//                           Image(image: AssetImage('assets/jewellery.jpg')),
//                           Image(image: AssetImage('assets/lorial.jpg')),
//                           Image(image: AssetImage('assets/miraggio.jpg')),
//                           Image(image: AssetImage('assets/maybelline.jpg')),
//                           Image(image: AssetImage('assets/smartwatch.jpg')),
//                         ],
//                       ),
//                     ),
//                     Text('ALL-TIME FAVOURITES',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child:Image(image: AssetImage('assets/perfum.jpg')),
//                               ),
//
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child: Image(image: AssetImage('assets/shampu.jpg')),
//                               ),
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child: Image(image: AssetImage('assets/jewellry.jpg')),
//                               ),
//
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child:  Image(image: AssetImage('assets/makup1.jpg')),
//                               ),
//
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10,),
//                     Column(
//                       children: [
//                         Container(
//                           height: size.height/2,
//                           width: size.width,
//                           color: Colors.black12,
//                           child: Column(
//                             children: [
//                               SizedBox(height: 30,),
//                               Container(
//                                 width: size.width,
//                                 height: size.height/15,
//                                 decoration :  BoxDecoration(
//                                     gradient: LinearGradient(colors: [Colors.cyan.shade200,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   // crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//
//                                     Text('FEATURED',style: TextStyle(color: Colors.white,fontSize: 30)),
//                                     SizedBox(width: 10,),
//                                     Text('BRANDS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(height: 30,),
//                               Container(
//                                 height: size.height/3+10,
//                                 width: size.width,
//                                 color: Colors.cyan.shade400,
//                                 child: SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                     children: [
//
//                                       InkWell(
//                                         child: Container(
//                                           child: Image(image: AssetImage('assets/appliances.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/2,
//                                           // height: size.height*0.6,
//                                         ),
//                                         onTap: () {
//
//                                         },
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//
//                                         },
//                                         child: Container(
//                                           child: Image(image: AssetImage('assets/faces.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/2,
//                                           // height: size.height*0.6,
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//
//                                         },
//                                         child:  Container(
//                                           child: Image(image: AssetImage('assets/jewellery.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/2,
//                                           // height: size.height*0.6,
//                                         ),
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//
//                                         },
//                                         child: Container(
//                                           child: Image(image: AssetImage('assets/lorial.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/2,
//                                           // height: size.height*0.6,
//                                         ),
//                                       ),
//
//                                       InkWell(
//                                         onTap: () {
//
//                                         },
//                                         child:Container(
//                                           child: Image(image: AssetImage('assets/maybelline.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/3-20,
//                                           // height: size.height*0.6,
//                                         ),
//                                       ),
//
//
//                                       InkWell(
//                                         onTap: () {
//
//                                         },
//                                         child: Container(
//                                           child: Image(image: AssetImage('assets/miraggio.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/2,
//                                           // height: size.height*0.6,
//                                         ),
//                                       ),
//
//                                       InkWell(
//                                         onTap: () {
//
//                                         },
//                                         child:  Container(
//                                           child: Image(image: AssetImage('assets/smartwatch.jpg')),
//                                           width: size.width*0.6,
//                                           height: size.height/2,
//                                           // height: size.height*0.6,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20,),
//                         Image(image: AssetImage('assets/banner8.jpg')),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child:  Image(image: AssetImage('assets/jewellry1.jpg')),
//                               ),
//
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child: Image(image: AssetImage('assets/budget.jpg')),
//                               ),
//
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child:  Image(image: AssetImage('assets/haircare.jpg')),
//                               ),
//
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: size.height/5,
//                           width: size.width*0.5-10,
//                           decoration: BoxDecoration(color: Colors.white,
//                               boxShadow: [BoxShadow(color: Colors.black54,blurStyle: BlurStyle.outer)],
//                               border: Border.all(width: 1)),
//                           child: Column(
//                             children: [
//                               Container(
//                                 width: size.width*0.5,
//                                 height: size.height/6,
//                                 child:  Image(image: AssetImage('assets/luxe.jpg')),
//                               ),
//                               Text('Under ₹350'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               )),
//         ],
//       ),
//     );
//   }
// }


// //========================================================================================
// //========================================================================================
// //==============================     FWD    ======================================================
// //==============================================================================================
// //=============================================================================================
//
// class Fwd extends StatefulWidget {
//   const Fwd({Key? key}) : super(key: key);
//
//   @override
//   State<Fwd> createState() => _FwdState();
// }
//
// class _FwdState extends State<Fwd> with TickerProviderStateMixin {
//   late AnimationController _bellController;
//   late  AnimationController _favorite;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bellController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _favorite =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _bellController.dispose();
//     _favorite.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size=MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: size.height/13,
//         width: size.width,
//         decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                     //Navigator.push(context, MaterialPageRoute(builder: (context) => Myntra(),));
//                   },
//                   child:  Icon(Icons.home,color: Colors.black),
//                 ),
//                 Text('Home',style: TextStyle(color: Colors.black)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Fwd(),));
//                   },
//                   child: Icon(Icons.line_axis,color: Colors.deepOrange,),
//                 ),
//                 Text('Fwd',style: TextStyle(color: Colors.deepOrange)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => EveryDay(),));
//                   },
//                   child:  Icon(Icons.directions_boat_filled_outlined,color: Colors.black),
//                 ),
//                 Text('Everyday'),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Luxe(),));
//                   },
//                   child:  Icon(Icons.diamond_outlined,color: Colors.black),
//                 ),
//                 Text('Luxe'),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                        // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
//                   },
//                   child:  Icon(Icons.person_outline_rounded,color: Colors.black),
//                 ),
//                 Text('Profile'),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(width: 10,),
//                 Padding(
//                   padding: EdgeInsets.only(top: 25),
//                   child:  Text('fwd-Women',style: TextStyle(fontSize: size.width/15,fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(width: 80,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favorite.status == AnimationStatus.dismissed) {
//                           _favorite.reset();
//                           _favorite.animateTo(0.6);
//                         } else {
//                           _favorite.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favorite,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//           Expanded(
//               child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                       },
//                       child:  Container(
//                         width: 180,
//                         height: 50,
//                         decoration: BoxDecoration(color: Colors.black87,borderRadius: BorderRadius.circular(50) ),
//                         alignment: Alignment.center,
//                         child: Text('WOMEN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
//
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                       },
//                       child:  Container(
//                         width: 180,
//                         height: 50,
//                         decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(50),border: Border.all(color: Colors.black87,style: BorderStyle.solid,width: 3)),
//                         alignment: Alignment.center,
//                         child: Text('MEN',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 20)),
//
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: size.height/5,
//                         width: size.width*0.4,
//                         //color: Colors.deepOrange,
//                         child:  Image(image: AssetImage('assets/fwd1.jpg'),fit: BoxFit.fill,),
//                       ),
//                       Container(
//                         height: size.height/5,
//                         width: size.width*0.4,
//                         //color: Colors.deepOrange,
//                         child:  Image(image: AssetImage('assets/fwd2.jpg'),fit: BoxFit.fill,),
//                       ),
//                       Container(
//                         height: size.height/5,
//                         width: size.width*0.4,
//                         //color: Colors.deepOrange,
//                         child:  Image(image: AssetImage('assets/fwd3.jpg'),fit: BoxFit.fill,),
//                       ),
//                       Container(
//                         height: size.height/5,
//                         width: size.width*0.4,
//                         //color: Colors.deepOrange,
//                         child:  Image(image: AssetImage('assets/fwd4.jpg'),fit: BoxFit.fill,),
//                       ),
//                       Container(
//                         height: size.height/5,
//                         width: size.width*0.4,
//                         //color: Colors.deepOrange,
//                         child:  Image(image: AssetImage('assets/fwd5.jpg'),fit: BoxFit.fill,),
//                       ),
//                       Container(
//                         height: size.height/5,
//                         width: size.width*0.4,
//                         //color: Colors.deepOrange,
//                         child:  Image(image: AssetImage('assets/fwd6.jpg'),fit: BoxFit.fill,),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 Container(
//                   height: size.height/18,
//                   width: size.width,
//                   color: Colors.red,
//                   alignment: Alignment.center,
//                   child: Text('HOT TRANDS FOR GENERATION',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(height: 20,),
//                  CarouselSlider(
//                       items: [
//                         Container(
//                           height: size.height/7,
//                           width: size.width*0.8-10,
//                           child: Image(image: AssetImage('assets/offer1.jpg'),fit: BoxFit.fill,),
//                         ),
//                         Container(
//                           height: size.height/7,
//                           width: size.width*0.8-10,
//                           child: Image(image: AssetImage('assets/offer2.jpg'),fit: BoxFit.fill,),
//                         ),
//                         Container(
//                           height: size.height/7,
//                           width: size.width*0.8-10,
//                           child: Image(image: AssetImage('assets/offer3.jpg'),fit: BoxFit.fill,),
//                         ),
//                         Container(
//                           height: size.height/7,
//                           width: size.width*0.8-10,
//                           child: Image(image: AssetImage('assets/offer4.jpg'),fit: BoxFit.fill,),
//                         ),
//                         Container(
//                           height: size.height/7,
//                           width: size.width*0.8-10,
//                           child: Image(image: AssetImage('assets/offer5.jpg'),fit: BoxFit.fill,),
//                         ),
//                       ], options: CarouselOptions(
//                     autoPlay: true,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                   ),),
//                 SizedBox(height: 30,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Container(
//                           height: size.height/10,
//                           width: size.width*0.4-30,
//                           decoration: BoxDecoration(color: Colors.black,
//                               borderRadius: BorderRadius.circular(10)
//                               ,boxShadow: [BoxShadow(color: Colors.lightGreenAccent,offset: Offset(0, 2),blurRadius: 4,spreadRadius: 2)]
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: 20,),
//                               Text('Fits Off',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//                               Text('Your Feed',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           child:  CircleAvatar(
//                             backgroundColor: Colors.red,
//                           maxRadius: 18,
//                             child: Icon(Icons.how_to_vote,color: Colors.black),
//                         ),
//                         left: 50,
//                           bottom: 55,
//                         ),
//
//                       ],
//                     ),
//                     Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Container(
//                           height: size.height/10,
//                           width: size.width*0.4-30,
//                           decoration: BoxDecoration(color: Colors.black,
//                               borderRadius: BorderRadius.circular(10)
//                               ,boxShadow: [BoxShadow(color: Colors.lightGreenAccent,offset: Offset(0, 2),blurRadius: 5,spreadRadius: 2)]
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: 20,),
//                               Text('Fresh Style',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//                               Text('Fab Prices',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           child:  CircleAvatar(
//                             backgroundColor: Colors.red,
//                             maxRadius: 18,
//                             child: Icon(Icons.percent,color: Colors.black),
//                           ),
//                           left: 50,
//                           bottom: 55,
//                         ),
//
//                       ],
//                     ),
//                     Stack(
//                       clipBehavior: Clip.none,
//                       children: [
//                         Container(
//                           height: size.height/10,
//                           width: size.width*0.4-30,
//                           decoration: BoxDecoration(color: Colors.black,
//                               borderRadius: BorderRadius.circular(10)
//                               ,boxShadow: [BoxShadow(color: Colors.lightGreenAccent,offset: Offset(0, 2),blurRadius: 5,spreadRadius: 2)]
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(height: 20,),
//                               Text('Celeb Style',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//                               Text('Files',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           child:  CircleAvatar(
//                             backgroundColor: Colors.red,
//                             maxRadius: 18,
//                             child: Icon(Icons.favorite,color: Colors.black),
//                           ),
//                           left: 50,
//                           bottom: 55,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                   width: size.width,
//                   height: size.height/7,
//                  // color: Colors.red,
//                   child: Image(image: AssetImage('assets/offer6.jpg'),fit: BoxFit.fill,),
//                 ),
//                 SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       width: size.width*0.5-10,
//                       height: size.height/3,
//                        //color: Colors.red,
//                       child: Image(image: AssetImage('assets/offer7.jpg'),fit: BoxFit.fill,),
//                     ),
//                     Container(
//                       width: size.width*0.5-10,
//                       height: size.height/3,
//                      // color: Colors.red,
//                       child: Image(image: AssetImage('assets/offer8.jpg'),fit: BoxFit.fill,),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Container(
//                   height: size.height/12,
//                   width: size.width,
//                   color: Colors.red,
//                   alignment: Alignment.center,
//                   child: Text('TRENDING RN',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w900)),
//                 ),
//                SizedBox(height: 5,),
//                Container(
//                  width: size.width,
//                  height: size.height/3,
//                  color: Colors.red,
//                  child:  SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: [
//                        SizedBox(width: 10,),
//                        Container(
//                          width: size.width*0.5-10,
//                          height: size.height/3,
//                          child: Image(image: AssetImage('assets/fitness1.jpg'),fit: BoxFit.fill,),
//                        ),
//                        SizedBox(width: 10,),
//                        Container(
//                          width: size.width*0.5-10,
//                          height: size.height/3,
//                          child: Image(image: AssetImage('assets/fitness2.jpg'),fit: BoxFit.fill,),
//                        ),
//                        SizedBox(width: 10,),
//                        Container(
//                          width: size.width*0.5-10,
//                          height: size.height/3,
//                          child: Image(image: AssetImage('assets/fitness3.jpg'),fit: BoxFit.fill,),
//                        ),
//                        SizedBox(width: 10,),
//                        Container(
//                          width: size.width*0.5-10,
//                          height: size.height/3,
//                          child: Image(image: AssetImage('assets/fitness4.jpg'),fit: BoxFit.fill,),
//                        ),
//                        SizedBox(width: 10,),
//                        Container(
//                          width: size.width*0.5-10,
//                          height: size.height/3,
//                          child: Image(image: AssetImage('assets/fitness5.jpg'),fit: BoxFit.fill,),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//               ],
//             ),
//           )),
//         ],
//       ),
//     );
//   }
// }


//========================================================================================
//========================================================================================
//==============================     Profile    ======================================================
//==============================================================================================
//=============================================================================================

// class Profile extends StatefulWidget {
//   const Profile({Key? key}) : super(key: key);
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   // All journals
//   List<Map<String, dynamic>> _journals = [];
//
//   bool _isLoading = true;
//   // This function is used to fetch all data from the database
//   void _refreshJournals() async {
//     final data = await SQLHelper.getItems();
//     setState(() {
//       _journals = data;
//       _isLoading = false;
//     });
//   }
//   File ? _file1;
//   final _imagepicker = ImagePicker();
//   Future<void> _openImagePicker() async {
//     final XFile? pickerImage = await _imagepicker.pickImage(source: ImageSource.gallery);
//     if(pickerImage != null){
//       setState(() {
//         _file1 = File(pickerImage.path);
//       });
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     _refreshJournals(); // Loading the diary when the app starts
//   }
//
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//   final TextEditingController _descController = TextEditingController();
//   // This function will be triggered when the floating button is pressed
//   // It will also be triggered when you want to update an item
//   void _showForm(int? id) async {
//     if (id != null) {
//       // id == null -> create new item
//       // id != null -> update an existing item
//       final existingJournal =
//       _journals.firstWhere((element) => element['id'] == id);
//       _titleController.text = existingJournal['title'];
//       _descriptionController.text = existingJournal['description'];
//       _timeController.text = existingJournal['time'];
//       _descController.text = existingJournal['desc'];
//     }
//
//     showModalBottomSheet(
//         context: context,
//         elevation: 5,
//         isScrollControlled: true,
//         builder: (_) => Container(
//           padding: EdgeInsets.only(
//             top: 15,
//             left: 15,
//             right: 15,
//             // this will prevent the soft keyboard from covering the text fields
//             bottom: MediaQuery.of(context).viewInsets.bottom + 120,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               TextField(
//                 controller: _titleController,
//                 decoration: const InputDecoration(hintText: 'Product'),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 controller: _descriptionController,
//                 decoration: const InputDecoration(hintText: 'Person'),
//               ),
//               TextField(
//                 controller: _timeController,
//                 decoration: const InputDecoration(hintText: 'Time'),
//               ),
//               TextField(
//                 controller: _descController,
//                 decoration: const InputDecoration(hintText: 'Description'),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () async {
//                       // Save new journal
//                       if (id == null) {
//                         await _addItem();
//                       }
//
//                       if (id != null) {
//                         await _updateItem(id);
//                       }
//
//                       // Clear the text fields
//                       _titleController.text = '';
//                       _descriptionController.text = '';
//                       _timeController.text = '';
//                       _descController.text = '';
//                       // Close the bottom sheet
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(id == null ? 'Create New' : 'Update'),
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         _openImagePicker();
//                       }, child: Icon(Icons.camera_alt)),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }
//
// // Insert a new journal to the database
//   Future<void> _addItem() async {
//     await SQLHelper.createItem(
//         _titleController.text, _descriptionController.text,_timeController.text,_descController.text,_file1!.path);
//     _refreshJournals();
//   }
//
//   // Update an existing journal
//   Future<void> _updateItem(int id) async {
//     await SQLHelper.updateItem(
//         id, _titleController.text, _descriptionController.text,_timeController.text,_descController.text);
//     _refreshJournals();
//   }
//
//   // Delete an item
//   void _deleteItem(int id) async {
//     await SQLHelper.deleteItem(id);
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//       content: Text('Successfully deleted a journal!'),
//     ));
//     _refreshJournals();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kindacode.com'),
//       ),
//       body: _isLoading
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: _journals.length,
//         itemBuilder: (context, index) => Card(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: size.width*0.4-10,
//                         height: size.height/6,
//                         child: _journals[index]['imagetype'] == "File" ?
//                         Image.file(File(_journals[index]['fileimage']),fit: BoxFit.cover,):
//                         Text('please enter the image'),
//                       ),
//                     ),
//                     SizedBox(width: 20,),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('${_journals[index]['title']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.width/25)),
//                           SizedBox(height: 5,),
//                           Text('${_journals[index]['description']}',style: TextStyle(fontSize: size.width/25,fontWeight: FontWeight.w500)),
//                           SizedBox(height: 5,),
//
//                           Row(
//                             children: [
//                               Text('${_journals[index]['time']}',style: TextStyle(fontSize: size.width/25)),
//                               Icon(Icons.star,color: Colors.yellow.shade700,size: size.width/25),
//                               Icon(Icons.star,color: Colors.yellow.shade700,size: size.width/25),
//                               Icon(Icons.star,color: Colors.yellow.shade700,size: size.width/25),
//                               Icon(Icons.star_half_outlined,color: Colors.yellow.shade700,size: size.width/25),
//                             ],
//                           ),
//                           SizedBox(height: 5,),
//                           Text('${_journals[index]['desc']}',style: TextStyle(fontSize: size.width/25)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 20,),
//                     Expanded(
//                       child: Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit),
//                             onPressed: () => _showForm(_journals[index]['id']),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () =>
//                                 _deleteItem(_journals[index]['id']),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         //Card(
//         //       clipBehavior: Clip.none,
//         //       color: Colors.orange[200],
//         //        margin: const EdgeInsets.all(15),
//         //        child: ListTile(
//         //            leading: Container(
//         //              height: size.height/3,
//         //              width: size.width*0.10+20,
//         //              color: Colors.white,
//         //              child: _journals[index]['imagetype'] == "File" ?
//         //              Image.file(File(_journals[index]['fileimage']),fit: BoxFit.cover,):
//         //              Text('please enter the image'),
//         //         ),
//         //            title: Text(_journals[index]['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
//         //            subtitle: Column(
//         //              crossAxisAlignment: CrossAxisAlignment.start,
//         //              children: [
//         //                Text(_journals[index]['description'],style: TextStyle(fontSize: 20)),
//         //                Text(_journals[index]['time'],style: TextStyle(fontSize: 20)),
//         //                Text(_journals[index]['desc'],style: TextStyle(fontSize: 20)),
//         //          // Text(_journals[index]['time']),
//         //          ],
//         //       ),
//         //            trailing: SizedBox(
//         //              width: 100,
//         //              child: Row(
//         //                children: [
//         //                  IconButton(
//         //                    icon: const Icon(Icons.edit),
//         //                    onPressed: () => _showForm(_journals[index]['id']),
//         //                  ),
//         //                  IconButton(
//         //                    icon: const Icon(Icons.delete),
//         //                     onPressed: () =>
//         //                   _deleteItem(_journals[index]['id']),
//         //                ),
//         //           ],
//         //         ),
//         //       )),
//         // ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _showForm(null),
//       ),
//     );
//   }
// }




//========================================================================================
//========================================================================================
//==============================     Every Day    ======================================================
//==============================================================================================
//=============================================================================================



// class EveryDay extends StatefulWidget {
//   const EveryDay({Key? key}) : super(key: key);
//
//   @override
//   State<EveryDay> createState() => _EveryDayState();
// }
//
// class _EveryDayState extends State<EveryDay> with TickerProviderStateMixin{
//   late AnimationController _bellController;
//   late  AnimationController _favorite;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bellController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _favorite =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _bellController.dispose();
//     _favorite.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: size.height/13,
//         width: size.width,
//         decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Myntra(),));
//                   },
//                   child:  Icon(Icons.home,color: Colors.black),
//                 ),
//                 Text('Home',style: TextStyle(color: Colors.black)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Fwd(),));
//                   },
//                   child: Icon(Icons.line_axis,color: Colors.black,),
//                 ),
//                 Text('Fwd'),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => EveryDay(),));
//                   },
//                   child:  Icon(Icons.directions_boat_filled_outlined,color: Colors.deepOrange),
//                 ),
//                 Text('Everyday',style: TextStyle(color: Colors.deepOrange)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Luxe(),));
//                   },
//                   child:  Icon(Icons.diamond_outlined,color: Colors.black),
//                 ),
//                 Text('Luxe'),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
//                   },
//                   child:  Icon(Icons.person_outline_rounded,color: Colors.black),
//                 ),
//                 Text('Profile'),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 28),
//                   child:   Text('Myntra Everyday',style: TextStyle(fontSize: size.width/15,fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(width: 50,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favorite.status == AnimationStatus.dismissed) {
//                           _favorite.reset();
//                           _favorite.animateTo(0.6);
//                         } else {
//                           _favorite.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favorite,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//           Expanded(
//               child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: size.width,
//                   height: size.height/4,
//                   child: Image(image: AssetImage('assets/every1.jpg'),fit: BoxFit.fill,),
//                 ),
//                 SizedBox(height: 20,),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20),
//                   child : Text('CATEGORIES ON THE RISE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
//                 ),
//                 SizedBox(height: 5,),
//                 Padding(padding: EdgeInsets.only(left: 20),
//                 child: Text('Get, Set, Restock!',style: TextStyle(fontSize: 18)),
//                 ),
//                 SizedBox(height: 20,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/men.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('MENS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/women.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('WOMENS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                    Column(
//                      children: [
//                        CircleAvatar(
//                          backgroundImage: AssetImage('assets/personalcare.jpg'),
//                          maxRadius: 30,
//                        ),
//                        Text('PERSONAL',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                      ],
//                    ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/accessories.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('ACCESSORIES',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/kids.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('KIDS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/foot1.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('FOOTWARE',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/jewellery.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('JEWELLERY',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/home1.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('HOME & KITCHEN',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/gagets.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('GADGETS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundImage: AssetImage('assets/essntials.jpg'),
//                           maxRadius: 30,
//                         ),
//                         Text('ESSENTIALS',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
//                       ],
//                     ),
//
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Padding(padding: EdgeInsets.only(left: 20),
//                   child: Text('FASHION ESSENTIALS',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(height: 20,),
//                 Column(
//                   children: [
//                     Container(
//                       height: size.height/2,
//                       width: size.width,
//                       color: Colors.black12,
//                       child: Column(
//                         children: [
//                           SizedBox(height: 30,),
//                           Container(
//                             width: size.width,
//                             height: size.height/12,
//                             decoration :  BoxDecoration(
//                                 gradient: LinearGradient(colors: [Colors.cyan.shade200,Colors.cyan.shade200,Colors.cyan.shade300,Colors.cyan.shade500])),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               // crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//
//                                 Text('FASHION',style: TextStyle(color: Colors.white,fontSize: 30)),
//                                 SizedBox(width: 10,),
//                                 Text('ESSENTIALS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 30),),
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: 20,),
//                           Expanded(
//                             child: Container(
//                               height: size.height/3+10,
//                               width: size.width,
//                               color: Colors.cyan.shade400,
//                               child: SingleChildScrollView(
//                                 scrollDirection: Axis.horizontal,
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                         child: Image(image: AssetImage('assets/biba.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/2,
//                                         // height: size.height*0.6,
//                                       ),
//                                     Container(
//                                         child: Image(image: AssetImage('assets/faces.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/2
//                                     ),
//                                     Container(
//                                         child: Image(image: AssetImage('assets/jewellery.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/2,
//                                     ),
//                                     Container(
//                                         child: Image(image: AssetImage('assets/lorial.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/2,
//                                     ),
//                                      Container(
//                                         child: Image(image: AssetImage('assets/maybelline.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/3-20,
//                                     ),
//                                     Container(
//                                         child: Image(image: AssetImage('assets/miraggio.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/2,
//                                       ),
//                                    Container(
//                                         child: Image(image: AssetImage('assets/smartwatch.jpg')),
//                                         width: size.width*0.6,
//                                         height: size.height/2,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10,),
//                 Padding(
//                     padding: EdgeInsets.only(left: 20),
//                     child : Text('SHOP BY CATEGORY',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
//                 ),
//
//                 Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child : Text('Summertime Must-Buys',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20),),
//                 ),
//                 SizedBox(height: 10,),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/shoes.jpg')),
//                           ),
//                           Text('Under 299'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/t-shirt.jpg')),
//                           ),
//                           Text('Under 250'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/top.jpg')),
//                           ),
//                           Text('Under 150'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth7.jpg')),
//                           ),
//                           Text('Under 150'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth6.jpg')),
//                           ),
//                           Text('Under 150'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth5.jpg')),
//                           ),
//                           Text('Under 150'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth4.jpg')),
//                           ),
//                           Text('Under 150'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/krutas.jpg')),
//                           ),
//                           Text('Under 900'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/jeans.jpg')),
//                           ),
//                           Text('Under 799'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/s1.jpg')),
//                           ),
//                           Text('Under 300'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth1.jpg')),
//                           ),
//                           Text('Under 300'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth2.jpg')),
//                           ),
//                           Text('Under 300'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                       Column(
//                         children: [
//                           Container(
//                             height: size.height/8,
//                             width: size.width*0.3,
//                             //color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/cloth3.jpg')),
//                           ),
//                           Text('Under 300'),
//                         ],
//                       ),
//                       SizedBox(width: 10,),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//========================================================================================
//========================================================================================
//==============================     Luxe    ======================================================
//==============================================================================================
//=============================================================================================



// class Luxe extends StatefulWidget {
//   const Luxe({Key? key}) : super(key: key);
//
//   @override
//   State<Luxe> createState() => _LuxeState();
// }
//
// class _LuxeState extends State<Luxe> with TickerProviderStateMixin{
//   late AnimationController _bellController;
//   late  AnimationController _favorite;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _bellController =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//     _favorite =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1));
//   }
//
//   @override
//   void dispose() {
//     _bellController.dispose();
//     _favorite.dispose();
//
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: size.height/13,
//         width: size.width,
//         decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Myntra(),));
//                   },
//                   child:  Icon(Icons.home,color: Colors.black),
//                 ),
//                 Text('Home',style: TextStyle(color: Colors.black)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => Fwd(),));
//                   },
//                   child: Icon(Icons.line_axis,color: Colors.black,),
//                 ),
//                 Text('Fwd'),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => EveryDay(),));
//                   },
//                   child:  Icon(Icons.directions_boat_filled_outlined,color: Colors.black),
//                 ),
//                 Text('Everyday'),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                   },
//                   child:  Icon(Icons.diamond_outlined,color: Colors.deepOrange),
//                 ),
//                 Text('Luxe',style: TextStyle(color: Colors.deepOrange)),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
//                   },
//                   child:  Icon(Icons.person_outline_rounded,color: Colors.black),
//                 ),
//                 Text('Profile'),
//               ],
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: size.height/9,
//             width: size.width,
//             decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 30),
//                   child:  Text('Myntra-Luxe',style: TextStyle(fontSize: size.width/15,fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(width: 50,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  InkWell(
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
//                         },
//                         child: Icon(Icons.search,size: 35)
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child:  Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:  IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         print(_bellController.status);
//                         if (_bellController.isAnimating) {
//                           // _bellController.stop();
//                           _bellController.reset();
//                         } else {
//                           _bellController.repeat();
//                         }
//                       },
//                       icon: Lottie.asset(LottieFiles.$63128_bell_icon,
//                           controller: _bellController,
//                           height: 45,
//                           fit: BoxFit.cover),
//                     ),
//                   ),),
//
//                 SizedBox(width: 10,),
//                 Flexible(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   IconButton(
//                       splashRadius: 50,
//                       iconSize: 100,
//                       onPressed: () {
//                         if (_favorite.status == AnimationStatus.dismissed) {
//                           _favorite.reset();
//                           _favorite.animateTo(0.6);
//                         } else {
//                           _favorite.reverse();
//                         }
//                       },
//                       icon: Lottie.asset(Icons8.heart_color,
//                           controller: _favorite,
//                           height: 35,
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10,),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 30),
//                     child:   Icon(Icons.shopping_bag_outlined,size: 35),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//           Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: size.height/4,
//                       width: size.width,
//                       child: Image(image: AssetImage('assets/luxe1.jpg'),fit: BoxFit.fill),
//                     ),
//                     SizedBox(height: 10),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: [
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/13,
//                                 width: size.width*0.2,
//                                 child: Image(image: AssetImage('assets/black.jpg'),fit: BoxFit.fill,),
//                               ),
//                               Text('BRAND'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/13,
//                                 width: size.width*0.2,
//                                 child: Image(image: AssetImage('assets/black1.jpg'),fit: BoxFit.fill,),
//                               ),
//                               Text('WOMEN'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/13,
//                                 width: size.width*0.2,
//                                 child: Image(image: AssetImage('assets/black3.jpg'),fit: BoxFit.fill,),
//                               ),
//                               Text('MEN'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/13,
//                                 width: size.width*0.2,
//                                 child: Image(image: AssetImage('assets/black2.jpg'),fit: BoxFit.fill,),
//                               ),
//                               Text('WATCHES'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/13,
//                                 width: size.width*0.2,
//                                 child: Image(image: AssetImage('assets/black.jpg'),fit: BoxFit.fill,),
//                               ),
//                               Text('HANDBAGES'),
//                             ],
//                           ),
//                           SizedBox(width: 10,),
//                           Column(
//                             children: [
//                               Container(
//                                 height: size.height/13,
//                                 width: size.width*0.2,
//                                 child: Image(image: AssetImage('assets/foot1.jpg'),fit: BoxFit.fill,),
//                               ),
//                               Text('FOOTWARE'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 20,),
//                     SingleChildScrollView(
//                       child:
//                       CarouselSlider(
//                         items: [
//                           Container(
//                             height: size.height/3,
//                             width: size.width,
//
//                             child: Image(image: AssetImage('assets/black4.jpg'),fit: BoxFit.fill,),
//                           ),
//                          // SizedBox(width: 10,),
//                           Container(
//                             height: size.height/3,
//                             width: size.width,
//                             // color: Colors.deepOrange,
//                             child: Image(image: AssetImage('assets/black5.jpg'),fit: BoxFit.fill,),
//                           ),
//                           //SizedBox(width: 10,),
//                           Container(
//                             height: size.height/3,
//                             width: size.width,
//                             child: Image(image: AssetImage('assets/black6.jpg'),fit: BoxFit.fill,),
//                           ),
//                           //SizedBox(width: 10,),
//                           Container(
//                             height: size.height/3,
//                             width: size.width,
//                             child: Image(image: AssetImage('assets/black7.jpg'),fit: BoxFit.fill,),
//                           ),
//                         ],
//                         options: CarouselOptions(
//                           //enlargeCenterPage: true,
//                           autoPlay: true,
//                           aspectRatio: 16 / 9,
//                           autoPlayCurve: Curves.fastOutSlowIn,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 900),
//                           //  viewportFraction: 0.8,
//                         ),),
//                     ),
//                   ],
//                 ),
//               ))
//         ],
//       ),
//     );
//   }
// }



