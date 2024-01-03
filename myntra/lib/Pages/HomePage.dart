import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:myntra/Pages/Product/GirlsScreen.dart';
import 'package:myntra/Pages/Product/beautyScreen.dart';
import 'package:myntra/Pages/Product/footwareScreen.dart';
import 'package:myntra/Pages/Product/kidsScreen.dart';
import 'package:myntra/Pages/Product/mensScreen.dart';
import 'package:myntra/Pages/Product/perfumScreen.dart';
import 'package:myntra/Shopping/favorite_screen.dart';
import '../Bottom Navigationbar/bottomNavigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: MyFun.bottomNavigation(context),
        body: Column(
          children: [
            Card(
              child: Container(
                height: size.height/12,
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10,),
                    Text('E_Mart',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600)),
                    Icon(Icons.keyboard_arrow_down_sharp,size: 30,color: Colors.pink,),
                    SizedBox(width: size.width*0.4+10,),
                    Expanded(child: Icon(Icons.notifications,color: Colors.yellow.shade600,size: 35,)),
                    SizedBox(width: 5,),
                    Expanded(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                          },
                          child: Icon(Icons.favorite,color: Colors.red,size: 35,)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child : SingleChildScrollView(
               // scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/banner.jpeg')),
                    CarouselSlider(
                      items: [
                        Container(
                          child: Image(image: AssetImage('assets/banner1.jpg')),
                        ),
                        Container(
                          // color: Colors.deepOrange,
                          child: Image(image: AssetImage('assets/banner2.jpg')),
                        ),
                        Container(
                          child: Image(image: AssetImage('assets/banner3.jpg')),
                        ),
                        Container(
                          child: Image(image: AssetImage('assets/banner4.jpg')),
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
                      ),
                    ),
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
                                  child:Image(image: AssetImage('assets/cloth1.jpg'),fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Text('Under ₹350'),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => GirlsScreen(),));
                          },
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => KidsScreen(),));
                          },
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
                                  child: Image(image: AssetImage('assets/cloth2.jpg'),fit: BoxFit.fill),
                                ),
                                SizedBox(height: 5,),
                                Text('Under 200'),
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MensScreen(),));
                          },
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
                                  child:Image(image: AssetImage('assets/cloth3.jpg'),fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Text('Under ₹400'),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FootwareScreen(),));
                          },
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
                                  child: Image(image: AssetImage('assets/cloth4.jpg'),fit: BoxFit.fill),
                                ),
                                SizedBox(height: 5,),
                                Text('Under ₹500'),
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BeautyScreen(),));
                          },
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
                                  child:Image(image: AssetImage('assets/cloth5.jpg'),fit: BoxFit.fill,),
                                ),
                                SizedBox(height: 5,),
                                Text('Under ₹300'),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PerfumScreen(),));
                          },
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
                                  child: Image(image: AssetImage('assets/cloth6.jpg'),fit: BoxFit.fill),
                                ),
                                SizedBox(height: 5,),
                                Text('Under ₹650'),
                              ],
                            ),
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
      ),
    );
  }
}
