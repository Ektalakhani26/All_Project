import 'package:flutter/material.dart';

import '../../Shopping/favorite_screen.dart';
import '../../model.dart';
import '../ProductDetail.dart';

class KidsScreen extends StatefulWidget {
  const KidsScreen({Key? key}) : super(key: key);

  @override
  State<KidsScreen> createState() => _KidsScreenState();
}

class _KidsScreenState extends State<KidsScreen> {

  List<Product> productlist = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    productlist.add(Product('assets/kids/kids1.jpg', 'Raj Fancy Dresses', 'Unisex Kids Clothing Set', '779 ','61', 'Best Price ₹318 with coupon'));
    productlist.add(Product('assets/kids/kids2.jpg', 'H & M', 'Boys 2-Piece Sweatshirt Set', '599 ','14', 'Best Price ₹562 with coupon'));
    productlist.add(Product('assets/kids/kids3.jpg', 'Nike', 'Girls Wids Cargo Trousers', '779 ','73', 'Best Price ₹242 with coupon'));
    productlist.add(Product('assets/kids/kids4.jpg', 'Nap Chief', 'Kids Pure Cotton Set', '800 ','51', 'Best Price ₹240 with coupon'));
    productlist.add(Product('assets/kids/kids5.jpg', 'Cover Story', 'Typography Printed Top', '779 ','14', 'Best Price ₹486 with coupon'));
    productlist.add(Product('assets/kids/kids6.jpg', 'Mango', 'Flared-Skrit Dress', '500 ','30', 'Best Price ₹510 with coupon'));
    productlist.add(Product('assets/kids/kids7.jpg', 'Mayra', 'Cotton Casual Shirt', '399 ','60', 'Best Price ₹326 with coupon'));
    productlist.add(Product('assets/kids/kids8.jpg', 'ether', 'Cotton Tank Top', '296 ','57', 'Best Price ₹316 with coupon'));
    productlist.add(Product('assets/kids/kids9.jpg', 'Sassafras', 'Infants Cotton Bodysuit', '250 ','62', 'Best Price ₹310 with coupon'));
    productlist.add(Product('assets/kids/kids10.jpg', 'Miss Chase', 'Striped Top', '350 ','63', 'Best Price ₹348 with coupon'));
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetail(productdetail: productlist[index]),));
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
