import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';
import 'package:signin/screen/searchbar.dart';


class Women extends StatefulWidget {
  const Women({Key? key}) : super(key: key);

  @override
  State<Women> createState() => _WomenState();
}

class _WomenState extends State<Women> with TickerProviderStateMixin{

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
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height/9,
            width: size.width,
            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0, 3),blurStyle: BlurStyle.outer)]),
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
                              child: Image(image: AssetImage('assets/makup.jpg')),
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
                              child: Image(image: AssetImage('assets/haircare.jpg')),
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
                              child: Image(image: AssetImage('assets/luxe.jpg')),
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
                            child: Image(image: AssetImage('assets/banner1.jpg')),
                          ),
                          Container(
                            // color: Colors.deepOrange,
                            child: Image(image: AssetImage('assets/banner4.jpg')),
                          ),
                          Container(
                            child: Image(image: AssetImage('assets/banner3.jpg')),
                          ),
                          Container(
                            child: Image(image: AssetImage('assets/banner2.jpg')),
                          ),
                          Container(
                            child: Image(image: AssetImage('assets/banner5.jpg')),
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
                                child: Image(image: AssetImage('assets/skincare.jpg')),
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
                                child: Image(image: AssetImage('assets/haircare.jpg')),
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
                                child: Image(image: AssetImage('assets/fragrances.jpg')),
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
                                child: Image(image: AssetImage('assets/appliances.jpg')),
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
                                child: Image(image: AssetImage('assets/bath.jpg')),
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
                                child: Image(image: AssetImage('assets/salon.jpg')),
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
                                child: Image(image: AssetImage('assets/grooming.jpg')),
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
                                child: Image(image: AssetImage('assets/perfum.jpg')),
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
                                child: Image(image: AssetImage('assets/budget.jpg')),
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
