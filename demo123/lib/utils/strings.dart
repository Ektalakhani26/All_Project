// login page

import 'dart:io';

// import 'package:demo123/screens/gallery.dart';
import 'package:demo123/screens/gallery.dart';
import 'package:flutter/material.dart';
import 'package:demo123/screens/login.dart';
import 'package:demo123/utils/icons.dart';

String pass = '';
String user = '';
String emailcon = '';
String enterpassword = 'Enterpassword';
String wlcflt = 'WelCome To IFLUTTER ';
String plsenteruser = 'Please Enter Email';
String plsenterpass = 'Please Enter Password';
String enterurunm = 'Enter Your Email';
String enterurpass = 'Enter Your Password';
String enterfee = 'Enter Fees';

// rform
String nmtitle = 'Name';
String fullnm = 'Enter fullname';
String enteradd = 'Enter Address';
String addtitle = 'Address';
String emailtitle = 'Email';
String enteremail = 'Enter Email';
String plsentervalidnumber = 'Please Enter Valid Number';
String entermini10num = 'Enter Minimum 10 Number';
String entermob = 'Enter MobileNumber';
String mobnum = 'Mobile Number';
String enterfatnum = 'Enter fathernumber';
String fathnum = 'Fathernumber';
String gendertitle = 'Gender :';
String male = 'Male';
String female = 'Female';
String entercity = 'Enter City';
String city = 'City';
String enterstate = 'Enter state';
String feedback11='feedback form';
String feedbackform12='enter details';
String state = 'State';
String entercountry = 'Enter Country';
String country = 'Country';
String enterminisix = 'Enter Minimum 6 Number';
//String country = 'Country';
String enterpin = 'Enter PinCode';
String pin = 'PinCode';
String bloodtitle = 'BlOOD GROUP :';
String unm = 'Email';
String password = 'Password';
String login = 'LOGIN';
String forgoturpass = 'Forgot Your Password ?';
String resethere = 'Reset Here';
String donthaveac = 'Don\'t Have an Account ?';
String registerhere = 'Register Here';
String college = 'enter college name';
String clg = 'College';
String uploadprofile='upload profile';

//code
String verifycode = 'Verify Code';
String verificationcode = 'Verfication Code';
String resendotp = 'Resend OTP ?';

//forgot pass
String forgotpass = 'Forgot Password';
String description =
    'Enter your Email Id for the verification process.we will send 4 digit code to your Mobile No.';
String enteruremail = 'Enter Your Email';
String email = 'Email';
String sendotp = 'Send OTP';

//password
String resetpass = 'Reset Password';
String enterpass = 'Enter Password :';
String reenterpass = 'Re-Enter Password :';
String confirmpass = 'Confirm Password';
String save = 'SAVE';

// validation
String? validatePassword(val) {
  print(val);
  RegExp regex = RegExp(r'^((?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%&*]{6,20})$');
  if (val.isEmpty) {
    return plsenterpass;
  } else {
    if (!regex.hasMatch(val)) {
      return 'must use ex. Abc@1234 , minimum 8 character';
    } else {
      return null;
    }
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}

//dashboard
String nm = 'Gangani Jinal Vinodbhai ';
String address = '115,bhaktinandan soc,motavarachha';
String ifl = 'iFLUTTER';
String stud = 'demo123';
String profile = 'Profile';
String changepass = 'Change Password';
String abtcmp = 'About Company';
String digiid = 'Digital ID';
String feedbackform ='FeedbackForm';
String feedback='Feedback';
String logout = 'Log Out';
String surelogout = 'Are You Sure To Logout?';
String yes = 'Yes';
String no = 'No';
String attendance = 'Attendance';
String notice = 'Notice';
String task = 'Task';
String material = 'Material';
String exam = 'Exam';
String result = 'Result';
String examresult = 'Exam & Result';
String certificate = 'Certificate';
String gallery = 'Gallery';
String fees = 'Fees';
String IFlutter = 'IFlutter';
String FeesSummery = 'Fees Summery';
String Ammount1 = '37500/-';
String Total = 'Total';
String Ammount = 'Amount';
String Paid = 'Paid';
String View = 'View';
String ReceiptDetails = 'Receipt Details';
String ReceiptNo = 'Receipt No :';
String Remain = 'Remain';
String Ammount3 = '0/-';
String enteramt = 'Enter Amount';
String processtopay = 'Process to Pay';
String dashBord = 'DASHBOARD';
String selectfile = 'Select File';
String submit ='Submit';

//profile pro1
String editprofile = 'Edit Profile';

//cpass
String oldpasswordtitle = 'Old Password: ';
String oldpassword = 'Old Password';
String newpasswordtitle = 'New Password: ';
String newpassword = 'New Password';
String reenterpassword = 'Re-Enter Password';
String resetsuccess = 'Your Password Reset successfully';
//att
String present = 'Present';
String absent = 'Absent';
//task
String upload = 'Upload';
String update = 'Update';
String Submit = 'Submit';
String delete = 'Delete';

//slist
String slst = 'demo123 List';
String detail = 'Detail';

//cpass
String rpass = 'CHANGE PASSWORD';
String opass = 'Old password :';
String npass = 'New password :';
String rnpass = 'Re-Enter New password : ';
String rbtn = 'RESET ';

//rform
String odate = 'DD';
String omonth = 'MM';
String oyear = 'YYYY';
String? cdate;
String? cmonth;
String? cyear;
DateTime? date;

String f = '1';
String m = '2';
String gen = '';

String h1 = 'Female';
String h2 = 'Male';
String abc = 'PROJECT';

var items = ['PROJECT', 'INTERMEDIATE', 'EXPERT'];

String xyz = 'A+';

var item1 = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

String daycelebration = 'Day Celebration';
String event = 'Event';
String foreigntour = 'Foreign tour';
String opasscp = '';
String newpasscp = '';
String repasscp = '';
String otpp1 = '';
String otpp2 = '';
String otpp3 = '';
String otpp4 = '';
String npasspass = '';
String confpasspass = '';

String information = 'information';
String Name = 'Name  :  chandegara swati mansukhbhai';
String Course = 'Course  :  Flutter';
String Mobileno = 'Mobile no  :  9908988777';

String dobid = '20/04/2003';
String courseid = 'intermediate';
String contactnoid = '9898075634';
String nameid = 'Dankhara Bansi Makodbhai';
String addressid = '115,bhaktinandan soc,motavarachha';

String dobtitle = 'DOB :';
String coursetitle = 'Course :';
String contnotitle = 'Contact No :';
String Img = 'Images';

//id
String dob = 'D O B';
String demo123 = 'demo123';
String admin = 'Admin';
//String opass = '';
String newpass = '';
String repass = '';
bool passChange0 = true;
bool passChange1 = true;
bool passChange2 = true;
String pass1 = '';
String user1 = '';
String oldpassword1 = 'Old Password:';
String changePassword = 'change password';

//SlistAdmin
String demo123Detail = 'demo123 Detail';
//AdminTaskSide

String Add = 'Add';
String newTask = 'New Task';
String topicName = 'Topic Name';
String enterDate = 'Enter date';
String enterTask = 'Enter Task';
String enterDueDateTime = 'Enter Due Date/Time';
DateTime? date1;
//Announcement Admin
String newAnnouncement = 'New Announcement';
String announcementDetail = 'Announcement Detail';
String uploadF = 'Upload';
String Announcement = 'Announcement';
String Add1 = 'Add';
String dateTime = 'Date';
String topicNamef = 'Topic Name';
String newAnnouncementf = 'New Announcement';
String announcementDetailf = 'Announcement Detail';
String topicNameF = 'Topic Name';
String dateTimeF = 'Date/Time';
//FeesSide
String Fees = 'Fees';
String TotalAmmount = 'Total';
String TAmmount = 'Amount';
String PaidAmmount = 'Paid';
String PAmmount = 'Amount';
String RemainAmmount = 'Remain';
String RAmmount = 'Ammount';
String Upload = 'Upload';
String ReceiptDetail = 'Receipt Detail';
String No1 = '37500/-';
String Date = '05/01/2022';
//Borsher
String images1 = 'Images';
//Certificate
String certi1 = '';
String enterName = 'Enter Name';
String ok = 'ok';

String addLink = 'Add Link';
String addLink1 = 'Add Link';
//gallery
String Gallery1 = 'Gallery';
String images = 'Images';
String AddTitleName = 'Add title name';
String cancel = 'cancel';
String Add3 = 'Add';
String Titlename = 'Title name';
String giveyourtitlename = 'give your title name';
//attendence

///rform
String userEmail = '';
Map profile1 = {
  // 'Name ': 'Gangani Jinal Vinodbhai',
  // 'Address ': 'D - 303, SAI HEIGHTS , UTRAN ',
  // 'Email ': 'jinalgangani.99@gmail.com ',
  // 'Mobile': '8511516706',
  // 'FathersNumber': '8469495245',
  // 'Gender ': 'Female',
  // 'City ': 'Surat',
  // 'State ': 'Gujrat',
  // 'Country ': 'India',
  // 'PinCode ': '394105',
  // 'Course ': 'Expert',
  // 'Bloodgroup': 'O+',
};

//profilr
List<Map> dataprofile = [
  {'title': 'Name ', 'title1': 'Gangani Jinal Vinodbhai'},
  {'title': 'Address ', 'title1': 'D - 303, SAI HEIGHTS , UTRAN '},
  {'title': 'Email ', 'title1': 'jinalgangani.99@gmail.com '},
  {'title': 'Mobile Number ', 'title1': '8511516706'},
  {'title': 'Father\'s Number ', 'title1': '8469495245'},
  {'title': 'Gender ', 'title1': 'Female'},
  {'title': 'City ', 'title1': 'Surat'},
  {'title': 'State ', 'title1': 'Gujrat'},
  {'title': 'Country ', 'title1': 'India'},
  {'title': 'PinCode ', 'title1': '394105'},
  {'title': 'Course ', 'title1': 'Expert'},
  {'title': 'Blood Group ', 'title1': 'O+'},
];
//sli
List<Map> mmm = [
  {'title': 'project'},
  {'title': 'intermidiate'},
  {'title': 'expert'}
];

List data = [
  {'image': 'assett/XYZ.jpg'},
  {'image': 'assett/ABC.jpg'},
  {'image': 'assett/join.jpg'},
];

List<Map> lst = [
  {
    'title': 'Name : Gangani Jinal Vinodbhai',
    'clg': 'College : Sutex Bank College ',
    'course': 'Course : Project'
  },
  {
    'title': 'Name : Gangani Jinal Vinodbhai',
    'clg': 'College : Sutex Bank College ',
    'course': 'Course : Project'
  }
];

List<Map> datamaterial = [
  {'title': 'project'},
  {'title': 'intermidiate'},
  {'title': 'expert'}
];

List<Map> datanotice = [
  // {
  //   'icondata': icnotification,
  //   'title': 'paytm postpaid',
  //   'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
  // },
  // {
  //   'icondata': icnotification,
  //   'title': 'paytm ',
  //   'detail': 'hbgjhjklklhgghdfgyhguj'
  // },
  // {'icondata': icnotification, 'title': 'postpaid', 'detail': 'vfyhguj'},
  // {
  //   'icondata': icnotification,
  //   'title': 'pytmstpaid',
  //   'detail': 'holiday all day'
  // },
  // {'icondata': icnotification, 'title': 'stpaid', 'detail': 'come fast'},
];
List<Map> datatask = [
  {
    'title': 'ListVeiw Pratice',
    'date': '11/01/2022',
    'date1': 'Due 11/01/2022| 23:59',
    'detail': 'pratice example listveiw  builder,listveiw seperated',
  },
  {
    'title': 'Gridveiw Example',
    'date': '23/01/2022',
    'date1': 'Due 11/01/2022| 23:59',
    'detail': 'pratice example listveiw  builder,listveiw seperated',
  },
  {
    'title': 'on Paper design',
    'date': '01/02/2022',
    'date1': 'Due 11/01/2022| 23:59',
    'detail': 'pratice example listveiw  builder,listveiw seperated',
  },
];
List<Map> dataexam = [
  {
    'title': 'ListVeiw ',
    'date': '11/01/2022',
    'time': ' 10:00 AM to 11:00 AM ',
    'link':
        'https://us02web.zoom.us/j/2415265577?pwd=V29XNHZlQ2l5UndoN2ljZmlWZlVQZz09#success',
  },
  {
    'title': 'Gridveiw Example',
    'date': '23/01/2022',
    'time': ' 10:00 AM to 11:00 AM ',
    'link':
        'https://us02web.zoom.us/j/2415265577?pwd=V29XNHZlQ2l5UndoN2ljZmlWZlVQZz09#success',
  },
  {
    'title': 'on Paper design',
    'date': '01/02/2022',
    'time': ' 10:00 AM to 11:00 AM ',
    'link':
        'https://us02web.zoom.us/j/2415265577?pwd=V29XNHZlQ2l5UndoN2ljZmlWZlVQZz09#success',
  },
];
List<Map> dataresult = [
  {
    'icondata': icnotification,
    'title': 'paytm postpaid',
    'detail': 'hbgjhjklklhgghdfgcvhjhnklnjvfyhguj'
  },
  {
    'icondata': icnotification,
    'title': 'paytm ',
    'detail': 'hbgjhjklklhgghdfgyhguj'
  },
  {
    'icondata': icnotification,
    'title': 'postpaid',
    'detail': 'vfyhguj',
  },
  {
    'icondata': icnotification,
    'title': 'pytmstpaid',
    'detail': 'holiday all day',
  },
  {'icondata': icnotification, 'title': 'stpaid', 'detail': 'come fast'},
];

List<Map> datagallery = [
  {
    'title': daycelebration,
    'onPressed ': Day(''),
  },
  {
    'title': event,
    'onPressed ': Event(),
  },
  {
    'title': foreigntour,
    'onPressed ': FTour(),
  },
];
List dataday = [
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
  {
    'image': 'assett/picnic.jpg',
  },
];
List dataevent = [
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
];
List dataftour = [
  {
    'image': 'assett/cel.jpg',
  },
  {
    'image': 'assett/cel.jpg',
  },
  {
    'image': 'assett/cel.jpg',
  },
  {
    'image': 'assett/cel.jpg',
  },
  {
    'image': 'assett/cel.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
  {
    'image': 'assett/123.jpg',
  },
];
//adminannou
List<Map> dar = [];

//task
List<Map> Ad = [];

//
List<File> datab = [];

//gall
List image = [];

List<Map> dataadgallery = [
  {
    'title': 'Day Celebration',
    'image': [],
  },
];
