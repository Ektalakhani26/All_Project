import 'package:flutter/material.dart';

import 'modelclass.dart';
import 'otherscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreenNew(),
    );
  }
}



class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);
  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  List<Model> listofstory = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    listofstory.add(Model('Aesop\'s', 'assets/aesop.jpg', 'Aesop\'s Fables, or the Aesopica, is a collection of fables credited to Aesop, a slave and storyteller who lived in ancient Greece between 620 and 564 BCE.', Colors.green));
    listofstory.add(Model('Panchatantra', 'assets/panch.jpg', 'The Panchatantra is an ancient Indian collection of interrelated animal fables in Sanskrit verse and prose, arranged within a frame story.', Colors.blue));
    listofstory.add(Model('BedTime', 'assets/bedtime.jpg', 'A bedtime story is a traditional form of storytelling, where a story is told to a child at bedtime to prepare the child for sleep. ',Colors.blueAccent));
    listofstory.add(Model('Aesop\'s', 'assets/aesop.jpg', 'Aesop\'s Fables, or the Aesopica, is a collection of fables credited to Aesop, a slave and storyteller who lived in ancient Greece between 620 and 564 BCE.',Colors.green));
    listofstory.add(Model('BedTime', 'assets/aesop.jpg', 'bedtime\'s Fables, or the Aesopica, is a collection of fables credited to Aesop, a slave and storyteller who lived in ancient Greece between 620 and 564 BCE.',Colors.green));
  }
  int currentpage=0;
  //int length=listofstory.length+1;
  PageController _pagecontrol = PageController();

  @override
  Widget build(BuildContext context) {

    Widget getindicator() {
      return Row(
        children: [
      for(int i=0;i<listofstory.length;i++)...[
        Padding(padding: EdgeInsets.all(5),
        child:  Container(
          width: (currentpage==i)?12:8,
          height: (currentpage==i)?12:8,
          decoration: BoxDecoration(
            color: (currentpage==i)? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),),
     ]
      ]
      );
    }
    return Scaffold(
      bottomSheet:Column(
       // crossAxisAlignment: CrossAxisAlignment.end,
      //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getindicator(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                TextButton(onPressed: () {
                  _pagecontrol.animateToPage(currentpage-1, duration: Duration(seconds: 1), curve: Curves.linear);
                }, child: (currentpage==0)?Text('Pervious',style: TextStyle(color: Colors.grey),) : Text('Perious')),
                TextButton(onPressed: () {
                  print('${currentpage}');
                  setState(() {

                  });
                  _pagecontrol.animateToPage(currentpage+1, duration: Duration(seconds: 1), curve: Curves.linear);

                }, child: Text((currentpage==listofstory.length-1)?'Finish':'Next')),

              ],
            ),
          ],
      ),
      body: Center(
        child: PageView.builder(
          itemCount: listofstory.length,
          controller: _pagecontrol,
          onPageChanged: (value) {
            currentpage=value;
            setState(() {

            });
          },

          itemBuilder: (context, index) {
            return OtherScreen.pera(listofstory[index]);
          },),
      ),
    );
  }

}
