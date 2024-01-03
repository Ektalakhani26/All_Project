import 'package:expence_manager/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchDelegate1 extends SearchDelegate<Alltranction>{

  List<Alltranction> incomeexpence;

  SearchDelegate1(this.incomeexpence);

  @override
  List<Widget>? buildActions(BuildContext context) {
   return[
     IconButton(onPressed: () {
       query = '';
     }, icon: Icon(Icons.clear))
   ];

  }
  String formatAmount(int amount) {
    final formatter = NumberFormat('#,##,###');
    return formatter.format(amount);
  }
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context ) {
    Size size = MediaQuery.of(context).size;
    final dateFormate = DateFormat('dd/MM/yyyy');
    List<Alltranction> suggestionList = query.isEmpty ? incomeexpence :
    incomeexpence.where((element) => element.title!.toLowerCase().startsWith(query.toLowerCase())).toList();
    return Expanded(
      child: suggestionList.isNotEmpty
          ? ListView.builder(
           itemCount: suggestionList.length,
            itemBuilder: (context, index) => Card(
              key: ValueKey(suggestionList[index].title),
         // color: Colors.amberAccent,
              child: Container(
                height: size.height/15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(dateFormate.format(DateTime.fromMillisecondsSinceEpoch(suggestionList[index].date!.millisecondsSinceEpoch)),
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text(suggestionList[index].title ?? "",),
                    Text(formatAmount(int.parse(suggestionList[index].amount ?? "")),
                        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green.shade900, fontSize: 23)),
                  ],
                ),
              ),
        ),
      )
          : Center(
            child: const Text(
        'No results found',
        style: TextStyle(fontSize: 24),
      ),
          ),
    );
    //   Column(
    //   children: [
    //     Expanded(
    //       child: incomeexpence.isNotEmpty ?
    //       ListView.builder(
    //         itemCount: incomeexpence.length,
    //         itemBuilder: (context, index) {
    //           Padding(
    //             padding: EdgeInsets.all(5),
    //             child: Container(
    //               height: size.height/15,
    //               child: Card(
    //                 key: ValueKey(incomeexpence[index].title),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     Text(dateFormate.format(DateTime.fromMillisecondsSinceEpoch(incomeexpence[index].date!.millisecondsSinceEpoch)),
    //                         style: TextStyle(fontWeight: FontWeight.w600)),
    //                     Text(incomeexpence[index].title ?? "",),
    //                     Text(incomeexpence[index].amount ?? "",
    //                         style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green.shade900, fontSize: 23)),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //       ) :
    //           Text('No result Found'),
    //     ),
    //   ],
    // );
  }

}