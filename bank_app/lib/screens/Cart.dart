import 'package:bank_app/delivery/address.dart';
import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

import '../DB_Helper/db_helper.dart';


class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  List<Map>? addtocart = [];

  // void _Addtocart() async {
  //   final data = await SQLHelper.getItems();
  //   setState(() {
  //     addtocart = data;
  //   });
  // }
  void _Addtocart() async {
    final data = await SQLHelper.getItems();
    setState(() {
      addtocart = data.map((map) => Map.from(map)).toList();
      print(addtocart);
    });
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted Product'),
    ));
    _Addtocart();
  }

  @override
  void initState() {
    _Addtocart();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int totalamount(){
      int sum = 0;
      int tmp = 0, tmp2 = 0;
      for(var i=0;i<addtocart!.length;i++){
        tmp = int.parse(addtocart![i]['price']);
        tmp2 = addtocart![i]['qty'];
        sum = sum + tmp * tmp2;
      }
      return sum;
    }
    double totaldiscount(){
      double sum1 = 0;
      for(var i=0;i<addtocart!.length;i++){
        sum1 += int.parse(addtocart![i]['price']) *  addtocart![i]['qty'] * (int.parse(addtocart![i]['discount'])/100);
      }
      return sum1;
    }

    var finaltotal = totalamount() - totaldiscount();
    return Scaffold(
      // bottomNavigationBar: MyFun.bottomNavigation(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.black,size: 30,)),
        title: Text('Add To Cart',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      ),
      body: Container(
        height: size.height,
        width: size.width,
       // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/back2.jpg'),fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addtocart?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: size.width,
                        height: size.height/5,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          children: [
                            Container(
                              child: Image(image: AssetImage('${addtocart![index]["image"]}'),fit: BoxFit.fill,),
                              height: size.height/5,
                              width: size.width*0.49,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('${addtocart![index]["title"]}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('${addtocart![index]["subtitle"]}',style: TextStyle(color: Colors.black54)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('Size : ${addtocart![index]["size"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black54)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text('₹${addtocart![index]["price"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange))),
                                        Expanded(child: Text('${addtocart![index]["discount"]}% OFF',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange))),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text('${addtocart![index]["description"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                                            child: Text('Remove',style: TextStyle(color: Colors.black),),
                                            width: size.width*0.1,
                                            height: size.height/25,
                                            alignment: Alignment.center,
                                          ),
                                          onTap: () {
                                            _deleteItem(addtocart![index]["id"]);
                                          },
                                        ),
                                      ),
                                      // SizedBox(width: 10,),
                                      InputQty(
                                        btnColor1: Colors.black,
                                        minusBtn: Icon(Icons.remove_circle),
                                        plusBtn: Icon(Icons.add_circle),
                                        textFieldDecoration: InputDecoration(border: InputBorder.none),
                                        initVal: addtocart![index]['qty'],
                                       // borderShape: BorderShapeBtn.circle,
                                        boxDecoration: BoxDecoration(),
                                        // steps: 10,
                                        onQtyChanged: (val) {
                                          addtocart?[index]['qty']= val;
                                          setState(() {
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                  //  decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/back2.jpg'))),
                    height: size.height/4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        Text('Product detail'),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Container(
                            //height: size.height/16,
                            width: size.width*0.90,
                            decoration: BoxDecoration(border: Border.all(color: Colors.black54),borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Text('Total Price'),
                                    ),
                                    Text('₹${totalamount().toString()}'),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Total Discount'),
                                    Text('- ₹${totaldiscount().toString()}'),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Text('Delivery'),
                                    ),
                                    Text('FREE',style: TextStyle(color: Colors.blue.shade600)),
                                  ],
                                ),
                                SizedBox(height: 20,),
                                Container(
                                  height: 3,
                                  width: size.width*0.8,
                                  color: Colors.black26,
                                ),
                                SizedBox(height: 20,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Total Payable',style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text('₹${finaltotal.toString()}',style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(double.maxFinite,double.infinity)))
                    ,child: const Text('Next'),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CashPaymentScreen(cartdata : addtocart),));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

