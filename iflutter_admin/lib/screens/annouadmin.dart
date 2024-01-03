import 'package:flutter/material.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class annouadmin extends StatefulWidget {
  @override
  State<annouadmin> createState() => _ListDemoState();
}

class _ListDemoState extends State<annouadmin> {
  // TextEditingController dateController = TextEditingController();
  // TextEditingController topicController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController DateController = TextEditingController();
  TextEditingController announceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // NameController.text = MyDataBase.allData[index]['topicname'];

    MyDataBase.selectData().then((value) {
      setState(() {});
    });
  }

  Map selecteddata = {};

  Widget commanContaineradminannou(context, index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              children: [
                Text('Announcement detail : ${
                  MyDataBase.allData[index]['anndetail']}',
                  // dar[index]['detail'],
                  style: TextStyle(color: black),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: blue, width: 1.0),
            color: white,
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  MyDataBase.deleteData(
                      keyvalue: MyDataBase.allData[index]['key']);
                  selecteddata.clear();
                  selecteddata = MyDataBase.allData[index];
                  setState(() {});
                },
                title: Text('Topicname : ${
                  //dar=NameController.text;
                  MyDataBase.allData[index]['topicname']}',
                  // dar[index]['title1'].toString(),
                  style: TextStyle(color: black),
                ),
                trailing: Text('Date : ${
                  // dar[index]['date'],
                  MyDataBase.allData[index]['date']}',
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      minWidth: MediaQuery.of(context).size.width / 3.5,
                      height: 40,
                      color: blue,
                      onPressed: () {
                        DateController.text = MyDataBase.allData[index]['date'];
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
                                          controller: NameController
                                            ..text = MyDataBase.allData[index]
                                                ['topicname'],
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: black),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0),
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
                                              ),
                                            ),
                                            hintText: topicNamef,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: StatefulBuilder(
                                          builder: (contex, setState) =>
                                              TextFormField(
                                            controller: DateController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(color: black),
                                                borderRadius: BorderRadius.only(
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
                                              hintText: dateTime,
                                            ),
                                            onTap: () async {
                                              DateTime? Selecteddate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: date!,
                                                      firstDate: DateTime(2010),
                                                      lastDate: DateTime(2077));
                                              odate =
                                                  Selecteddate!.day.toString();
                                              omonth =
                                                  Selecteddate.month.toString();
                                              oyear =
                                                  Selecteddate.year.toString();
                                              setState(() {
                                                DateController.text = odate +
                                                    ' / ' +
                                                    omonth +
                                                    ' / ' +
                                                    oyear;
                                                // print(selectedDate);
                                                // data = dobController.text;
                                              });
                                            },
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
                                      announcementDetailf,
                                      style:
                                          TextStyle(color: black, fontSize: 17),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: announceController
                                      ..text = MyDataBase.allData[index]
                                          ['anndetail'],
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
                                      color: blue,
                                      onPressed: () {
                                        MyDataBase.updateData(
                                                topicname: NameController.text,
                                                date: DateController.text,
                                                anndetail:
                                                    announceController.text,
                                                key: MyDataBase.allData[index]
                                                    ['key'])
                                            .then((value) {
                                          MyDataBase.selectData().then((value) {
                                            Navigator.pop(context);
                                            setState(() {});
                                          });
                                        });
                                      },
                                      child: Text(
                                        uploadF,
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                        // MyDataBase.updateData(
                        //     topicname: NameController
                        //     .text,
                        // date: DateController.text,
                        // anndetail: announceController
                        //     .text,
                        // key: selecteddata['key']);

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
                        //                 color: black,
                        //                 fontSize: 17,
                        //                 fontWeight: FontWeight.w700),
                        //           )),
                        //           SizedBox(
                        //             height: 20,
                        //           ),
                        //           Row(
                        //             children: [
                        //               TextFormField(
                        //                 controller: NameController,
                        //                 decoration: InputDecoration(
                        //                   border: OutlineInputBorder(
                        //                     borderSide:
                        //                         BorderSide(color: black),
                        //                     borderRadius: BorderRadius.only(
                        //                       topRight: Radius.circular(10.0),
                        //                       topLeft: Radius.circular(10.0),
                        //                       bottomLeft: Radius.circular(10.0),
                        //                       bottomRight:
                        //                           Radius.circular(10.0),
                        //                     ),
                        //                   ),
                        //                   hintText: topicNameF,
                        //                 ),
                        //               ),
                        //               SizedBox(
                        //                 width: 20,
                        //               ),
                        //               TextFormField(
                        //                 controller: DateController,
                        //                 decoration: InputDecoration(
                        //                   border: OutlineInputBorder(
                        //                     borderSide:
                        //                         BorderSide(color: black),
                        //                     borderRadius: BorderRadius.only(
                        //                       topRight: Radius.circular(10.0),
                        //                       topLeft: Radius.circular(10.0),
                        //                       bottomLeft: Radius.circular(10.0),
                        //                       bottomRight:
                        //                           Radius.circular(10.0),
                        //                     ),
                        //                   ),
                        //                   hintText: dateTimeF,
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
                        //               style:
                        //                   TextStyle(color: black, fontSize: 17),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: 10,
                        //           ),
                        //           TextFormField(
                        //             controller: announceController,
                        //             decoration: InputDecoration(
                        //               border: OutlineInputBorder(
                        //                 borderSide: BorderSide(color: black),
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
                        //             height: 30,),
                        //
                        //         Center(
                        //             child: MaterialButton(
                        //               shape: RoundedRectangleBorder(
                        //                   borderRadius: BorderRadius.all(
                        //                       Radius.circular(20.0))),
                        //               minWidth:
                        //                   MediaQuery.of(context).size.width /
                        //                       2.5,
                        //               height: 40,
                        //               color: blue,
                        //               onPressed: () {
                        //                 setState(() {
                        //                   // MyDataBase.updateData(
                        //                   //   topicname: NameController.text,
                        //                   //   date: DateController.text,
                        //                   //   anndetail: announceController.text,
                        //                   //   keyvalue: selecteddata['key'],
                        //                   // );
                        //                   Navigator.of(context).pop();
                        //                 });
                        //               },
                        //               child: Text(
                        //                 uploadF,
                        //                 style: TextStyle(color: white),
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
                        style: TextStyle(color: white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      minWidth: MediaQuery.of(context).size.width / 3.5,
                      height: 40,
                      color: blue,
                      onPressed: () {
                        // showDialog(
                        //   context: context,
                        //   builder: (context) => AlertDialog(
                        //     content: Text('Are You Sure to Delete'),
                        //     actions: [
                        //       TextButton(onPressed: (){
                        //         Navigator.of(context).pop();
                        //       }, child: Text('cancel',style: TextStyle(color: Color(0xffF03508c)),)),
                        //       TextButton(onPressed: (){
                        //
                        //         // dar.removeAt(index);
                        //         Navigator.of(context).pop();
                        //       }, child: Text('Delete',style: TextStyle(color: Color(0xffF03508c)),))
                        //     ],
                        //   ),
                        // );
                        setState(() {
                          MyDataBase.deleteData(
                              keyvalue: MyDataBase.allData[index]['key']);
                          MyDataBase.allData.removeAt(index);
                        });
                      },
                      child: Text(
                        delete,
                        style: TextStyle(color: white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    TextEditingController DateController = TextEditingController();
    TextEditingController announceController = TextEditingController();

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
        title: Text(Announcement),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: MyDataBase.allData.length,
          //scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return commanContaineradminannou(context, index);
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: blue,
        onPressed: () {
          date = DateTime.now();

          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
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
                                borderSide: BorderSide(color: black),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              hintText: topicNamef,
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
                                borderSide: BorderSide(color: black),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0),
                                ),
                              ),
                              hintText: dateTime,
                            ),
                            onTap: () async {
                              DateTime? Selecteddate = await showDatePicker(
                                  context: context,
                                  initialDate: date!,
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2077));
                              odate = Selecteddate!.day.toString();
                              omonth = Selecteddate.month.toString();
                              oyear = Selecteddate.year.toString();
                              setState(() {
                                DateController.text =
                                    odate + ' / ' + omonth + ' / ' + oyear;
                                // print(selectedDate);
                                // data = dobController.text;
                              });
                            },
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
                        style: TextStyle(color: black, fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: announceController,
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
                      maxLines: 5,
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
                        height: 40,
                        color: blue,
                        onPressed: () {
                          // dar.add({
                          //   "title1": NameController.text,
                          //   "date": DateController.text,
                          //   "detail": announceController.text,
                          // });
                          MyDataBase.insertdata(
                            topicname: NameController.text,
                            date: DateController.text,
                            anndetail: announceController.text,
                          ).then((value) {
                            MyDataBase.selectData().then((value) {
                              setState(() {});
                              Navigator.pop(context);
                            });
                          });
                        },
                        child: Text(
                          Add1,
                          style: TextStyle(color: white),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        child: Icon(icadd),
      ),
    );
  }
}
