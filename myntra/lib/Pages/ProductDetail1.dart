import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/Pages/cashondeleviery/CashPayment.dart';
import 'package:myntra/model.dart';

import '../DBHelper/DB_Helper.dart';
import '../Shopping/favorite_screen.dart';

class ProductDetail1  extends StatefulWidget {
  var productdetail;

  ProductDetail1 ({Key? key, required  this.productdetail}) : super(key: key);

  @override
  State<ProductDetail1> createState() => _ProductDetail1State(productdetail);
}

class _ProductDetail1State extends State<ProductDetail1 > {
  var productdetail;
  _ProductDetail1State(this.productdetail);
  bool like = false;
  List<Map<String, dynamic>> _journals = [];
  bool fav = false;
  var qty = 1;
  void _refreshJournals() async {
    final data = await SQLHelper.favoritegetItems();
    setState(() {
      _journals = data;
      print('data : $data');
    });
  }
  @override
  void initState() {
    _refreshJournals();
    // TODO: implement initState
    super.initState();
  }
  Future<void> _addItem() async {
    await SQLHelper.favoriteItem(
        productdetail.bname,productdetail.subtitle,
        productdetail.amount,productdetail.description,productdetail.img);
    _refreshJournals();
  }
  Future<void> _addcartItem() async {
    await SQLHelper.createItem(
        productdetail.bname,productdetail.subtitle,
        productdetail.amount,productdetail.discount,productdetail.description,'',qty,productdetail.img);
    _refreshJournals();
  }
  bool isButtonTapped = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('${productdetail.bname}',style: TextStyle(color: Colors.black,fontSize: 25)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () async {

                  await _addItem();
                  setState(() {
                    like = !like;
                  });
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                },
                child: Icon(Icons.favorite,color:like ? Colors.red : Colors.grey,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: size.height/2,
                width: size.width*0.9,
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                child: Image(image: AssetImage('${productdetail.img}'),fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(child: Text('${productdetail.bname}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
                SizedBox(width: 10,),
                Expanded(child: Text('${productdetail.subtitle}',style: TextStyle(fontSize: 20))),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('₹${productdetail.amount}',style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold)),
                  Text('${productdetail.discount}% OFF',style: TextStyle(color: Colors.orange,fontSize: 15,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text('${productdetail.description}',style: TextStyle(color: Colors.teal,fontSize: 15,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20,),
            Container(
              height: 3,
              color: Colors.black38,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: size.height/20,
                    width: size.width*0.3,
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: Text('Top Brands',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white)),
                  ),
                  SizedBox(width: 10,),
                  Text('${productdetail.bname}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline,color: Colors.green,),
                  SizedBox(width: 10,),
                  Expanded(child: Text('75% positive rating from 10K+ customers',style: TextStyle(fontSize: 15))),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline,color: Colors.green,),
                  SizedBox(width: 10,),
                  Expanded(child: Text('10K+ recent orders from this brand',style: TextStyle(fontSize: 15))),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline,color: Colors.green,),
                  SizedBox(width: 10,),
                  Expanded(child: Text('7+ years on Myntra',style: TextStyle(fontSize: 15))),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 3,
              color: Colors.black38,
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink.shade300)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CashPaymentScreen(),));
                      }, child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('BUY NOW',style: TextStyle(color: Colors.black)),
                  )),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(350, 40)),
                      backgroundColor: MaterialStatePropertyAll(
                        isButtonTapped ? Colors.grey : Colors.pink,
                      ),
                      // Disable the button if it's tapped
                      overlayColor: MaterialStatePropertyAll(Colors.transparent),
                      // Remove the ripple effect
                    ),
                    onPressed: isButtonTapped ? null : () {
                      _addcartItem();
                      setState(() {
                        isButtonTapped = true; // Mark the button as tapped
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text('Style Note : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Text('Give Yourself a Fashion makeover with this classy three-quarter top from ${productdetail.bname}.'
                  ' Pair this navy blue piece with slim jens and a sling bag for a casual day look',
                style: TextStyle(fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}
