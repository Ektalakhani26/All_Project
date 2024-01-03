import 'package:flutter/material.dart';

class TopGames extends StatelessWidget {
  const TopGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back,size: 30,color: Colors.white),
                  Container(
                    padding: EdgeInsets.only(right: 100),
                      child: Text('Top-rated games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white))
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search,size: 30,color: Colors.white,)
                  ),
                ],
              ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              children: [
                SizedBox(
                    width: 10,
                ),
                Container(
                    child: Image(image: AssetImage('assets/p26.jpg'))),
                SizedBox(
                  width: 10,
                ),
                Container(
                    child: Image(image: AssetImage('assets/p30.jpg'))),
                SizedBox(
                  width: 10,
                ),
                Image(image: AssetImage('assets/p28.jpg')),
                SizedBox(
                  width: 10,
                ),
                Image(image: AssetImage('assets/p29.jpg')),
                SizedBox(
                  width: 10,
                ),
                Image(image: AssetImage('assets/p30.jpg')),
              ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                    height: 70,
                    child: Image(image: AssetImage('assets/puzzle.jpg')),
                ),
                SizedBox(
                    width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jigsawscapes - jigsaw Puzzles',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * jigsaw * Casual * offline',style: TextStyle(color: Colors.white38),),
                    Text('4.4* 58MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p31.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p32.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p33.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p34.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p35.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p36.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p37.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Talking Tom Gold Run',style: TextStyle(color: Colors.white),),
                    Text('Action * Runner * Arcade * Offline',style: TextStyle(color: Colors.white38),),
                    Text('4.2* 102MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p38.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p39.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p40.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p41.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p42.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p43.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event Twins: Design & Blast',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * pair matching * casual * Offline',style: TextStyle(color: Colors.white38),),
                    Text('114MB\t\tEarly Access',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p45.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p44.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p46.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p47.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p48.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p49.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Cafe Shop : Cokking Games',style: TextStyle(color: Colors.white),),
                    Text('Simulation * Time management * casual',style: TextStyle(color: Colors.white38),),
                    Text('4.4*\t\t98MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 110,
                      height: 140,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p50.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p51.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p52.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p53.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p54.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p55.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marge Block Puzzles',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * Mearge * casual * Offline',style: TextStyle(color: Colors.white38),),
                    Text('3.9*\t\t41MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Stylized extends StatelessWidget {
  const Stylized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back,size: 30,color: Colors.white),
                Container(
                    padding: EdgeInsets.only(right: 100),
                    child: Text('Stylized games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white))
                ),
                Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.search,size: 30,color: Colors.white,)
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/p26.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/p30.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage('assets/p28.jpg')),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage('assets/p29.jpg')),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage('assets/p30.jpg')),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/puzzle.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jigsawscapes - jigsaw Puzzles',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * jigsaw * Casual * offline',style: TextStyle(color: Colors.white38),),
                    Text('4.4* 58MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p31.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p32.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p33.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p34.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p35.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p36.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p37.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Talking Tom Gold Run',style: TextStyle(color: Colors.white),),
                    Text('Action * Runner * Arcade * Offline',style: TextStyle(color: Colors.white38),),
                    Text('4.2* 102MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p38.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p39.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p40.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p41.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p42.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p43.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event Twins: Design & Blast',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * pair matching * casual * Offline',style: TextStyle(color: Colors.white38),),
                    Text('114MB\t\tEarly Access',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p45.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p44.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p46.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p47.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p48.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p49.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Cafe Shop : Cokking Games',style: TextStyle(color: Colors.white),),
                    Text('Simulation * Time management * casual',style: TextStyle(color: Colors.white38),),
                    Text('4.4*\t\t98MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 110,
                      height: 140,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p50.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p51.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p52.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p53.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p54.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p55.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marge Block Puzzles',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * Mearge * casual * Offline',style: TextStyle(color: Colors.white38),),
                    Text('3.9*\t\t41MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Offline extends StatelessWidget {
  const Offline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back,size: 30,color: Colors.white),
                Container(
                    padding: EdgeInsets.only(right: 100),
                    child: Text('Offline games',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color: Colors.white))
                ),
                Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.search,size: 30,color: Colors.white,)
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/p26.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      child: Image(image: AssetImage('assets/p30.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage('assets/p28.jpg')),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage('assets/p29.jpg')),
                  SizedBox(
                    width: 10,
                  ),
                  Image(image: AssetImage('assets/p30.jpg')),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/puzzle.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jigsawscapes - jigsaw Puzzles',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * jigsaw * Casual * offline',style: TextStyle(color: Colors.white38),),
                    Text('4.4* 58MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p31.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p32.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p33.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p34.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p35.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 200,
                      color: Colors.blue,
                      child: Image(image: AssetImage('assets/p36.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p37.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Talking Tom Gold Run',style: TextStyle(color: Colors.white),),
                    Text('Action * Runner * Arcade * Offline',style: TextStyle(color: Colors.white38),),
                    Text('4.2* 102MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p38.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p39.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p40.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p41.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p42.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p43.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event Twins: Design & Blast',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * pair matching * casual * Offline',style: TextStyle(color: Colors.white38),),
                    Text('114MB\t\tEarly Access',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p45.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p44.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p46.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p47.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 250,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p48.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p49.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('My Cafe Shop : Cokking Games',style: TextStyle(color: Colors.white),),
                    Text('Simulation * Time management * casual',style: TextStyle(color: Colors.white38),),
                    Text('4.4*\t\t98MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 110,
                      height: 140,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p50.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p51.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p52.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p53.jpg'))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.white,
                      child: Image(image: AssetImage('assets/p54.jpg'))),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  //width: 100,
                  height: 70,
                  child: Image(image: AssetImage('assets/p55.jpg')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marge Block Puzzles',style: TextStyle(color: Colors.white),),
                    Text('Puzzle * Mearge * casual * Offline',style: TextStyle(color: Colors.white38),),
                    Text('3.9*\t\t41MB',style: TextStyle(color: Colors.white38),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//=====================TOP charts=============================================================
//============================================================================================
//============================================================================================
//===========================================================================================
class TopChats extends StatelessWidget {
  const TopChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.search),
                      Container(
                        //padding: EdgeInsets.only(right: 200),
                        child: Text('Search for app', style: TextStyle(color: Colors.black38)),
                      ),
                      Icon(Icons.mic,color: Colors.black),
                    ],
                  ),
                ),
                Icon(Icons.save,color: Colors.white,),
                Stack(
                  children:[
                    CircleAvatar(
                      maxRadius: 20,
                      minRadius: 20,
                      backgroundImage: AssetImage('assets/ekta2.jpg'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap:() {

                  },
                  child:Text('For you',style: TextStyle(color: Colors.white),),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TopChats(),));
                  },
                  child: Text('Top charts',style: TextStyle(color: Colors.white),),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Kids(),));
                  },
                  child: Text('Kids',style: TextStyle(color: Colors.white),),
                ),
                Text('Events',style: TextStyle(color: Colors.white),),
                Text('Premium',style: TextStyle(color: Colors.white),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Top Free'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 30,
                  margin: EdgeInsets.only(right: 100),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Top Free',style: TextStyle(color: Colors.white54,fontWeight: FontWeight.w900)),
                      Icon(Icons.arrow_drop_down,color: Colors.white54),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('1.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/p1.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('JioCinema:TATA IPL & more',style: TextStyle(color: Colors.white)),
                    Text('Entertainment * Streaming Content',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Icon(Icons.download_done,color: Colors.white54),
                        Text('Installed',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text('2.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  //padding: EdgeInsets.only(left: 50),
                  child: Image(image: AssetImage('assets/instra.jpg')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Instragram',style: TextStyle(color: Colors.white)),
                    Text('Social * Networking',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Icon(Icons.download_done,color: Colors.white54),
                        Text('Installed',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('3.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/jio.jpg')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('JioTV',style: TextStyle(color: Colors.white)),
                    Text('Entertainment * Streaming Content',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Text('3.5*   18MB',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text('4.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/facebook.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Facebook',style: TextStyle(color: Colors.white)),
                    Text('Social * Networking',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        //Icon(Icons.download_done,color: Colors.white54),
                        Text('4.1*   71MB',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('5.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/flip.jpg')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Flipkart Online Shopping App',style: TextStyle(color: Colors.white)),
                    Text('shopping * Online marketplace',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        //Icon(Icons.download_done,color: Colors.white54),
                        Text('4.3*   17MB',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('6.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/mesho.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Meesho: Online Shopping App',style: TextStyle(color: Colors.white)),
                    Text('Shopping * Online marketplace',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        //Icon(Icons.download_done,color: Colors.white54),
                        Text('4.3*  12MB',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('7.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/what.jpg')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('WhatsApp Messenger',style: TextStyle(color: Colors.white)),
                    Text('Communication * Messaging &viedo',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Icon(Icons.download_done,color: Colors.white54),
                        Text('Installed',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('8.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/snap.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Snapchat',style: TextStyle(color: Colors.white)),
                    Text('Communication * Messaging& viedo',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Icon(Icons.download_done,color: Colors.white54),
                        Text('Installed',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('9.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/pe.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PhonePe UPI, Payment, Recharge',style: TextStyle(color: Colors.white)),
                    Text('Finance * Digital wallets',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                       // Icon(Icons.download_done,color: Colors.white54),
                        Text('4.4*  34MB',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('10.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/caller.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hotstar',style: TextStyle(color: Colors.white)),
                    Text('Entertainment * Streaming Content',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                       // Icon(Icons.download_done,color: Colors.white54),
                        Text('4.0*  16MB Editor Choice',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text('11.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/pay.png')),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Paytm: Secure UPI Payments',style: TextStyle(color: Colors.white)),
                    Text('Finance * Digital wallets',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Icon(Icons.download_done,color: Colors.white54),
                        Text('Installed',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text('12.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900)),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Image(image: AssetImage('assets/caller.png')),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Truecaller: Caller ID & Block',style: TextStyle(color: Colors.white)),
                    Text('Commuction * call management',style: TextStyle(color: Colors.white54)),
                    Row(
                      children: [
                        Icon(Icons.download_done,color: Colors.white54),
                        Text('Installed',style: TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//================================ Kids=================================================
//=====================================================================================
//====================================================================================
//=====================================================================================

class Kids extends StatelessWidget {
  const Kids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.search),
                    Container(
                      //padding: EdgeInsets.only(right: 200),
                      child: Text('Search for app', style: TextStyle(color: Colors.black38)),
                    ),
                    Icon(Icons.mic,color: Colors.black),
                  ],
                ),
              ),
              Icon(Icons.save,color: Colors.white,),
              Stack(
                children:[
                  CircleAvatar(
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundImage: AssetImage('assets/ekta2.jpg'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap:() {

                },
                child:Text('For you',style: TextStyle(color: Colors.white),),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TopChats(),));
                },
                child: Text('Top charts',style: TextStyle(color: Colors.white),),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Kids(),));
                },
                child: Text('Kids',style: TextStyle(color: Colors.white),),
              ),
              Text('Events',style: TextStyle(color: Colors.white),),
              Text('Premium',style: TextStyle(color: Colors.white),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Image(image: AssetImage('assets/teach.jpg')),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(color: Colors.green.shade400,borderRadius: BorderRadius.circular(10)),
            child: Text('Learn More',style: TextStyle(fontWeight: FontWeight.w900)),
            alignment: Alignment.center,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 30),
              child: Text('Browse by age',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 20),)),
          Container(

          ),
        ],
      ),
    );
  }
}




