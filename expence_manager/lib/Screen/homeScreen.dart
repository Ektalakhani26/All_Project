
import 'package:expence_manager/Screen/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/db_helper.dart';
import '../modelclass.dart';
import 'Expenses.dart';
import 'IncomeScreen.dart';
import 'setting.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late final _tabController = TabController(length: 2, vsync: this);

  //======= Mltiple List income expence or marge ===================

  List<Map<String, dynamic>>? journals = [];
  List<Map<String, dynamic>>? journals1 = [];


  final dateFormate = DateFormat('dd/MM/yyyy');

  // ==================== income data to store _refreshJournals method ================

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      journals = data;
    });
  }

  // ==================== expence data to store _refreshJournals1 method ================

  void _refreshJournals1() async {
    final data = await DB_Helper.getItems();
    setState(() {
      journals1 = data;

    });
  }


  //============ init state Method ============

  @override
  void initState() {
    setState(() {

    });
    //margelist();
    // TODO: implement initState
    super.initState();
  }

  //========== Date Range method =================

  DateTimeRange ? _selectedDateRange;
  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
     // builder: (context, child) => filterdata(list, start, end),
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }


  //=============================================================================
   //================== filder date wise sorting the listview builder ====================
  //======================================================================================

  // List<Alltranction> filterdata(List<Alltranction> list,DateTime start,DateTime end){
  //   return list.where((element) => element.date!.isAfter(start) && element.date!.isBefore(end)).toList();
  // }

  List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }
  String formatAmount(int amount) {
    final formatter = NumberFormat('#,##,###');
    return formatter.format(amount);
  }
  //============ widget build =====================

  @override
  Widget build(BuildContext context) {
    _refreshJournals1();
    _refreshJournals();
    List<Alltranction> incomeexpencedata = [];

    //================= total income method============

    int totalincome(int start,int end){
      int sum=0;
      for(var i=0;i<journals!.length;i++) {
        if (journals![i]['date']! <= end &&
            journals![i]['date']! >= start) {
          sum = sum + int.parse(journals![i]['amount']);
          // var sum = journals![i]['amount'];
          // var sum1 = sum.reduce((value,element) => value + element );
          // print('Total = $sum1');
        }
      }
      return sum;
    }

    //=================== total expence method =====================

    int totalexpence(int start,int end){
      int sum=0;
      for(var i=0;i<journals1!.length;i++){
        if(journals1![i]['expencedate']! <= end &&
            journals1![i]['expencedate']! >= start) {
          sum = sum + int.parse(journals1![i]['expensamount']);
        }
      }
      return sum;
    }

    DateTime?  start = _selectedDateRange?.start ?? DateTime(2022, 1, 1);
    DateTime?  end = _selectedDateRange?.end ?? DateTime(2030, 12, 31);

    //=========== Marge list Method =============================
    // ======= to  expence date marge =========================

    for (int i = 0; i < journals1!.length; i++) {
      setState(() {

      });
      incomeexpencedata.add(
          Alltranction(
          DateTime.parse(
              DateTime.fromMillisecondsSinceEpoch(journals1![i]['expencedate'])
                  .toString()),
          journals1![i]['expenscategory'], journals1![i]['expensamount']));
    }

    //=================== income data marge==================

    for (int i = 0; i < journals!.length; i++) {
      setState(() {

      });
      incomeexpencedata.add(Alltranction(
          DateTime.parse(
              DateTime.fromMillisecondsSinceEpoch(journals![i]['date'])
                  .toString()),
          journals![i]['category'], journals![i]['amount']));
    }

    //======================================================================
    //=============== Sorting in listview builder ============================
    //===================================================================
    incomeexpencedata.sort((a, b) => DateTime.parse(a.date.toString()).compareTo(DateTime.parse(b.date.toString())));


    //========== total incon - total expence = final total ================================

    var totalin = totalincome(start.millisecondsSinceEpoch,end.millisecondsSinceEpoch);
   // print('Total income = ${totalin}');
     var totalex = totalexpence(start.millisecondsSinceEpoch,end.millisecondsSinceEpoch);
     var total = totalin - totalex ;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      right: true,
      left: true,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(

          //==========================  Tab bar ======================================

          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "CASHBOOK",),
                Tab(text: "REPORTS"),
              ],
            ),
            title: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.book,color: Colors.white,size: 30),
                    Spacer(flex: 1),
                    Text('My Business',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                    SizedBox(width: 10),
                    Icon(Icons.edit_note_rounded,color: Colors.white,size: 35),

                    Spacer(flex: 9,),
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen(),));
                        },
                        child: Icon(Icons.settings,color: Colors.white,size: 30)
                    ),
                    SizedBox(width: 5),

                  ],
                ),
              ],
            ),
          ),
              body: TabBarView(
                controller: _tabController,
                  children: [

                    //==========================================================
                    //================== CASHBOOK ==============================
                    //=====================================================

                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Card(
                            child: InkWell(
                              onTap: () {
                                showSearch(context: context, delegate: SearchDelegate1(incomeexpencedata));
                              },
                              child: Container(
                                //alignment: Alignment.centerLeft,
                                height: size.height/19,
                                width: size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.search,color: Colors.black38),
                                    SizedBox(width: 10,),
                                    Text('Search entries by category,detail or amount',style: TextStyle(color: Colors.black38)),
                                  ],
                                ),
                               // color: Colors.blue.shade50,
                              ),
                            ),
                          ),
                          Container(
                            height: size.height/11,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Card(
                                color: Colors.blue.shade50,
                                child: Row(

                                  children: [
                                    Image(image: AssetImage('assets/money1.png')),
                                    SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        FutureBuilder(builder: (context, snapshot) {
                                          return Text(formatAmount(total),style: TextStyle(fontSize: 18,color: Colors.green.shade800,fontWeight: FontWeight.bold),);
                                        }, future: Future(() => () {

                                        }),),
                                        SizedBox(height: 5,),
                                        Text('Cash in hand',style: TextStyle(fontSize: 15,color: Colors.blue.shade800,fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(width: size.width*0.4,),
                                    Icon(Icons.keyboard_double_arrow_down_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () => _tabController.index = 1,
                            child: Container(
                              height: size.height/15,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Card(
                                  color: Colors.blue.shade50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(Icons.library_books,color: Colors.blue.shade800,),
                                      Text('See Your previous entries from Reports Tab',style: TextStyle(color: Colors.blue.shade800,fontWeight: FontWeight.bold,fontSize: 15),),
                                      Icon(Icons.keyboard_double_arrow_right,color: Colors.blue.shade800,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Image(image: AssetImage('assets/entries.png')),
                          Container(
                            height: size.height/13,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10),
                              child: Card(
                                color: Colors.blue.shade50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Add Your Entry'),
                                        Icon(Icons.arrow_downward_sharp),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                         SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade700)),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IncomeScreen(),));
                                    incomeexpencedata.clear();
                                    // journals!.clear();
                                    // _refreshJournals();
                                  }, child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text('INCOME'),
                              )),
                              ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red.shade800)),
                                  onPressed: () {

                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ExpensesScreen(),));
                                    incomeexpencedata.clear();
                                    // journals!.clear();
                                    // _refreshJournals();
                                  }, child: const Padding(
                                padding: EdgeInsets.all(20),
                                child: Text('EXPENCE'),
                              )),
                            ],
                          ),
                          SizedBox(height: 10,),
                      ],
                      ),
                    ),

                    //==========================================================
                    //==================== REPORTS ===============================
                    //============================================================

                    Column(
                      children: [

                        //======= Date ranger start date to end date display container==============

                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {

                                    });
                                    _show();
                                    DateTime startd = start as DateTime;
                                    DateTime endd = end as DateTime;

                                   getDaysInBetween(startd, endd);
                                  },
                                  child: Icon(Icons.calendar_month,color: Colors.blueAccent.shade400,size: 35)
                              ),
                              Expanded(child: Padding(padding: EdgeInsets.all(10),
                                child: Container(
                                  width: size.width*0.37,
                                  height: size.height/16,
                                  child: Center(child: Text('${_selectedDateRange == null ? dateFormate.format(start) : _selectedDateRange?.start.toString().split(' ')[0]}',style: TextStyle(fontSize: size.width/20),)),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent.shade400)),
                                ),
                              )),
                              Expanded(child: Padding(padding: EdgeInsets.all(10),
                                child: Container(
                                  width: size.width*0.37,
                                  height: size.height/16,
                                  child: Center(child: Text("${_selectedDateRange == null ? dateFormate.format(end) : _selectedDateRange?.end.toString().split(' ')[0]}",style: TextStyle(fontSize: size.width/20),)),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent.shade400)),
                                ),
                              )),
                            ],
                          ),
                        ),

                        //====== Total income or expence and final total=========

                        Container(
                          height: size.height*0.1,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Card(
                              color: Colors.blue.shade50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Total Income',style: TextStyle(fontSize: 15)),
                                      FutureBuilder(builder: (context, snapshot) {
                                        return Text(formatAmount(totalincome(start.millisecondsSinceEpoch,end.millisecondsSinceEpoch)),style: TextStyle(fontSize: 18,color: Colors.green.shade800,fontWeight: FontWeight.bold),);
                                      }, future: Future(() => () {

                                      }),),
                                    ],
                                  ),
                                  Text('-',style: TextStyle(fontSize: 35)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Total Expence',style: TextStyle(fontSize: 15)),
                                      FutureBuilder(

                                        builder: (context, snapshot) {
                                        return Text(formatAmount(totalexpence(start.millisecondsSinceEpoch,end.millisecondsSinceEpoch)),style: TextStyle(fontSize: 18,color: Colors.red.shade800,fontWeight: FontWeight.bold),);
                                      }, future: Future(() => () {

                                      }),),
                                    ],
                                  ),
                                  Text('=',style: TextStyle(fontSize: 25)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Net Balance',style: TextStyle(fontSize: 15)),
                                      FutureBuilder(builder: (context, snapshot) {
                                        return Text(formatAmount(total),style: TextStyle(fontSize: 18),);
                                      }, future: Future(() => () {

                                      }),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //======== Listviewer builder ==========

                        Expanded(
                          child: ListView.builder(
                            itemCount: incomeexpencedata.length,
                            itemBuilder: (context, index) {
                              return (incomeexpencedata[index].date!.millisecondsSinceEpoch <= end.millisecondsSinceEpoch &&
                                      incomeexpencedata[index].date!.millisecondsSinceEpoch >= start.millisecondsSinceEpoch) ?
                                Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  height: size.height/15,
                                  child: Card(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(dateFormate.format(DateTime.fromMillisecondsSinceEpoch(incomeexpencedata[index].date!.millisecondsSinceEpoch)),
                                            style: TextStyle(fontWeight: FontWeight.w600)),
                                        Text(incomeexpencedata[index].title ?? "",),
                                        Text(formatAmount(int.parse(incomeexpencedata[index].amount ?? "")),
                                            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green.shade900, fontSize: 23)),
                                      ],
                                    ),
                                  ),
                                ),
                              ) :
                              Container(
                                child: null,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
              ),
        ),
      ),
    );
  }
}
