import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signin/screen/searchbar.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';

class FootWare extends StatefulWidget {
  const FootWare({Key? key}) : super(key: key);

  @override
  State<FootWare> createState() => _FootWareState();
}

class _FootWareState extends State<FootWare> with TickerProviderStateMixin{
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
                              child: Image(image: AssetImage('assets/foot1.jpg')),
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
                              child: Image(image: AssetImage('assets/foot2.jpg')),
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
                              child: Image(image: AssetImage('assets/foot3.jpg')),
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
                              child: Image(image: AssetImage('assets/foot4.jpg')),
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
                            child: Image(image: AssetImage('assets/footb1.jpg')),
                          ),
                          Container(
                            // color: Colors.deepOrange,
                            child: Image(image: AssetImage('assets/footb2.jpg')),
                          ),
                          Container(
                            child: Image(image: AssetImage('assets/footb3.jpg')),
                          ),
                          Container(
                            child: Image(image: AssetImage('assets/footb4.jpg')),
                          ),
                          Container(
                            child: Image(image: AssetImage('assets/foot5.jpg')),
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
                    Image(image: AssetImage('assets/footb6.jpg')),
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
                          Image(image: AssetImage('assets/foot2.jpg')),
                          Image(image: AssetImage('assets/foot1.jpg')),
                          Image(image: AssetImage('assets/foot3.jpg')),
                          Image(image: AssetImage('assets/foot8.jpg')),
                          Image(image: AssetImage('assets/foot9.jpg')),
                          Image(image: AssetImage('assets/foot10.jpg')),
                          Image(image: AssetImage('assets/foot4.jpg')),
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
                                child: Image(image: AssetImage('assets/foot5.jpg')),
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
                                child: Image(image: AssetImage('assets/foot6.jpg')),
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
                                child: Image(image: AssetImage('assets/foot7.jpg')),
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
                                child: Image(image: AssetImage('assets/foot11.jpg')),
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
                                child: Image(image: AssetImage('assets/foot2.jpg')),
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
                                child: Image(image: AssetImage('assets/foot6.jpg')),
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
                                child: Image(image: AssetImage('assets/foot4.jpg')),
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
                                child: Image(image: AssetImage('assets/foot8.jpg')),
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
                                child: Image(image: AssetImage('assets/foot9.jpg')),
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
                                child: Image(image: AssetImage('assets/foot10.jpg')),
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
                                child: Image(image: AssetImage('assets/foot1.jpg')),
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
                                child: Image(image: AssetImage('assets/foot5.jpg')),
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
                                child: Image(image: AssetImage('assets/foot2.jpg')),
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

