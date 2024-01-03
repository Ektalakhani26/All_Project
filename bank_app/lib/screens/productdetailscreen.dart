import 'package:bank_app/screens/add_favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DB_Helper/db_helper.dart';

class ProductDetail1  extends StatefulWidget {
  var productdetail;

  ProductDetail1 ({Key? key, required  this.productdetail}) : super(key: key);

  @override
  State<ProductDetail1> createState() => _ProductDetail1State(productdetail);
}

class _ProductDetail1State extends State<ProductDetail1 > {
  var productdetail;
  var qty =1;
  _ProductDetail1State(this.productdetail);
  List<Map<String, dynamic>> _journals = [];
  bool fav = false;
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

                  });
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                },
                child: Icon(Icons.favorite,color:Colors.grey)),
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
                Text('${productdetail.bname}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                SizedBox(width: 10,),
                Text('${productdetail.subtitle}',style: TextStyle(fontSize: 20)),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text('${productdetail.amount}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
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
                  Expanded(child: Text('7+ years purchesing customer product',style: TextStyle(fontSize: 15))),
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
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => FavoriteScreen(),));
                      }, child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.favorite,color: Colors.pink),
                        Expanded(child: Text('WISHLISTED',style: TextStyle(color: Colors.black))),
                      ],
                    ),
                  )),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child : ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                      onPressed: () async {
                        await _addcartItem();
                      }, child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        Expanded(child: Text('ADD TO CART')),
                      ],
                    ),
                  )),
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
