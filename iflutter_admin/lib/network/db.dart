import 'package:firebase_database/firebase_database.dart';
import 'package:untitled/utils/strings.dart';

DatabaseReference db = FirebaseDatabase.instance.ref('Admin');
DatabaseReference dbStudent = FirebaseDatabase.instance.ref('student');

class MyDataBase {
  static Future selectUserData() async {
    // print('----- $email');
    dbStudent
        .child('student')
        .child('profile')
        // .orderByChild('Email')
        // .equalTo(email)
        .once()
        .then((value) {
      Map data =
          value.snapshot.value != null ? value.snapshot.value as Map : {};
      data.forEach((key, value) {
        profile1 = value as Map;
      });
      print('=====$profile1');
    });
  }

//feedback
 static List<Map> feed=[];
  static Future selectDatafeed1() async {
    await dbStudent.child('feedback').once().then((value) {
      Map data = value.snapshot.value as Map;
     // print(data);
      feed = [];
      data.forEach((key, value) {
        feed.add(value);
      });
      print(feed);
    });
  }
  //student list
  static Future selectUserDataStudent() async {
    // print('----- $email');
    dbStudent.child('profile').once().then((value) {
      Map data =
          value.snapshot.value != null ? value.snapshot.value as Map : {};
      studentList.clear();
      data.forEach((key, value) {
        studentList.add(value);
      });
      print('=====$studentList');
    });
  }

  static List<Map> allData = [];

//notice page
  static Future insertdata({
    String topicname = '',
    String date = '',
    String anndetail = '',
    String key = '',
  }) async {
    String? key = db.push().key;
    db.child('Notice').child(key!).set({
      'topicname': topicname,
      'date': date,
      'anndetail': anndetail,
      'key': key
    });
  }

  static Future updateData({
    required String topicname,
    required String date,
    required String anndetail,
    required String key,
  }) async {
    // print(topicname);
    // print(date);
    // print(anndetail);
    // print(key);

    db.child('Notice').child(key).update({
      'topicname': topicname,
      'date': date,
      'anndetail': anndetail,
      // 'key' : key
    });
  }

  static deleteData({String keyvalue = ''}) async {
    await db.child('Notice').child(keyvalue).remove();
  }

  static Future selectData() async {
    await db.child('Notice').once().then((value) {
      Map data = value.snapshot.value as Map;
      // allData.clear();
      allData = [];
      data.forEach((key, value) {
        allData.add(value);
      });
      print(allData);
    });
  }

//taskpage
  static List<Map> taskdata = [];

  static insertdatatask({
    String topicname = '',
    String date = '',
    String task = '',
    String duedate = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db.child('Student List').child('Sdetail').child('Task').child(key!).set({
      'topicname': topicname,
      'date': date,
      'task': task,
      'duedate': duedate,
      'key': key
    });
  }

  static deleteDatatask({String keyvalue = ''}) async {
    await db
        .child('Student List')
        .child('Sdetail')
        .child('Task')
        .child(keyvalue)
        .remove();
  }

  static Future selectDatatask() async {
    await db
        .child('Student List')
        .child('Sdetail')
        .child('Task')
        .once()
        .then((value) {
      Map data = value.snapshot.value as Map;
      // allData.clear();
      taskdata = [];
      data.forEach((key, value) {
        taskdata.add(value);
      });
      print(taskdata);
    });
  }

  // static insertdataexam({
  //   String topicname = '',
  //   String date = '',
  //   String link = '',
  //   String time = '',
  //   String key = '',
  // }) {
  //   'topicname': topicname;
  // }

  static List<Map> examdata = [];

  static insertdataexam({
    String topicname = '',
    String date = '',
    String link = '',
    String time = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db.child('Student List').child('Sdetail').child('exam').child(key!).set({
      'topicname': topicname,
      'date': date,
      'link': link,
      'time': time,
      'key': key
    });
  }

  static deleteDataexam({String keyvalue = ''}) async {
    await db
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .child(keyvalue)
        .remove();
  }

  static Future selectDataexam() async {
    await db
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .once()
        .then((value) {
      Map data = value.snapshot.value as Map;
      // allData.clear();
      examdata = [];
      data.forEach((key, value) {
        examdata.add(value);
      });
      print(examdata);
    });
  }

  static List<Map> resultdata = [];

  static insertdataresult({
    String topicname = '',
    String date = '',
    String mark = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .child('result')
        .child(key!)
        .set({'topicname': topicname, 'date': date, 'mark': mark, 'key': key});
  }

  static deleteDataresult({String keyvalue = ''}) async {
    await db
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .child('result')
        .child(keyvalue)
        .remove();
  }

  static Future selectDataresult() async {
    await db
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .child('result')
        .once()
        .then((value) {
      Map data = value.snapshot.value as Map;
      // allData.clear();
      resultdata = [];
      data.forEach((key, value) {
        resultdata.add(value);
      });
      print(resultdata);
    });
  }

  static updateDataresult({
    required String topicname,
    required String date,
    required String mark,
    required String key,
  }) {
    db
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .child('result')
        .child(key)
        .update({
      'topicname': topicname,
      'date': date,
      'mark': mark,
      'key': '',
    }).then((value) => selectDataresult());
  }

//Gallery

  static List<Map> gallerydata = [];

  static insertdatagallery({
    String gallerytitle = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db.child('Gallery').child(key!).set({
      'gallerytitle': gallerytitle,
      'key': key,
    });
  }

  static deleteDataGallery({String keyvalue = ''}) async {
    await db.child('Gallery').child(keyvalue).remove();
  }

  static Future selectDataGallery() async {
    await db.child('Gallery').once().then((value) {
      Map data = value.snapshot.value as Map;
// galleryData.clear();
      gallerydata = [];
      data.forEach((key, value) {
        gallerydata.add(value);
      });
      print(gallerydata);
    });
  }

  /// Brousherimage
  static List<Map> brousherImagelist = [];

  static Future setBrousherImage(String img) async {
    String key = db.push().key.toString();
    db.child('Brousher').child(key).set({
      'url': img,
      'key': key,
    }).then((value) {
      getBrousherImage();
    });
  }

  static Future getBrousherImage() async {
    db.child('Brousher').once().then((value) {
      Map data = value.snapshot.value as Map;
      brousherImagelist.clear();
      data.forEach((key, value) {
        brousherImagelist.add(value);
      });
    });
  }

  static deleteDatabrousher({String keyvalue = ''}) async {
    await db.child('Brousher').child(keyvalue).remove();
  }

  ///gallery image
  ///
  static List<Map> galleryImagelist = [];

  static Future setGalleryImage(String key1, String img) async {
    String key = db.push().key.toString();
    db.child('Gallery').child(key1).child('Galleryimage').child(key).set({
      'url': img,
      'key': key,
    }).then((value) {
      getGalleryImage(key1);
    });
  }

  static Future getGalleryImage(String key) async {
    db.child('Gallery').child(key).child('Galleryimage').once().then((value) {
      Map data =
          value.snapshot.value != null ? value.snapshot.value as Map : {};
      galleryImagelist.clear();
      data.forEach((key, value) {
        galleryImagelist.add(value);
      });
    });
  }

  static deleteDatagalleryimage({String keyvalue = ''}) async {
    await db.child('Gallery').child('Galleryimage').child(keyvalue).remove();
  }

  static List<Map> allFeesList = [];
  static String paidFees = '0';

  ///GET FEES
  static Future getFees({String studentKey = ''}) async {
    String? key = db.push().key;

    db
        .child('student')
        .child('fees')
        .orderByChild('sid')
        .equalTo(studentKey)
        .once()
        .then((value) {
      Map temp =
          value.snapshot.value != null ? value.snapshot.value as Map : {};
      allFeesList.clear();
      temp.forEach((key, value) {
        allFeesList.add(value as Map);
      });
      int amt = 0;
      allFeesList.forEach((element) {
        amt += int.parse(element['amount'].toString());
      });
      paidFees = amt.toString();
    });
    print('=====$paidFees');
  }

  static Future selectUserDataFee() async {
    // print('----- $email');
    dbStudent.child('fees').once().then((value) {
      Map data =
          value.snapshot.value != null ? value.snapshot.value as Map : {};
      allFeesList.clear();
      data.forEach((key, value) {
        allFeesList.add(value);
      });
      print('=====$allFeesList');
    });
  }

  static List<Map> mlink = [];

  static Future insertdatalink({
    String topic = '',
    String link = '',
    String key = '',
  }) async {
    String? key = db.push().key;
    db
        .child('materiallink')
        .child(key!)
        .set({'topic': topic, 'link': link, 'key': key});
  }

  static Future selectDatalink() async {
    await db.child('materiallink').once().then((value) {
      Map data = value.snapshot.value as Map;
      // allData.clear();
      mlink = [];
      data.forEach((key, value) {
        mlink.add(value);
      });
      print(mlink);
    });
  }

  static Future insertAtt({required List<Map> studentsAtt}) async {
    studentsAtt.forEach((element) {
      String? key = db.push().key;
      db.child('Attendance').child(element['Key']!).child(key!).update({
        'date': DateTime.now().toString(),
        'name': element['Name'],
        'status': element['status'],
        'key': key,
      });
    });
  }
}
