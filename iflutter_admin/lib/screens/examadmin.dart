import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class examAdmin extends StatefulWidget {
  const examAdmin({Key? key}) : super(key: key);

  @override
  _TaskAdminState createState() => _TaskAdminState();
}

class _TaskAdminState extends State<examAdmin> with TickerProviderStateMixin {
  // void initState() {
  //   super.initState();
  //   MyDataBase.selectDataexam().then((value) {
  //     setState(() {});
  //   });
  // }
  Map selectedexamdata = {};
  Map selectedresultdata = {};

/*  File? img;
  String upload = 'Upload';
  String Delete='Delete';
  List<Map> Ad = [];
  selectImage(index) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    img = File(image!.path);
    Ad[index]['image']=basename(img!.path);
    setState(() {
    });
  }*/
  List<Map> Ad = [];
  List<Map> dar = [];
  DateTime? date;

//  String indexTab = '';
  TabController? tabController;

  int? currentIndex = 0;
  String odate = 'DD';
  String omonth = 'MM';
  String oyear = 'YYYY';
  String? cdate;
  String? cmonth;
  String? cyear;
  TextEditingController doController = TextEditingController();
  TextEditingController do1Controller = TextEditingController();
  TextEditingController NameController = TextEditingController();

  // TextEditingController DateController = TextEditingController();
  TextEditingController LinkController = TextEditingController();
  TextEditingController TimeController = TextEditingController();
  TextEditingController Name1Controller = TextEditingController();

  // TextEditingController Date1Controller = TextEditingController();
  TextEditingController markController = TextEditingController();

  // int indexTab1=1;

  Widget commonContainer(context, index) {
    // Ad.clear();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.black12, width: 2)),
        shadowColor: Color(0xff03508C),
        child: Container(
          height: 190,
          width: MediaQuery.of(context).size.width / 23,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () {
                    MyDataBase.deleteDataexam(
                        keyvalue: MyDataBase.examdata[index]['key']);
                    selectedexamdata.clear();
                    selectedexamdata = MyDataBase.examdata[index];
                    setState(() {});
                  },
                  title: Text(
                    'Topic name : ${MyDataBase.examdata[index]['topicname'] ?? ''}',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  trailing: Text(
                    'Date : ${MyDataBase.examdata[index]['date']}',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  //subtitle: Text(data1[index]['detail'],style: TextStyle(color: Colors.grey, fontSize: 12,),),
                ),
                Center(
                    child: Text(
                  'Exam link :${MyDataBase.examdata[index]['link']}',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    'Time : ${MyDataBase.examdata[index]['time']}',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
                SizedBox(height: 17),
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: MaterialButton(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    minWidth: MediaQuery.of(context).size.width / 3.5,
                    height: 40,
                    color: Color(0xffF03508c),
                    onPressed: () {
                      setState(() {
                        MyDataBase.deleteDataexam(
                            keyvalue: MyDataBase.examdata[index]['key']);
                        MyDataBase.examdata.removeAt(index);
                      });
                    },
                    child: Text(
                      'delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commanContainer1(context, index) {
    /// var index;
    // String odate ='DD';
    //String omonth ='MM';
    //String oyear = 'YYYY';
    String delete = 'Delete';
    String newAnnouncement = 'New Announcement';
    String announcementDetail = 'Announcement Detail';
    //dar.clear();
    TextEditingController dateController = TextEditingController();
    TextEditingController topicController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Color(0xffF03508c), width: 1.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                MyDataBase.deleteDataresult(
                    keyvalue: MyDataBase.resultdata[index]['key']);
                selectedresultdata.clear();
                selectedresultdata = MyDataBase.resultdata[index];
                setState(() {});
              },
              title: Text(
                'Topic name : ${
                // dar=NameController.text;
                MyDataBase.resultdata[index]['topicname']}',
                style: TextStyle(color: black),
              ),
              trailing: Text(
                'Mark : ${ MyDataBase.resultdata[index]['mark']}',
                style: TextStyle(color: black),
              ),
              subtitle: Text(
                'Date : ${ MyDataBase.resultdata[index]['date']}',
                style: TextStyle(color: black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110.0, top: 10.0),
              child: Row(
                children: [
                  MaterialButton(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    minWidth: MediaQuery.of(context).size.width / 3.5,
                    height: 40,
                    color: Color(0xffF03508c),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                contentPadding: EdgeInsets.all(50.0),
                                insetPadding: EdgeInsets.symmetric(
                                  vertical: 120,
                                ),
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: Text(
                                            addres,
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700),
                                      )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: Name1Controller,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: black),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10.0),
                                                    topLeft:
                                                        Radius.circular(10.0),
                                                    bottomLeft:
                                                        Radius.circular(10.0),
                                                    bottomRight:
                                                        Radius.circular(10.0),
                                                  ),
                                                ),
                                                hintText: 'Topic Name',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () async {
                                                //FocusScope.of(context).requestFocus(new FocusNode());
                                                DateTime? selectDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2010),
                                                        lastDate:
                                                            DateTime(2040));
                                                odate =
                                                    selectDate!.day.toString();
                                                omonth =
                                                    selectDate.month.toString();
                                                oyear =
                                                    selectDate.year.toString();
                                                setState(() {
                                                  do1Controller
                                                    ..text = odate +
                                                        ' / ' +
                                                        omonth +
                                                        ' / ' +
                                                        oyear;
                                                });
                                                // print(doController.text);
                                              },
                                              child: TextFormField(
                                                controller: do1Controller,
                                                decoration: InputDecoration(
                                                  enabled: false,
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      bottomLeft:
                                                          Radius.circular(10.0),
                                                      bottomRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  hintText: 'Enter date',
                                                ),
                                                // onTap: () async {
                                                //   //FocusScope.of(context).requestFocus(new FocusNode());
                                                //   DateTime? selectDate =
                                                //       await showDatePicker(
                                                //           context: context,
                                                //           initialDate: date!,
                                                //           firstDate: DateTime(2010),
                                                //           lastDate: DateTime(2040));
                                                //   odate = selectDate!.day.toString();
                                                //   omonth = selectDate.month.toString();
                                                //   oyear = selectDate.year.toString();
                                                //   setState(() {
                                                //     do1Controller.text = odate +
                                                //         ' / ' +
                                                //         omonth +
                                                //         ' / ' +
                                                //         oyear;
                                                //   });
                                                //   // print('selected date!');
                                                // },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Center(
                                        child: Text(
                                          'Marks',
                                          style: TextStyle(
                                              color: black,
                                              fontSize: 17),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: markController,
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
                                        ),
                                        // maxLines: 5,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Center(
                                        child: MaterialButton(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          height: 40,
                                          color: Color(0xffF03508c),
                                          onPressed: () {
                                            MyDataBase.updateDataresult(
                                              topicname: Name1Controller.text,
                                              date: do1Controller.text,
                                              mark: markController.text,
                                              key: MyDataBase.resultdata[index]
                                                  ['key'],
                                            ).then((value) {
                                              MyDataBase.selectDataresult()
                                                  .then(
                                                (value) {
                                                  Navigator.pop(context);
                                                },
                                              );
                                            });
                                          },

                                          // print(dar.toString());

                                          child: Text(
                                            update,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ));
                      //String upload = 'Upload';

                      // showDialog(
                      //   context: context,
                      //   builder: (context) => SimpleDialog(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(20.0))),
                      //     contentPadding: EdgeInsets.all(50.0),
                      //     insetPadding: EdgeInsets.symmetric(
                      //       vertical: 120,
                      //     ),
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Center(
                      //               child: Text(
                      //             newAnnouncement,
                      //             style: TextStyle(
                      //                 color: Colors.black,
                      //                 fontSize: 17,
                      //                 fontWeight: FontWeight.w700),
                      //           )),
                      //           SizedBox(
                      //             height: 20,
                      //           ),
                      //           Row(
                      //             children: [
                      //               TextFormField(
                      //                 controller: topicController,
                      //                 decoration: InputDecoration(
                      //                   border: OutlineInputBorder(
                      //                     borderSide:
                      //                         BorderSide(color: Colors.black),
                      //                     borderRadius: BorderRadius.only(
                      //                       topRight: Radius.circular(10.0),
                      //                       topLeft: Radius.circular(10.0),
                      //                       bottomLeft: Radius.circular(10.0),
                      //                       bottomRight: Radius.circular(10.0),
                      //                     ),
                      //                   ),
                      //                   hintText: 'Topic Name',
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 width: 20,
                      //               ),
                      //               TextFormField(
                      //                 controller: dateController,
                      //                 decoration: InputDecoration(
                      //                   border: OutlineInputBorder(
                      //                     borderSide:
                      //                         BorderSide(color: Colors.black),
                      //                     borderRadius: BorderRadius.only(
                      //                       topRight: Radius.circular(10.0),
                      //                       topLeft: Radius.circular(10.0),
                      //                       bottomLeft: Radius.circular(10.0),
                      //                       bottomRight: Radius.circular(10.0),
                      //                     ),
                      //                   ),
                      //                   hintText: 'Date/Time',
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(
                      //             height: 20,
                      //           ),
                      //           Center(
                      //             child: Text(
                      //               announcementDetail,
                      //               style: TextStyle(
                      //                   color: Colors.black, fontSize: 17),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 10,
                      //           ),
                      //           TextFormField(
                      //             decoration: InputDecoration(
                      //               border: OutlineInputBorder(
                      //                 borderSide:
                      //                     BorderSide(color: Colors.black),
                      //                 borderRadius: BorderRadius.only(
                      //                   topRight: Radius.circular(10.0),
                      //                   topLeft: Radius.circular(10.0),
                      //                   bottomLeft: Radius.circular(10.0),
                      //                   bottomRight: Radius.circular(10.0),
                      //                 ),
                      //               ),
                      //             ),
                      //             maxLines: 5,
                      //           ),
                      //           SizedBox(
                      //             height: 30,
                      //           ),
                      //           Center(
                      //             child: MaterialButton(
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.all(
                      //                       Radius.circular(20.0))),
                      //               minWidth:
                      //                   MediaQuery.of(context).size.width / 2.5,
                      //               height: 40,
                      //               color: Color(0xffF03508c),
                      //               onPressed: () {
                      //                 Navigator.of(context).pop();
                      //                 setState(() {});
                      //               },
                      //               child: Text(
                      //                 upload,
                      //                 style: TextStyle(color: Colors.white),
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // );
                    },
                    child: Text(
                      update,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    minWidth: MediaQuery.of(context).size.width / 3.5,
                    height: 40,
                    color: Color(0xffF03508c),
                    onPressed: () {
                      setState(() {
                        MyDataBase.deleteDataresult(
                            keyvalue: MyDataBase.resultdata[index]['key']);
                        MyDataBase.resultdata.removeAt(index);
                      });
                    },
                    child: Text(
                      delete,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(_handlerTAbSelection);
    // } void initState() {
    //   super.initState();
    MyDataBase.selectDataexam().then((value) {
      setState(() {});
    });
    MyDataBase.selectDataresult().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // date=DateTime.now();
    // cdate=date!.day.toString();
    // cmonth=date!.month.toString();
    // cyear=date!.year.toString();

    // String odate ='DD';
    // String omonth ='MM';
    // String oyear = 'YYYY';
    String Task = 'Task';

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:blue,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Colors.white)),
          title: const Text(
            "Exam & Result",
            style: TextStyle(fontSize: 25.0),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(text: exam),
              Tab(text: result),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          backgroundColor: blue,
          onPressed: () {
            String announcementDetailf;
            currentIndex == 0
                ? showDialog(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              'Add Exam',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: NameController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: black),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      hintText: 'Topic Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      //FocusScope.of(context).requestFocus(new FocusNode());
                                      DateTime? selectDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2010),
                                              lastDate: DateTime(2040));
                                      odate = selectDate!.day.toString();
                                      omonth = selectDate.month.toString();
                                      oyear = selectDate.year.toString();
                                      setState(() {
                                        doController
                                          ..text = odate +
                                              ' / ' +
                                              omonth +
                                              ' / ' +
                                              oyear;
                                      });
                                      // print(doController.text);
                                    },
                                    child: TextFormField(
                                      controller: doController,
                                      decoration: InputDecoration(
                                        enabled: false,
                                        disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        hintText: 'Enter Date',
                                      ),
                                      // onTap: () async{
                                      //   //FocusScope.of(context).requestFocus(new FocusNode());
                                      //   DateTime? selectDate =await showDatePicker(
                                      //       context: context,
                                      //       initialDate:date!,
                                      //       firstDate: DateTime(2010),
                                      //       lastDate: DateTime(2040));
                                      //   odate = selectDate!.day.toString();
                                      //   omonth =selectDate.month.toString();
                                      //   oyear =selectDate.year.toString();
                                      //   setState(() {
                                      //     doController..text=
                                      //         odate + ' / ' + omonth + ' / ' + oyear;
                                      //   });
                                      //   // print(doController.text);
                                      // },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: LinkController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                hintText: 'Enter link',
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: TimeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                                hintText: 'Enter Time',
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                                child: MaterialButton(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              minWidth: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 15,
                              color: Color(0xffF03508c),
                              onPressed: () {
                                MyDataBase.insertdataexam(
                                  topicname: NameController.text,
                                  date: doController.text,
                                  link: LinkController.text,
                                  time: TimeController.text,
                                );
                                MyDataBase.selectDataexam().then((value) {
                                  //setState(() {});
                                  Navigator.pop(context);
                                  setState(() {});
                                });
                              },
                              child: Text(
                                "Add1",
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                : showDialog(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              ' Add Result',
                              style: TextStyle(
                                  color: black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: Name1Controller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: black),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      hintText: 'Topic Name',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      //FocusScope.of(context).requestFocus(new FocusNode());
                                      DateTime? selectDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2010),
                                              lastDate: DateTime(2040));
                                      odate = selectDate!.day.toString();
                                      omonth = selectDate.month.toString();
                                      oyear = selectDate.year.toString();
                                      setState(() {
                                        do1Controller
                                          ..text = odate +
                                              ' / ' +
                                              omonth +
                                              ' / ' +
                                              oyear;
                                      });
                                      // print(doController.text);
                                    },
                                    child: TextFormField(
                                      controller: do1Controller,
                                      decoration: InputDecoration(
                                        enabled: false,
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        hintText: 'Enter date',
                                      ),
                                      // onTap: () async {
                                      //   //FocusScope.of(context).requestFocus(new FocusNode());
                                      //   DateTime? selectDate =
                                      //       await showDatePicker(
                                      //           context: context,
                                      //           initialDate: date!,
                                      //           firstDate: DateTime(2010),
                                      //           lastDate: DateTime(2040));
                                      //   odate = selectDate!.day.toString();
                                      //   omonth = selectDate.month.toString();
                                      //   oyear = selectDate.year.toString();
                                      //   setState(() {
                                      //     do1Controller.text = odate +
                                      //         ' / ' +
                                      //         omonth +
                                      //         ' / ' +
                                      //         oyear;
                                      //   });
                                      //   // print('selected date!');
                                      // },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Marks',
                                style: TextStyle(
                                    color: black, fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: markController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: black),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              // maxLines: 5,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: MaterialButton(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                minWidth: MediaQuery.of(context).size.width / 3,
                                height: 40,
                                color: Color(0xffF03508c),
                                onPressed: () {
                                  MyDataBase.insertdataresult(
                                    topicname: Name1Controller.text,
                                    date: do1Controller.text,
                                    mark: markController.text,
                                  );
                                  MyDataBase.selectDataresult().then((value) {
                                    //setState(() {});
                                    Navigator.pop(context);
                                    setState(() {});
                                  });

                                  // print(dar.toString());
                                },
                                child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    //             :FloatingActionButton(
                    // elevation: 3,
                    // backgroundColor: Color(0xffF03508c),
                    // onPressed: () {
                    //   print(indexTab+"hhh");
                    //   String Add = 'Add';
                    //   //date = DateTime.now();
                    //   String newAnnouncementf = 'New Announcement';
                    //   String announcementDetailf = 'Announcement Detail';
                    //   showDialog(
                    //     context: context,
                    //     builder: (context) => SimpleDialog(
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius:
                    //           BorderRadius.all(Radius.circular(20.0))),
                    //       contentPadding: EdgeInsets.all(50.0),
                    //       insetPadding: EdgeInsets.symmetric(
                    //         vertical: 120,
                    //       ),
                    //       children: [
                    //         Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Center(
                    //                 child: Text(
                    //                   newAnnouncementf,
                    //                   style: TextStyle(
                    //                       color: Colors.black,
                    //                       fontSize: 17,
                    //                       fontWeight: FontWeight.w700),
                    //                 )),
                    //             SizedBox(
                    //               height: 20,
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: TextFormField(
                    //                     controller: Name1Controller,
                    //                     decoration: InputDecoration(
                    //                       border: OutlineInputBorder(
                    //                         borderSide:
                    //                         BorderSide(color: Colors.black),
                    //                         borderRadius: BorderRadius.only(
                    //                           topRight: Radius.circular(10.0),
                    //                           topLeft: Radius.circular(10.0),
                    //                           bottomLeft: Radius.circular(10.0),
                    //                           bottomRight: Radius.circular(10.0),
                    //                         ),
                    //                       ),
                    //                       hintText: 'Topic Name',
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 SizedBox(
                    //                   width: 20,
                    //                 ),
                    //                 Expanded(
                    //                   child: TextFormField(
                    //                     controller: Date1Controller,
                    //                     decoration: InputDecoration(
                    //                       border: OutlineInputBorder(
                    //                         borderSide:
                    //                         BorderSide(color: Colors.black),
                    //                         borderRadius: BorderRadius.only(
                    //                           topRight: Radius.circular(10.0),
                    //                           topLeft: Radius.circular(10.0),
                    //                           bottomLeft: Radius.circular(10.0),
                    //                           bottomRight: Radius.circular(10.0),
                    //                         ),
                    //                       ),
                    //                       hintText: 'Date/Time',
                    //                     ),
                    //                     // onTap: () async{
                    //                     //   FocusScope.of(context).requestFocus(new FocusNode());
                    //                     //   date=await showDatePicker(
                    //                     //       context: context,
                    //                     //       initialDate: DateTime.now(),
                    //                     //       firstDate: DateTime(2010),
                    //                     //       lastDate: DateTime(2040));
                    //                     // },
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 20,
                    //             ),
                    //             Center(
                    //               child: Text(
                    //                 announcementDetailf,
                    //                 style: TextStyle(
                    //                     color: Colors.black, fontSize: 17),
                    //               ),
                    //             ),
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //             TextFormField(
                    //               controller: announceController,
                    //               decoration: InputDecoration(
                    //                 border: OutlineInputBorder(
                    //                   borderSide: BorderSide(color: Colors.black),
                    //                   borderRadius: BorderRadius.only(
                    //                     topRight: Radius.circular(10.0),
                    //                     topLeft: Radius.circular(10.0),
                    //                     bottomLeft: Radius.circular(10.0),
                    //                     bottomRight: Radius.circular(10.0),
                    //                   ),
                    //                 ),
                    //               ),
                    //               maxLines: 5,
                    //             ),
                    //             SizedBox(
                    //               height: 30,
                    //             ),
                    //             Center(
                    //               child: MaterialButton(
                    //                 elevation: 5,
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(20.0))),
                    //                 minWidth:
                    //                 MediaQuery.of(context).size.width / 3,
                    //                 height: 40,
                    //                 color: Color(0xffF03508c),
                    //                 onPressed: () {
                    //                   dar.add({
                    //                     "title1": NameController.text,
                    //                     "date": DateController.text,
                    //                     "detail": announceController.text,
                    //                   });
                    //                   // print(dar.toString());
                    //                   setState(() {
                    //                     Navigator.pop(context);
                    //                   });
                    //                 },
                    //                 child: Text(
                    //                   Add,
                    //                   style: TextStyle(color: Colors.white),
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   );
                    // },
                    // child: Icon(Icons.add),
                  );
          },
          child: Icon(icadd),
          //var index;
          //     indexTab== 0
          //         ? showDialog(
          //             context: context,
          //             builder: (context) => SimpleDialog(
          //               shape: RoundedRectangleBorder(
          //                   borderRadius:
          //                       BorderRadius.all(Radius.circular(20.0))),
          //               contentPadding: EdgeInsets.all(50.0),
          //               insetPadding: EdgeInsets.symmetric(
          //                 vertical: 120,
          //               ),
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Center(
          //                         child: Text(
          //                       'New Task',
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: 17,
          //                           fontWeight: FontWeight.w700),
          //                     )),
          //                     SizedBox(
          //                       height: 20,
          //                     ),
          //                     Row(
          //                       children: [
          //                         Expanded(
          //                           child: TextFormField(
          //                             controller: NameController,
          //                             decoration: InputDecoration(
          //                               border: OutlineInputBorder(
          //                                 borderSide:
          //                                     BorderSide(color: Colors.black),
          //                                 borderRadius: BorderRadius.only(
          //                                   topRight: Radius.circular(10.0),
          //                                   topLeft: Radius.circular(10.0),
          //                                   bottomLeft: Radius.circular(10.0),
          //                                   bottomRight: Radius.circular(10.0),
          //                                 ),
          //                               ),
          //                               hintText: 'Topic Name',
          //                             ),
          //                           ),
          //                         ),
          //                         SizedBox(
          //                           width: 20,
          //                         ),
          //                         Expanded(
          //                           child: TextFormField(
          //                             controller: DateController,
          //                             decoration: InputDecoration(
          //                               border: OutlineInputBorder(
          //                                 borderSide:
          //                                     BorderSide(color: Colors.black),
          //                                 borderRadius: BorderRadius.only(
          //                                   topRight: Radius.circular(10.0),
          //                                   topLeft: Radius.circular(10.0),
          //                                   bottomLeft: Radius.circular(10.0),
          //                                   bottomRight: Radius.circular(10.0),
          //                                 ),
          //                               ),
          //                               hintText: 'Enter Date',
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                     SizedBox(
          //                       height: 20,
          //                     ),
          //                     TextFormField(
          //                       controller: TaskController,
          //                       decoration: InputDecoration(
          //                         border: OutlineInputBorder(
          //                           borderSide: BorderSide(color: Colors.black),
          //                           borderRadius: BorderRadius.only(
          //                             topRight: Radius.circular(10.0),
          //                             topLeft: Radius.circular(10.0),
          //                             bottomLeft: Radius.circular(10.0),
          //                             bottomRight: Radius.circular(10.0),
          //                           ),
          //                         ),
          //                         hintText: 'Enter Task',
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 20,
          //                     ),
          //                     TextFormField(
          //                       controller: dueDateController,
          //                       decoration: InputDecoration(
          //                         border: OutlineInputBorder(
          //                           borderSide: BorderSide(color: Colors.black),
          //                           borderRadius: BorderRadius.only(
          //                             topRight: Radius.circular(10.0),
          //                             topLeft: Radius.circular(10.0),
          //                             bottomLeft: Radius.circular(10.0),
          //                             bottomRight: Radius.circular(10.0),
          //                           ),
          //                         ),
          //                         hintText: 'Enter Due Date/Time',
          //                       ),
          //                     ),
          //                     SizedBox(
          //                       height: 30,
          //                     ),
          //                     Center(
          //                       child: MaterialButton(
          //                         elevation: 5,
          //                         shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.all(
          //                                 Radius.circular(20.0))),
          //                         minWidth:
          //                             MediaQuery.of(context).size.width / 3,
          //                         height:
          //                             MediaQuery.of(context).size.height / 15,
          //                         color: Color(0xffF03508c),
          //                         onPressed: () {
          //                           Ad.add({
          //                             "title": NameController.text,
          //                             "date": DateController.text,
          //                             "detail": TaskController.text,
          //                             "date1": dueDateController.text,
          //                           });
          //                           // print(dar.toString());
          //                           setState(() {
          //                             Navigator.pop(context);
          //                           });
          //                         },
          //                         child: Text(
          //                           Add1,
          //                           style: TextStyle(color: Colors.white),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           )
          //         : showDialog(
          //             context: context,
          //             builder: (context) => Container(
          //               width: 700,
          //               height: 100,
          //               color: Colors.red,
          //             ),
          //           );
          //   },*/
          //   // child: Icon(Icons.add),
          // ),
          // body: TabBarView(
          //   children:[ ListView.builder(
          //       itemCount: Ad.length,
          //       itemBuilder: (context,index){
          //         return commonContainer(context,index);
          //       }),
          //     ListView.builder(
          //         itemCount: dar.length,
          //         //scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           return commanContainer1(context, index);
          //         }),
          //
          //     ]
          //
          // ),

          /*floatingActionButton: indexTab != 0
              ?
          FloatingActionButton(
                  elevation: 3,
                  backgroundColor: Color(0xffF03508c),
                  onPressed: () {
                    print(indexTab+'aaaa');
                    //var index;
                    String Add1 = 'Add';
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                'New Task',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: NameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        hintText: 'Topic Name',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: DateController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        hintText: 'Enter Date',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: TaskController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  hintText: 'Enter Task',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: dueDateController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  hintText: 'Enter Due Date/Time',
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: MaterialButton(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  minWidth:
                                      MediaQuery.of(context).size.width / 3,
                                  height:
                                      MediaQuery.of(context).size.height / 15,
                                  color: Color(0xffF03508c),
                                  onPressed: () {
                                    Ad.add({
                                      "title": NameController.text,
                                      "date": DateController.text,
                                      "detail": TaskController.text,
                                      "date1": dueDateController.text,
                                    });
                                    // print(dar.toString());
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    Add1,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                )
              :
          FloatingActionButton(
                  elevation: 3,
                  backgroundColor: Color(0xffF03508c),
                  onPressed: () {
                    print(indexTab+"hhh");
                    String Add = 'Add';
                    //date = DateTime.now();
                    String newAnnouncementf = 'New Announcement';
                    String announcementDetailf = 'Announcement Detail';
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Text(
                                newAnnouncementf,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              )),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: Name1Controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        hintText: 'Topic Name',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: Date1Controller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                            bottomRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        hintText: 'Date/Time',
                                      ),
                                      // onTap: () async{
                                      //   FocusScope.of(context).requestFocus(new FocusNode());
                                      //   date=await showDatePicker(
                                      //       context: context,
                                      //       initialDate: DateTime.now(),
                                      //       firstDate: DateTime(2010),
                                      //       lastDate: DateTime(2040));
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: Text(
                                  announcementDetailf,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: announceController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: MaterialButton(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  minWidth:
                                      MediaQuery.of(context).size.width / 3,
                                  height: 40,
                                  color: Color(0xffF03508c),
                                  onPressed: () {
                                    dar.add({
                                      "title1": NameController.text,
                                      "date": DateController.text,
                                      "detail": announceController.text,
                                    });
                                    // print(dar.toString());
                                    setState(() {
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    Add,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),*/
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              ListView.builder(
                  itemCount: MyDataBase.examdata.length,
                  itemBuilder: (context, index) {
                    return commonContainer(context, index);
                  }),
              ListView.builder(
                  itemCount: MyDataBase.resultdata.length,
                  //scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return commanContainer1(context, index);
                  }),
            ]),
      ),
    );
  }

  void _handlerTAbSelection() {
    if (tabController!.indexIsChanging) {
      setState(() {
        currentIndex = tabController!.index;
      });
    }
  }
}
