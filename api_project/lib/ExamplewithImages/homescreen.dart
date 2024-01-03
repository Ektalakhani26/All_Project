import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'modelclass.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeImagePage(),
    );
  }
}

class HomeImagePage extends StatefulWidget {
  const HomeImagePage({Key? key}) : super(key: key);

  @override
  State<HomeImagePage> createState() => _HomeImagePageState();
}

class _HomeImagePageState extends State<HomeImagePage> {
  late Jsontodart postmodel;

  Future<Jsontodart> getPostApi() async{

    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if(response.statusCode == 200){
      postmodel = Jsontodart.fromJson(jsonDecode(response.body));
    //  print('Parsed data: $postmodel');
      return postmodel;
    }
    else{
      return postmodel;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Example'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
            if(!snapshot.hasData){
              return  Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.black26,
                    size: 70),
              );
            }
            else{
              return ListView.builder(
                itemCount: postmodel.products!.length,
                itemBuilder: (context, index) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Card(
                     child:Row(
                       children: [
                       Expanded(
                         child: Container(
                             height: 200,
                             width: 100,
                             color: Colors.black26,
                             child: Image.network(
                              // height: 100,
                                 //width: 100,
                                 postmodel.products![index].thumbnail.toString(),fit: BoxFit.fill),
                           ),
                       ),
                         SizedBox(width: 10,),
                         Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text(postmodel.products![index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                               Text(postmodel.products![index].category.toString(),style: TextStyle(fontWeight: FontWeight.w300)),
                               Text(postmodel.products![index].brand.toString()),
                               Row(
                                 children: [
                                   Text(postmodel.products![index].rating.toString(),style: TextStyle(color: Colors.orange.shade800)),
                                   Icon(Icons.star,color: Colors.yellow),
                                   Icon(Icons.star,color: Colors.yellow),
                                   Icon(Icons.star,color: Colors.yellow),
                                   Icon(Icons.star_half_outlined,color: Colors.yellow),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text('₹${postmodel.products![index].price.toString()}',style: TextStyle(color: Colors.green.shade800,fontWeight: FontWeight.bold)),
                                   SizedBox(width: 10,),
                                   Text('${postmodel.products![index].discountPercentage.toString()} % OFF',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold)),
                                 ],
                               ),
                               Text(postmodel.products![index].description.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Text('Stock:${postmodel.products![index].stock.toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green.shade800)),
                                 SizedBox(width: 10,),
                                 ],
                               ),

                             ],
                           ),
                         ),
                       ],
                     ),
                     // ListTile(
                     //   title: Column(
                     //     mainAxisAlignment: MainAxisAlignment.start,
                     //     crossAxisAlignment: CrossAxisAlignment.start,
                     //     children: [
                     //      // Text(postmodel.products![index].id.toString()),
                     //       Text(postmodel.products![index].title.toString()),
                     //       Text(postmodel.products![index].category.toString()),
                     //       Text(postmodel.products![index].brand.toString()),
                     //       Text(postmodel.products![index].price.toString()),
                     //       Text(postmodel.products![index].discountPercentage.toString()),
                     //       Text(postmodel.products![index].stock.toString()),
                     //       Text(postmodel.products![index].description.toString()),
                     //     ],
                     //   ),
                     //   leading: Container(
                     //     height: 200,
                     //     width: 100,
                     //     color: Colors.black26,
                     //     child: Image.network(
                     //      // height: 100,
                     //         //width: 100,
                     //         postmodel.products![index].thumbnail.toString(),fit: BoxFit.fill),
                     //   ),
                     // ),
                   ),
                 );
              },
              );
            }
          },))
        ],
      ),
    );
  }
}
