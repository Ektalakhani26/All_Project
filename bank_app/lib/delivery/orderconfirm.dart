import 'dart:async';

import 'package:animated_background/particles.dart';
import 'package:bank_app/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import '../BottomNavigationBar/BottomNavigationbar.dart';

class OrderConfirm extends StatefulWidget {
  var cartdata;
   OrderConfirm({Key? key, this.cartdata}) : super(key: key);

  @override
  State<OrderConfirm> createState() => _OrderConfirmState(cartdata);
}

class _OrderConfirmState extends State<OrderConfirm> with TickerProviderStateMixin{
  late AnimationController scaleController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);
  var cartdata;
  _OrderConfirmState(this.cartdata);
  @override
  void initState() {
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();

    Timer(Duration(seconds: 5) , () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );
  @override
  Widget build(BuildContext context) {
    double circleSize = 140;
    double iconSize = 108;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/background.jpg'),fit: BoxFit.cover)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Column(
                    children: [
                      ScaleTransition(
                        scale: scaleAnimation,
                        child: Container(
                          height: circleSize,
                          width: circleSize,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: SizeTransition(
                              sizeFactor: checkAnimation,
                              axis: Axis.horizontal,
                              axisAlignment: -1,
                              child: Center(
                                  child: Icon(Icons.check, color: Colors.white, size: iconSize)
                              )
                          ),
                        ),
                      ),
                      Text('Your Order Is Confirmed!',style: TextStyle(color: Colors.green.shade700,fontSize: 30,fontWeight: FontWeight.w700),)
                    ],
                  ),
                ),
             //   SizedBox(height: 25),

              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
