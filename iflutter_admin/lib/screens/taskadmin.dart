import 'package:flutter/material.dart';
import 'package:untitled/network/db.dart';
import 'package:untitled/utils/colors.dart';
import 'package:untitled/utils/icons.dart';
import 'package:untitled/utils/strings.dart';

class TaskAdmin extends StatefulWidget {
  const TaskAdmin({Key? key}) : super(key: key);

  @override
  _TaskAdminState createState() => _TaskAdminState();
}

class _TaskAdminState extends State<TaskAdmin> {
  @override
  void initState() {
    super.initState();
    MyDataBase.selectDatatask().then((value) {
      setState(() {});
    });
  }

  // File? img;
  //
  // selectImage(index) async {
  //   final ImagePicker _picker = ImagePicker();
  //   // Pick an image
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   img = File(image!.path);
  //   Ad[index]['image'] = basename(img!.path);
  //   setState(() {});
  //}
  Map selectedtaskdata = {};

  Widget commonContainer(context, index) {
    // Ad.clear();
    return Card(
      elevation: 4,
      color: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: black12, width: 2)),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width / 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                  children: [Text('aaaaaaaaaaaaaaaaaaaaaa')],
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(

                  title: Text(
                    'Topic : ${MyDataBase.taskdata[index]['topicname']}',
                    // Ad[index]['title'],
                    style: TextStyle(color: black, fontSize: 18),
                  ),
                  trailing: Text(
                    'Date : ${MyDataBase.taskdata[index]['date']}',
                    style: TextStyle(color: black, fontSize: 18),
                  ),
                  //subtitle: Text(data1[index]['detail'],style: TextStyle(color: Colors.grey, fontSize: 12,),),
                ),
                Center(
                    child: Text(
                  'Task : ${MyDataBase.taskdata[index]['task']}',
                  style: TextStyle(color: grey, fontSize: 13),
                )),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    'Duedate : ${MyDataBase.taskdata[index]['duedate']}',
                    style: TextStyle(color: black, fontSize: 13),
                  ),
                ),
                SizedBox(height: 17),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    height: 40,
                    color: blue,
                    onPressed: () {
                      setState(() {
                        MyDataBase.deleteDatatask(
                            keyvalue: MyDataBase.taskdata[index]['key']);
                        MyDataBase.taskdata.removeAt(index);
                      });
                    },
                    child: Text(
                      delete,
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
                /* ListTile(
                  onTap: () {
                    MyDataBase.deleteDatatask(
                        keyvalue: MyDataBase.taskdata[index]['key']);
                    selectedtaskdata.clear();
                    selectedtaskdata = MyDataBase.taskdata[index];
                    setState(() {});
                  },
                  title: MaterialButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    minWidth: MediaQuery.of(context).size.width / 3,
                    height: 40,
                    color: blue,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                          children: [],
                      ),
                      );
                      // selectImage(index);
                    },
                    child: Center(
                      child: Text(
                        showtask,
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                  trailing: MaterialButton(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    height: 40,
                    color: blue,
                    onPressed: () {
                      setState(() {
                        MyDataBase.deleteDatatask(
                            keyvalue: MyDataBase.taskdata[index]['key']);
                        MyDataBase.taskdata.removeAt(index);
                      });
                    },
                    child: Text(
                      delete,
                      style: TextStyle(color: white),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    TextEditingController DatetController = TextEditingController();
    TextEditingController TaskController = TextEditingController();
    TextEditingController dueDateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text(
          task,
          style: TextStyle(color: white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            arrowback,
            color: white,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: MyDataBase.taskdata.length,
          itemBuilder: (context, index) {
            return commonContainer(context, index);
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: blue,
        onPressed: () {
          //var index;
          date1 = DateTime.now();
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
                      newTask,
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
                              hintText: topicName,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: DatetController,
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
                              hintText: enterDate,
                            ),
                            onTap: () async {
                              DateTime? Selecteddatet = await showDatePicker(
                                  context: context,
                                  initialDate: date1!,
                                  firstDate: DateTime(2010),
                                  lastDate: DateTime(2077));
                              odate = Selecteddatet!.day.toString();
                              omonth = Selecteddatet.month.toString();
                              oyear = Selecteddatet.year.toString();
                              setState(() {
                                DatetController.text =
                                    odate + ' / ' + omonth + ' / ' + oyear;
                              });
                            },
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
                          borderSide: BorderSide(color: black),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        hintText: enterTask,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: dueDateController,
                      decoration: InputDecoration(
                        prefix: Text('Due : '),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: black),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        hintText: enterDueDateTime,
                      ),
                      onTap: () async {
                        DateTime? Selecteddatet = await showDatePicker(
                            context: context,
                            initialDate: date1!,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2077));
                        odate = Selecteddatet!.day.toString();
                        omonth = Selecteddatet.month.toString();
                        oyear = Selecteddatet.year.toString();
                        setState(() {
                          dueDateController.text =
                              odate + ' / ' + omonth + ' / ' + oyear;
                        });
                      },
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
                        color: blue,
                        onPressed: () {
                          // Ad.add({
                          //   "title": NameController.text,
                          //   "date": DatetController.text,
                          //   "detail": TaskController.text,
                          //   "date1": dueDateController.text,
                          // });
                          // print(dar.toString());
                          MyDataBase.insertdatatask(
                            topicname: NameController.text,
                            date: DatetController.text,
                            task: TaskController.text,
                            duedate: dueDateController.text,
                          );
                          MyDataBase.selectDatatask().then((value) {
                            setState(() {});
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          Add,
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
