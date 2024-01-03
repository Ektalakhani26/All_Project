import 'package:exam1/book/form.dart';
import 'package:exam1/login.dart';
import 'package:exam1/welcom.dart';
import 'package:flutter/material.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {

  //var navigator;

  //MyCustomFormState(this.navigator);

  var formKey = GlobalKey<FormState>();
  bool isHiddenPassword = true ;
  bool resetpassword=true;
  var fname=TextEditingController();
  var _sname=TextEditingController();
  var email=TextEditingController();
  var _mobleno=TextEditingController();
  var ps=TextEditingController();
  var _rep=TextEditingController();

  List<form1> formlist =[];

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: formKey,
      child: Scaffold(
        body: SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child:  Text('Registration',style: TextStyle(fontSize: 50,color: Colors.purple),),
          ),
          Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.all(40),
            child:  Text('Form',style: TextStyle(fontSize: 50,color: Colors.purple),),
          ),
          Padding(
              padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: fname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                label: Text('first name'),
                hintText: 'Name',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                RegExp re2=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
                var us=value;
                if (us == null || us.isEmpty) {
                  return 'Please enter some text';
                }
                else if(!re2.hasMatch(us)){
                  return 'enter uppercase and lowercase';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _sname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Surname'),
                hintText: 'Name',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                RegExp re3=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])');
                var pas=value;
                if (pas == null || pas.isEmpty) {
                  return 'Please enter some text';
                }
                else if(!re3.hasMatch(pas)){
                  return 'enter uppercase and lowercase';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Email'),
                hintText: 'email',
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                else if(RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                  return null;
                } else
                  {
                    return 'enter valid email';
                  }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _mobleno,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Mobile no'),
                hintText: 'Number',
              ),
              // The validator receives the text that the user has entered.
              keyboardType: TextInputType.number,
              validator: (value) {
                RegExp re1=RegExp(r'^(?=.*?[0-9])');
                var mno=value;
                if (mno == null || mno.isEmpty) {
                  return 'Please enter some text';
                }
                else if(mno.length != 10){
                  return 'please enter 10 digit';
                }
                else if(!re1.hasMatch(mno)){
                  return 'must contain number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: ps,
              onChanged: (value) {
                ps = value as TextEditingController;
              },
              obscureText: isHiddenPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Password'),
                hintText: 'password',
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Icon(isHiddenPassword ? Icons.visibility_off : Icons.visibility, color: Colors.blue,),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                RegExp re=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!#?$*@~]).{8,}$');
                var ps=value;
                if (ps == null || ps!.isEmpty) {
                  return 'Please enter some text';
                }
                else if(ps.length<7){
                  return 'password must be more than 5 charater';
                }
                else if(!re.hasMatch(ps)){
                  return 'password must contain upper,lower,special,digit';
                }
                return null;
              },

            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: _rep,
              obscureText: resetpassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Reset password'),
                hintText: 'password',
                suffixIcon: InkWell(
                  onTap: resetpassword1,
                  child: Icon(resetpassword ? Icons.visibility_off : Icons.visibility ,color:  Colors.blue,),
                ),
              ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                else if(value != ps.text) {
                        return 'password are not same';
                }
                  return null;
              },

            ),
          ),

             SizedBox(
               height:50,
             ),
             Padding(
                 padding: EdgeInsets.only(left: 150),
             child: ElevatedButton(
               onPressed: () {
                 formlist.add(form1(email, ps));
                 // Validate returns true if the form is valid, or false otherwise.
                 if (formKey.currentState!.validate()) {
                   form1(fname,ps);
                   Navigator.push(context, MaterialPageRoute(builder: (context) => login.Mydata(username1: fname.text , password1: ps.text)));
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('Registration complete')),
                   );
                 }
               },
               child: Text('Resgistration'),
             ),
             ),
            SizedBox(
              height: 40,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('you are click on ok button'),
              InkWell(
                 onTap: () {
                   print('username=${fname.text}');
                   print('password=${ps.text}');
                   form1(this.fname.text, this.ps.text);
                 },
                child: Text('OK',style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
 }

  void resetpassword1() {
    setState(() {
      resetpassword = !resetpassword;
    });

  }
}