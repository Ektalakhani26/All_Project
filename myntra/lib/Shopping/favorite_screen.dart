import 'package:flutter/material.dart';

import '../DBHelper/DB_Helper.dart';

class FavoriteScreen extends StatefulWidget {

   FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  List<Map<String, dynamic>>? listfavorite = [];

  void _refreshJournals() async {
    final data = await SQLHelper.favoritegetItems();
    setState(() {
      listfavorite = data;
    });
  }

  void _deleteItem(int id) async {
    await SQLHelper.favoritedeleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  void initState() {
    _refreshJournals();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.black,)),
        title: Text('Favorite Profile',style: TextStyle(color: Colors.black)),
      ),
        body: Column(
          children: [
          //  Image(image: AssetImage('assets/freeshipping.jpeg')),
            !listfavorite!.isEmpty ?
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    //crossAxisSpacing: 20,
                    // mainAxisSpacing: 60
                  ),
                  itemCount: listfavorite?.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        //Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetail1(productdetail: productlist[index]),));
                        print('index = ${index}');
                      },
                      child: Container(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image(image: AssetImage('${listfavorite![index]["image"]}'),fit: BoxFit.fill,),
                              height: size.height/5,
                              width: size.width*0.49,
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text('${listfavorite![index]["title"]}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                  SizedBox(width: 30,),
                                  InkWell(
                                      onTap: () {
                                        _deleteItem(listfavorite![index]["id"]);
                                      },
                                      child: Icon(Icons.delete,color: Colors.green.shade800,)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${listfavorite![index]["subtitle"]}',style: TextStyle(color: Colors.black54)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${listfavorite![index]["price"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('${listfavorite![index]["description"]}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal)),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
                      ),
                    );
                  }),
            ) :
            Expanded(
              child: Container(
                //height: size.height*0.7+20,
                child: Image(image: AssetImage('assets/whishlist.png')),),
            ),
          ],
        )
    );
  }
}
