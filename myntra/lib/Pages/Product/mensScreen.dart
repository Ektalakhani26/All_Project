import 'package:flutter/material.dart';

import '../../Shopping/favorite_screen.dart';
import '../../model.dart';
import '../ProductDetail.dart';

class MensScreen extends StatefulWidget {
  const MensScreen({Key? key}) : super(key: key);

  @override
  State<MensScreen> createState() => _MensScreenState();
}

class _MensScreenState extends State<MensScreen> {

  List<Product> productlist = [];


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    productlist.add(Product('assets/mens/men1.jpg', 'Roadster', 'Pure Cotton T-shirtp', '274 ','45', 'Best Price ₹191 with coupon'));
    productlist.add(Product('assets/mens/men2.jpg', 'V-mart', 'Men Stretchable Cargo', '728 ','73', 'Best Price ₹589 with coupon'));
    productlist.add(Product('assets/mens/men3.jpg', 'boohooMAN', 'Corduroy Tailored Jacket', '900 ','73', 'Best Price ₹242 with coupon'));
    productlist.add(Product('assets/mens/men4.jpg', 'Tommy Hilfiger', 'full sleeves Caual Shirt', '780 ','51', 'Best Price ₹240 with coupon'));
    productlist.add(Product('assets/mens/men5.jpg', 'Mango MAN', 'Cotton Sustainable T-Shirt', '693 ','14', 'Best Price ₹486 with coupon'));
    productlist.add(Product('assets/mens/men6.jpg', 'Levis', 'Men Typography Printed T-shirt', '549 ', '50','Best Price ₹444 with coupon'));
    productlist.add(Product('assets/mens/men7.jpg', 'Mayra', 'Ethnic Modifs V-Neck Blouson', '274 ','60', 'Best Price ₹326 with coupon'));
    productlist.add(Product('assets/mens/men8.jpg', 'ether', 'Cotton Tank T-shirt', '555 ','57', 'Best Price ₹316 with coupon'));
    productlist.add(Product('assets/mens/men9.jpg', 'Calvin Klein Jens', 'Men Straight Fit Jens', '999 ','62', 'Best Price ₹800 with coupon'));
    productlist.add(Product('assets/mens/men10.jpg', 'U.S Polo Assn.', 'Men Slim Fit Chinos', '850 ','30', 'Best Price ₹600 with coupon'));
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
