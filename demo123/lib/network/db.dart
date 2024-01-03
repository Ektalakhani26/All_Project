import 'dart:io';
import 'dart:typed_data';
import 'package:demo123/utils/strings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

DatabaseReference db = FirebaseDatabase.instance.reference();
DatabaseReference dbAdmin = FirebaseDatabase.instance.reference();

class MyDataBase {

  static List<Map> mlink = [];

  static Future selectDatalink() async {
    await dbAdmin.child('Admin').child('materiallink').once().then((value) {
      Map data = value.value as Map;
      // allData.clear();
      mlink = [];
      data.forEach((key, value) {
        mlink.add(value);
      });
      print(mlink);
    });
  }


  //static DatabaseReference db = FirebaseDatabase.instance.reference();
  ///rform
  static List<Map> rform = [];

  static rinsertdata({
    String Username = '',
    String Password = '',
    String Name = '',
    String Address = '',
    String Email = '',
    String DateOfbirth = '',
    String Personalmobile = '',
    String FathersNumber = '',
    String Gender = '',
    String College = '',
    String City = '',
    String State = '',
    String Country = '',
    String Pincode = '',
    String Course = '',
    String fees = '',
    String Bloodgroup = '',
    String img = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db.child('student').child('profile').child(key).set({
      'Username': Username,
      'Pass': Password,
      'Name': Name,
      'Address': Address,
      'Email': Email,
      'DateOfBirth': DateOfbirth,
      'Personalmobile': Personalmobile,
      'FathersNumber': FathersNumber,
      'gender': h1,
      'College': College,
      'City': City,
      'State': State,
      'Country': Country,
      'Pincode': Pincode,
      'Course': abc,
      'fees': fees,
      'Bloodgroup': xyz,
      'url': img,
      'key': key,
    });
  }
  static Future updateRegister({
    required String key,
    required String Name,
    required String Address,
    required String Email,
    required String Personalmobile,
    required String FathersNumber,
    required String College,
    required String State,
    required String Country,
    required String city,
    required String Pincode,
  }) async {
    await db.child('student').child('profile').child(key).update({
      'Name': Name,
      'Address': Address,
      'Email': Email,
      'Personalmobile': Personalmobile,
      'FathersNumber': FathersNumber,
      'College': College,
      'City': city,
      'State': State,
      'Country': Country,
      'Pincode': Pincode,

    }).then((value) {
      selectUserData(Email);
    });
  }

  static Future selectUserData(String email) async {
    print('----- $email');
    db
        .child('student')
        .child('profile')
        .orderByChild('Email')
        .equalTo(email)
        .once()
        .then((value) {
      Map data = value.value ?? {};
      data.forEach((key, value) {
        profile1 = value as Map;
      });
      FirebaseApi.getFees();
    });

  }
  static List<Map> feed =[];
  static feedinsertdata({
    String feedname = '',

  }) {
    String? key = db.push().key;
    db.child('student').child('feedback').child(key).set({
      'feedname': feedname,

    });
  }

  static Future selectDatafeed() async {
    await db.child('student').child('feedback').once().then((value) {
      Map data = value.value as Map;
      feed = [];
      data.forEach((key, value) {
        feed.add(value);
      });
      print(feed);
    });
  }

  static List<Map> allData = [];

  static insertdata({
    String topicname = '',
    String date = '',
    String anndetail = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db.child('Notice').child(key).set({
      'topicname': topicname,
      'date': date,
      'anndetail': anndetail,
      'key': key
    });
  }

  static updateData({
    required String topicname,
    required String date,
    required String anndetail,
    required String key,
  }) {
    db.child('Profile').child(key).update({
      'topicname': topicname,
      'date': date,
      'anndetail': anndetail,
      'key': '',
    }).then((value) => selectData());
  }

  static deleteData({String keyvalue = ''}) async {
    await db.child('Notice').child(keyvalue).remove();
  }

  static Future selectData() async {
    await db.child('Admin').child('Notice').once().then((value) {
      Map data = value.value as Map;
      allData = [];
      data.forEach((key, value) {
        allData.add(value);
      });
      print(allData);
    });
  }

//taskpage
  static List<Map> taskdata = [];

  //
  static insertdatatask({
    String topicname = '',
    String date = '',
    String task = '',
    String duedate = '',
    String key = '',
  }) {
    String? key = db.push().key;
    db.child('Student List').child('Sdetail').child('Task').child(key).set({
      'topicname': topicname,
      'date': date,
      'task': task,
      'duedate': duedate,
      'key': key
    });
  }

  static deleteDatatask({String keyvalue = ''}) async {
    await db
        .child('Admin')
        .child('Student List')
        .child('Sdetail')
        .child('Task')
        .child(keyvalue)
        .remove();
  }

  static Future selectDatatask() async {
    await db
        .child('Admin')
        .child('Student List')
        .child('Sdetail')
        .child('Task')
        .once()
        .then((value) {
      Map data1 = value.value as Map;
      // allData.clear();
      taskdata = [];
      data1.forEach((key, value) {
        taskdata.add(value);
      });
      print(taskdata);
    });
  }

  ///exam
  static List<Map> examdata = [];
  static Future selectDataexam() async {
    await db
        .child('Admin')
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .once()
        .then((value) {
      Map data = value.value as Map;
      // allData.clear();
      examdata = [];
      data.forEach((key, value) {
        examdata.add(value);
      });
      print(examdata);
    });
  }

  ///result
  static List<Map> resultdata = [];
  static Future selectDataresult() async {
    await db
        .child('Admin')
        .child('Student List')
        .child('Sdetail')
        .child('exam')
        .child('result')
        .once()
        .then((value) {
      Map data = value.value as Map;
      // allData.clear();
      resultdata = [];
      data.forEach((key, value) {
        resultdata.add(value);
      });
      print(resultdata);
    });
  }

  ///profile photo

  static List<Map> profilephotolist = [];

  static Future setprofileImage(String key, String value) async {
    db.child('student').child('profile').child(key).child('url').update({
      'url': value,
    }).then((value) {
    });
  }

}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  ///image
  static List<Map> brousherImagelist = [];

  static getBrousherImage() {
    db.child('Admin').child('Brousher').once().then((value) {
      Map data = value.value as Map;
      brousherImagelist.clear();
      data.forEach((key, value) {
        brousherImagelist.add(value);
      });
    });
  }

  ///Gallery image

  static List<Map> galleryImagelist = [];

  static Future getGalleryImage(String key) async {
    db
        .child('Admin')
        .child('Gallery')
        .child(key)
        .child('Galleryimage')
        .once()
        .then((value) {
      Map data = value.value != null ? value.value as Map : {};
      galleryImagelist.clear();
      data.forEach((key, value) {
        galleryImagelist.add(value);
      });
      print('---${galleryImagelist.length}');
    });
  }

  ///Gallery
  static List<Map> gallerydata = [];

  static Future selectDataGallery() async {
    await db.child('Admin').child('Gallery').once().then((value) {
      Map data = value.value as Map;
// galleryData.clear();
      gallerydata = [];
      data.forEach((key, value) {
        gallerydata.add(value);
      });
      print(gallerydata);
    });
  }

  /// SET FEES
  static Future addFees({
    String studentKey = '',
    String studentName = '',
    String amount = '0',
  }) async {
    String? key = db.push().key;

    db.child('student').child('fees').child(key).set({
      'sid': studentKey,
      'key': key,
      'amount': amount,
      'sName': studentName,
      'date': DateTime.now().toString(),
    });
  }

  static List<Map> allFeesList = [];
  static String paidFees = '0';

  ///GET FEES
  static Future getFees() async {
    print('******$profile1');
    db
        .child('student')
        .child('fees')
        .orderByChild('sid')
        .equalTo(profile1['key'])
        .once()
        .then((value) {
      Map temp = value.value != null ? value.value : {};
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
  }

  static List<Map> attendanceList = [];

  static Future selectAtt() async {
    Map temp = {};
    db.child('Admin').child('Attendance').child(profile1['key']!).once().then((value) {
      temp = value.value != null ? value.value as Map : {};
      attendanceList.clear();
      temp.forEach((key, value) {
        attendanceList.add(value);
      });
      print('////////////////////////////${attendanceList}');
    });
  }
}
