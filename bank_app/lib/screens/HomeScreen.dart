
import 'package:bank_app/screens/Cart.dart';
import 'package:bank_app/screens/productdetailscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../BottomNavigationBar/BottomNavigationbar.dart';
import '../model.dart';
import 'add_favorite.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> productlist = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    productlist.add(Product('assets/jewellery/neck1.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck2.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck3.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck4.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck5.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck6.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck7.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck8.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck9.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck10.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck11.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck12.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck13.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/jewellery/neck14.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: MyFun.bottomNavigation(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            minRadius: 15,
            maxRadius: 20,
            backgroundImage: AssetImage('assets/logoj.jpg'),
          ),
        ),
        title: Text('Jewellery Shop',style: TextStyle(color: Colors.black,fontSize: 25)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                },
                child: Icon(Icons.favorite,color: Colors.red)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCart(),));
                },
                child: Icon(Icons.add_shopping_cart,color: Colors.black)),
          ),
        ],
      ),
      body : Column(
        children: [
          SizedBox(height: 10,),
          CarouselSlider(
            items: [
              Container(
                width: size.width*0.9,
                height: size.height/5,
                child: Image(image: AssetImage('assets/jewellery.jpg'),fit: BoxFit.fill,),
              ),

              Container(
                width: size.width*0.9,
                height: size.height/5,
                // color: Colors.deepOrange,
                child: Image(image: AssetImage('assets/jewellery3.jpg'),fit: BoxFit.fill),
              ),

              Container(
                width: size.width*0.9,
                height: size.height/5,
                child: Image(image: AssetImage('assets/jewellery2.jpg'),fit: BoxFit.fill),
              ),

              Container(
                width: size.width*0.9,
                height: size.height/5,
                child: Image(image: AssetImage('assets/jewellery1.jpg'),fit: BoxFit.fill),
              ),

              Container(
                width: size.width*0.9,
                height: size.height/5,
                child: Image(image: AssetImage('assets/jewellery3.jpg'),fit: BoxFit.fill),
              ),
            ],
            options: CarouselOptions(

              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 900),
              //  viewportFraction: 0.8,
            ),),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.80 / 3,
                  //crossAxisSpacing: 20,
                  // mainAxisSpacing: 60
                ),
                itemCount: productlist.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail1(productdetail : productlist[index]),));
                      //print('index = ${index}');
                    },
                    child: Container(
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Image(image: AssetImage('${productlist[index].img}'),fit: BoxFit.fill,),
                            height: size.height/5,
                            width: size.width*0.49,
                          ),
                          SizedBox(height: 10,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${productlist[index].bname}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${productlist[index].subtitle}',style: TextStyle(color: Colors.black54)),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text('${productlist[index].amount}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                                  Text('${productlist[index].discount}% OFF',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${productlist[index].description}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
