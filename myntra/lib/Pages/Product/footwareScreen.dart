import 'package:flutter/material.dart';

import '../../Shopping/favorite_screen.dart';
import '../../model.dart';
import '../ProductDetail.dart';
import '../ProductDetail1.dart';

class FootwareScreen extends StatefulWidget {
  const FootwareScreen({Key? key}) : super(key: key);

  @override
  State<FootwareScreen> createState() => _FootwareScreenState();
}

class _FootwareScreenState extends State<FootwareScreen> {

  List<Product> productlist = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    productlist.add(Product('assets/foot/foot1.jpg', 'Denill', 'Women Caual Sneakers', '449 ', '50','Best Price ₹318 with coupon'));
    productlist.add(Product('assets/foot/foot2.jpg', 'DressBerry', 'Women Open Toe Flats', '687 ', '14','Best Price ₹562 with coupon'));
    productlist.add(Product('assets/foot/foot3.jpg', 'ShoesStail', 'Bridal Musel', '999', '73','Best Price ₹550 with coupon'));
    productlist.add(Product('assets/foot/foot4.jpg', 'DressBerry', 'Women Open Toe Flats', '569','51', 'Best Price ₹240 with coupon'));
    productlist.add(Product('assets/foot/foot5.jpg', 'Aldo', 'Embelished Slim Sandals', '800 ', '50','Best Price ₹486 with coupon'));
    productlist.add(Product('assets/foot/foot6.jpg', 'Roadster', 'Lightweight Running Shoes', '623 ','30', 'Best Price ₹510 with coupon'));
    productlist.add(Product('assets/foot/foot7.jpg', 'Red Tape', 'Men Walking Dhoes', '550 ','60', 'Best Price ₹326 with coupon'));
    productlist.add(Product('assets/foot/foot8.jpg', 'Adiver', 'Branded Mojadi', '650','57', 'Best Price ₹316 with coupon'));
    productlist.add(Product('assets/foot/foot9.jpg', 'Sassafras', 'Embelished Slim Sandals', '500','62', 'Best Price ₹310 with coupon'));
    productlist.add(Product('assets/foot/foot10.jpg', 'Shoetopia', 'Men Sneakers', '719','63', 'Best Price ₹348 with coupon'));
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
