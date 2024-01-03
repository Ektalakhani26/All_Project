import 'package:flutter/material.dart';
import 'package:myntra/Pages/ProductDetail1.dart';

import '../../Shopping/favorite_screen.dart';
import '../../model.dart';
import '../ProductDetail.dart';

class PerfumScreen extends StatefulWidget {
  const PerfumScreen({Key? key}) : super(key: key);

  @override
  State<PerfumScreen> createState() => _PerfumScreenState();
}

class _PerfumScreenState extends State<PerfumScreen> {

  List<Product> productlist = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    productlist.add(Product('assets/perfum/perfum1.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/perfum/perfum2.jpg', 'Rigo', 'Floaral Print Tie-Up Neck', '687 ','14', 'Best Price ₹562 with coupon'));
    productlist.add(Product('assets/perfum/perfum3.jpg', 'Pannkh', 'Women Printed Empire Top', '296 ','73', 'Best Price ₹242 with coupon'));
    productlist.add(Product('assets/perfum/perfum4.jpg', 'Karatcart', 'Solid Regular Top', '293 ','51', 'Best Price ₹240 with coupon'));
    productlist.add(Product('assets/perfum/perfum5.jpg', 'Cover Story', 'Typography Printed Top', '594 ','14', 'Best Price ₹486 with coupon'));
    productlist.add(Product('assets/perfum/perfum6.jpg', 'Mango', 'Women Brand Logo Top', '623','30', 'Best Price ₹510 with coupon'));
    productlist.add(Product('assets/perfum/perfum7.jpg', 'Mayra', 'Ethnic Modifs V-Neck Blouson', '398 ','60', 'Best Price ₹326 with coupon'));
    productlist.add(Product('assets/perfum/perfum8.jpg', 'ether', 'Cotton Tank Top', '386 ','57', 'Best Price ₹316 with coupon'));
    productlist.add(Product('assets/perfum/perfum9.jpg', 'Sassafras', 'High-Neck Top', '379 ','62', 'Best Price ₹310 with coupon'));
    productlist.add(Product('assets/perfum/perfum10.jpg', 'Miss Chase', 'Striped Top', '425 ','63', 'Best Price ₹348 with coupon'));
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context ),
          child: Icon(Icons.arrow_back,color: Colors.black,),
        ),
        title: Text('ONLINE FASHION STORE',style: TextStyle(color: Colors.black)),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(),));
              },
              child: Icon(Icons.favorite,color: Colors.red,)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/freeshipping.jpeg')),
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetail1(productdetail: productlist[index]),));
                      print('index = ${index}');
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
                                  Text('₹${productlist[index].amount}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
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
