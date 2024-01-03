import 'package:flutter/material.dart';
import 'package:myntra/DBHelper/DB_Helper.dart';
import 'package:myntra/Pages/cashondeleviery/OrderConform.dart';

class CashPaymentScreen extends StatefulWidget {
  var cartdata;
   CashPaymentScreen({Key? key,this.cartdata}) : super(key: key);

  @override
  State<CashPaymentScreen> createState() => _CashPaymentScreenState(cartdata);
}

class _CashPaymentScreenState extends State<CashPaymentScreen> {
  var formKey = GlobalKey<FormState>();
  var cartdata;
  _CashPaymentScreenState(this.cartdata);

  _deleteItem(int id) async{
    await SQLHelper.deleteItem(id);
    setState(() {

    });
  }
  bool isButtonTapped = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.delivery_dining,color: Colors.black,size: 30),
          title: Text('Cash On Delivery',style: TextStyle(color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20,),
              Image(image: AssetImage('assets/freedelivery.jpg')),
              SizedBox(height: 20,),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 20,),
                  Icon(Icons.location_on_outlined,size: 30),
                  SizedBox(width: 20,),
                  Text('Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return  'enter the value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('House no./Buding name'),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return  'enter the value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('Road Name / Area / Colony'),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return  'enter the value';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text('City'),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    var mno=value;
                    if(mno==null || mno.isEmpty){
                      return 'enter the value';
                    }
                    else if(mno.length != 10){
                      return 'please enter 10 digit';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    label: Text('Contact Number'),
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(double.maxFinite,double.infinity))),onPressed: () async {
                if(formKey.currentState!.validate()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConformScreen(cartdata: cartdata),));
                }
                for(int i=0;i<=cartdata.length;i++){
                 await _deleteItem(cartdata[i]['id']);
                }
              }, child: Text('Save An Continue')),
            ],
          ),
        ),
      ),
    );
  }
}
