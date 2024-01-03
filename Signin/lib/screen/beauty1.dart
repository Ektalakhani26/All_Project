import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signin/screen/searchbar.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:lottie/lottie.dart';


class Beauty1 extends StatefulWidget {
  const Beauty1({Key? key}) : super(key: key);

  @override
  State<Beauty1> createState() => _Beauty1State();
}

class _Beauty1State extends State<Beauty1> with TickerProviderStateMixin{
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child:  Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/foot1.jpg'),
                                maxRadius: 40,
                                minRadius: 30,
                              ),

                              Text('Women'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/foot4.jpg'),
                                maxRadius: 40,
                                minRadius: 30,
                              ),

                              Text('Women'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/foot2.jpg'),
                                maxRadius: 40,
                                minRadius: 30,
                              ),

                              Text('Kids'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/footware.jpg'),
                                maxRadius: 40,
                                minRadius: 30,
                              ),

                              Text('Footware'),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/beauty.jpg'),
                                maxRadius: 40,
                                minRadius: 30,
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
                    Text('ALL-TIME FAVOURITES',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
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
                                child:Image(image: AssetImage('assets/perfum.jpg')),
                              ),

                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                        Container(
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
                                child: Image(image: AssetImage('assets/shampu.jpg')),
                              ),
                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
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
                                child: Image(image: AssetImage('assets/jewellry.jpg')),
                              ),

                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                        Container(
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
                                child:  Image(image: AssetImage('assets/makup1.jpg')),
                              ),

                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
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
                                          child: Image(image: AssetImage('assets/appliances.jpg')),
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
                        SizedBox(height: 20,),
                        Image(image: AssetImage('assets/banner8.jpg')),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
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
                                child:  Image(image: AssetImage('assets/jewellry1.jpg')),
                              ),

                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                        Container(
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
                                child: Image(image: AssetImage('assets/budget.jpg')),
                              ),

                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
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
                                child:  Image(image: AssetImage('assets/haircare.jpg')),
                              ),

                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                        Container(
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
                                child:  Image(image: AssetImage('assets/luxe.jpg')),
                              ),
                              Text('Under ₹350'),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              )),
        ],
      ),
    );
  }
}