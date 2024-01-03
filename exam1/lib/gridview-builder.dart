import 'package:exam1/pageviewbulider/modelclass.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyPage(),
      ),
    );
  }
}


class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {

    List<img> image = [];
    image.add(img('assets1/dad.jpg'));image.add(img('assets1/di.jpg'));image.add(img('assets1/kaushik.jpg'));
    image.add(img('assets1/ekta2.jpg'));image.add(img('assets1/Error1.jpg'));image.add(img('assets1/jensi.jpg'));
    image.add(img('assets1/girl.jpg'));image.add(img('assets1/home.jpg'));image.add(img('assets1/mom.jpg'));
    image.add(img('assets1/neha.jpg'));image.add(img('assets1/party.jpg'));image.add(img('assets1/pointer.jpg'));
    image.add(img('assets1/p1.jpg'));image.add(img('assets1/p2.jpg'));image.add(img('assets1/p3.jpg'));
    image.add(img('assets1/p4.jpg'));image.add(img('assets1/p5.jpg'));image.add(img('assets1/p6.jpg'));
    image.add(img('assets1/p7.jpg'));image.add(img('assets1/p8.jpg'));image.add(img('assets1/p9.jpg'));
    image.add(img('assets1/p10.jpg'));image.add(img('assets1/p11.jpg'));image.add(img('assets1/p12.jpg'));
    image.add(img('assets1/p13.jpg'));image.add(img('assets1/p14.jpg'));
    image.add(img('assets1/p15.jpg'));image.add(img('assets1/p16.jpg'));image.add(img('assets1/p17.jpg'));image.add(img('assets1/p18.jpg'));
    image.add(img('assets1/p19.jpg')); image.add(img('assets1/dad.jpg'));image.add(img('assets1/di.jpg'));
    image.add(img('assets1/kaushik.jpg'));image.add(img('assets1/ekta2.jpg'));image.add(img('assets1/Error1.jpg'));
    image.add(img('assets1/jensi.jpg'));image.add(img('assets1/girl.jpg'));image.add(img('assets1/home.jpg'));
    image.add(img('assets1/mom.jpg'));image.add(img('assets1/neha.jpg'));image.add(img('assets1/party.jpg'));
    image.add(img('assets1/pointer.jpg'));image.add(img('assets1/p1.jpg'));image.add(img('assets1/p2.jpg'));
    image.add(img('assets1/p3.jpg'));image.add(img('assets1/p4.jpg'));image.add(img('assets1/p5.jpg'));
    image.add(img('assets1/p6.jpg'));image.add(img('assets1/p7.jpg'));image.add(img('assets1/p8.jpg'));
    image.add(img('assets1/p9.jpg'));image.add(img('assets1/p10.jpg'));image.add(img('assets1/p11.jpg'));
    image.add(img('assets1/p12.jpg'));image.add(img('assets1/p13.jpg'));
    image.add(img('assets1/p14.jpg'));image.add(img('assets1/p15.jpg'));image.add(img('assets1/p16.jpg'));
    image.add(img('assets1/p17.jpg'));image.add(img('assets1/p18.jpg'));image.add(img('assets1/p19.jpg'));

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
        return GridView.builder(
          itemCount: image.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.portrait ? 4:8),
            itemBuilder: (context, index) {
                        return Container(
               // width: 200,
                //height: 200,
               // color: Colors.pinkAccent,
                margin: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageScreen.pera(image , index)));
                    print('Index is : ${index}');
                  },
                  child:  Image(image: AssetImage('${image[index].image1}')),
                ),

              );
              // PageView.builder(
                       //   itemCount: image.length,
                       //   itemBuilder: (context, index) {
                       //   return ImageView.pera(image[index]);
                       // },);
              //
              //

            },);
      },),
    );
  }
}

class ImageScreen extends StatefulWidget {
 // var index;
 // var index;
 final List<img> ? alllist;
  var ind;
   //ImageScreen({Key? key}) : super(key: key);

  ImageScreen.pera(this.alllist, this.ind);
  @override
  State<ImageScreen> createState() => _ImageScreenState(alllist!,ind);
}

class _ImageScreenState extends State<ImageScreen> {
  final List<img> ? alllist;

  var ind;

  _ImageScreenState(this.alllist, this.ind);
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView.builder(

        controller: PageController(
          initialPage: ind
        ),

          itemBuilder: (context, index) {
            print('index of : ${index}');

          return Container(
            margin: EdgeInsets.all(5),
            child:  Image(image: AssetImage('${alllist![index].image1}')),
            // ),

          );
        },),
    );
  }
}



