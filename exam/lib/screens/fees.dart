
import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';

class Fee extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FeesPage();
}

class FeesPage extends State<Fee> {
  TextEditingController paycontroller = TextEditingController();
  Razorpay razorpay = Razorpay();

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('******${response.paymentId}');
    FirebaseApi.addFees(
      studentKey: profile1['key'],
      amount: paycontroller.text,
      studentName: profile1['Name'],
    ).then((value) {
      FirebaseApi.getFees().then((value) {});
    });
    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }



  @override
  void initState() {
    super.initState();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            arrowback,
            color: white,
          ),
        ),
        title: Text(fees, style: TextStyle(color: white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: blue, width: 1.0),
                    color: white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  color: blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(Total,
                                              style: TextStyle(
                                                  color: white, fontSize: 14)),
                                          Text(Ammount,
                                              style: TextStyle(
                                                  color: white, fontSize: 14)),
                                          Text(
                                            profile1['fees'] ?? '0',
                                            style: TextStyle(color: white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 120,
                                  width: 70,
                                  color: org,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(Paid,
                                              style: TextStyle(
                                                  color: white, fontSize: 14)),
                                          Text(Ammount,
                                              style: TextStyle(
                                                  color: white, fontSize: 14)),
                                          Text(
                                            FirebaseApi.paidFees,
                                            style: TextStyle(color: white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 120,
                                  width: 70,
                                  color: blue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(Remain,
                                              style: TextStyle(
                                                  color: white, fontSize: 14)),
                                          Text(Ammount,
                                              style: TextStyle(
                                                  color: white, fontSize: 14)),
                                          Text(
                                            '${int.parse(profile1['fees'] ?? '0') - int.parse(FirebaseApi.paidFees)}',
                                            style: TextStyle(color: white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 40,
                color: blue,
                onPressed: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (context) => SimpleDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              contentPadding: EdgeInsets.all(50.0),
                              insetPadding: EdgeInsets.symmetric(
                                vertical: 120,
                              ),
                              children: [
                                Column(
                                  children: [
                                    TextFormField(
                                      controller: paycontroller,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: black),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10.0),
                                              topLeft: Radius.circular(10.0),
                                              bottomLeft: Radius.circular(10.0),
                                              bottomRight:
                                                  Radius.circular(10.0),
                                            ),
                                          ),
                                          hintText: enteramt),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      minWidth:
                                          MediaQuery.of(context).size.width / 3,
                                      height: 40,
                                      color: blue,
                                      onPressed: () {
                                        Navigator.pop(context);
                                        // FirebaseApi
                                        //         .allFeesList[profile1['fees']]
                                        //     ['key'];
                                        razorpay.open({
                                          'key': 'rzp_test_oJIEja6mh1WovB',
                                          'amount':
                                              int.parse(paycontroller.text) *
                                                  100,
                                          'name': 'Jinal',
                                          'description': 'Fees',
                                          'prefill': {
                                            'contact': '8511516706',
                                            'email': 'jinalg98@gmail.com'
                                          }
                                        });
                                      },
                                      child: Text(
                                        Submit,
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                  });
                },
                child: Text(
                  processtopay,
                  style: TextStyle(
                    color: white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              Divider(
                thickness: 3,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
