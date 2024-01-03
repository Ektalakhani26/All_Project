
import 'package:flutter/material.dart';
import 'package:myntra/Bottom%20Navigationbar/bottomNavigation.dart';

import '../model.dart';
import 'ProductDetail.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  List<Product> productlist = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    productlist.add(Product('assets/brand/brand1.jpg', 'Bebe', 'Ethnic Motifs Top', '389 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/brand/brand2.jpg', 'Rigo', 'Floaral Print Tie-Up Neck', '687 ','14', 'Best Price ₹562 with coupon'));
    productlist.add(Product('assets/brand/brand13.jpg', 'Pannkh', 'Women Printed Empire Top', '296 ', '73','Best Price ₹242 with coupon'));
    productlist.add(Product('assets/brand/brand14.jpg', 'Karatcart', 'Solid Regular Top', '293 ','51', 'Best Price ₹240 with coupon'));
    productlist.add(Product('assets/brand/brand5.jpg', 'Cover Story', 'Typography Printed Top', '594 ','14', 'Best Price ₹486 with coupon'));
    productlist.add(Product('assets/brand/brand6.jpg', 'Mango', 'Women Brand Logo Top', '623 ','30', 'Best Price ₹510 with coupon'));
    productlist.add(Product('assets/brand/brand7.jpg', 'Mayra', 'Ethnic Modifs V-Neck Blouson', '398 ','60', 'Best Price ₹326 with coupon'));
    productlist.add(Product('assets/brand/brand8.jpg', 'ether', 'Cotton Tank Top', '386 ','57', 'Best Price ₹316 with coupon'));
    productlist.add(Product('assets/brand/brand9.jpg', 'Sassafras', 'High-Neck Top', '379','62', 'Best Price ₹310 with coupon'));
    productlist.add(Product('assets/brand/brand10.jpg', 'Miss Chase', 'Striped Top', '425 ','60', 'Best Price ₹348 with coupon'));
    productlist.add(Product('assets/brand/brand11.jpg', 'Miss Chase', 'Striped Top', '425 ','63', 'Best Price ₹348 with coupon'));
    productlist.add(Product('assets/brand/brand12.jpg', 'Miss Chase', 'Striped Top', '425 ','50', 'Best Price ₹348 with coupon'));
    productlist.add(Product('assets/brand/brand3.jpg', 'Miss Chase', 'Striped Top', '425 ','10', 'Best Price ₹348 with coupon'));
    productlist.add(Product('assets/brand/brand4.jpg', 'Miss Chase', 'Striped Top', '425 ','15', 'Best Price ₹348 with coupon'));

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      bottomNavigationBar: MyFun.bottomNavigation(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(Icons.diamond_sharp,color: Colors.black,size: 30,),
        ),
        title: Text('Top Brands',style: TextStyle(color: Colors.black,fontSize: 25)),
      ),
       body : Column(
        children: [
          Image(image: AssetImage('assets/brand.jpeg')),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1.80 / 2.70,
                  //crossAxisSpacing: 20,
                  // mainAxisSpacing: 60
                ),
                itemCount: productlist.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(productdetail : productlist[index]),));
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
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${productlist[index].bname}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${productlist[index].subtitle}',style: TextStyle(color: Colors.black54)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text('₹${productlist[index].amount}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                                Text('${productlist[index].discount}% OFF',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('${productlist[index].description}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
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
