
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myntra/Shopping/favorite_screen.dart';

import '../DBHelper/DB_Helper.dart';
import 'cashondeleviery/CashPayment.dart';

class ProductDetail extends StatefulWidget {
  var productdetail;

   ProductDetail({Key? key, required  this.productdetail}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState(productdetail);
}

class _ProductDetailState extends State<ProductDetail> {

  List<Map<String, dynamic>> _journals = [];
  List<Map<String, dynamic>> _journals1 = [];

  void _refreshJournals() async {
    final data = await SQLHelper.favoritegetItems();
    setState(() {
      _journals = data;
      print('data : $data');
    });
  }
  void _refreshJournals1() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals1 = data;
      print('data : $data');
    });
  }
  var qty = 1;
  List<Size1> clothsize = [];
  var defaultsize = 'XS';
  var index = 2;
  get ab => clothsize[index].size1;
  @override
  void initState() {

    clothsize.add(Size1('XS'));
    clothsize.add(Size1('S'));
    clothsize.add(Size1('M'));
    clothsize.add(Size1('L'));
    clothsize.add(Size1('XL'));
    _refreshJournals();
    _refreshJournals1();
    // TODO: implement initState
    super.initState();
  }


  var productdetail;
  _ProductDetailState(this.productdetail);
  int selectedindex = 0;

  Future<void> _addItem() async {
    await SQLHelper.favoriteItem(
        productdetail.bname,productdetail.subtitle,
        productdetail.amount,productdetail.description,productdetail.img);
    _refreshJournals();
  }
  Future<void> _addcartItem() async {
    await SQLHelper.createItem(
        productdetail.bname,productdetail.subtitle,
        productdetail.amount,productdetail.discount,productdetail.description,defaultsize,qty,productdetail.img);
    _refreshJournals();
  }
  bool like = false;
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
                child: Icon(Icons.favorite,color: like ? Colors.red : Colors.grey,)),
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
              //  SizedBox(width: 10,),
                Expanded(child: Text('${productdetail.subtitle}')),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text('Size:',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                  SizedBox(width: 10,),
                  Text('${defaultsize}',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),

        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Wrap(
            direction: Axis.horizontal,
            children: List.generate(5, (index){
              return Container(
                height: size.height/15,
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(selectedindex == index ? Colors.blue : Colors.white)),
                  onPressed: () {
                    setState(() {
                      selectedindex=index;
                      if(selectedindex==0){defaultsize="XS";}
                      if(selectedindex==1){defaultsize="S";}
                      if(selectedindex==2){defaultsize="M";}
                      if(selectedindex==3){defaultsize="L";}
                      if(selectedindex==4){defaultsize="XL";}
                    });
                  }, child: Text('${clothsize[index].size1}',style: TextStyle(color: Colors.black)),

                ),
              );
            }),
          ),
        ),

            SizedBox(height: 20,),
            Container(
              height: size.height/17,
              child: Padding(
                padding:  EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.recycling),
                    Text('Find Your Size',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
              color: Colors.black12,
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink.shade200)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CashPaymentScreen(),));
                  }, child: Padding(
                    padding: const EdgeInsets.all(17.0),
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
                    onPressed: isButtonTapped
                        ? null // Disable the button if it's already tapped
                        : () {
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

class Size1{
  var size1;

  Size1(this.size1);
}