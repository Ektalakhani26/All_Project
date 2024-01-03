
import 'package:flutter/material.dart';

import '../model.dart';
import 'loginScreen.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var _user = TextEditingController();
  var _passwo = TextEditingController();
  var _reset = TextEditingController();
  var _mobileno = TextEditingController();
  var _email = TextEditingController();
  var passwo = true;
  var reset = true;

  var formKey = GlobalKey<FormState>();
  List<form1> formlist =[];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    width: size.width,
                    child: Image(image: AssetImage('assets/background.jpg'),fit: BoxFit.fill,),
                  ),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text('Registration',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: _user,
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return  'enter the value';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text('username'),
                                hintText: 'username',
                                prefixIcon: Icon(Icons.person_outline_rounded),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: _email,
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'enter the value';
                                }
                                else if(RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                                  return null;
                                } else
                                {
                                  return 'enter valid email';
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Email'),
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: _mobileno,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                var mno=value;
                                if(mno==null || mno.isEmpty){
                                  return 'enter the value';
                                }
                                else if(mno.length != 10){
                                  return 'please enter 10 digit';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text('Mobile No'),
                                hintText: 'Mobile No',
                                prefixIcon: Icon(Icons.call),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: _passwo,
                              validator: (value) {
                                RegExp re=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!#?$*@~]).{8,}$');
                                var ps=value;
                                if(ps==null || ps.isEmpty){
                                  return 'enter the number';
                                }
                                else if(ps.length <7){
                                  return 'enter minimum 7 charater';
                                }
                                else if(!re.hasMatch(ps)){
                                  return 'password contain uper case';
                                }
                                return null;
                              },
                              obscureText: passwo,
                              decoration: InputDecoration(
                                label: Text('Password'),
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.vpn_key_outlined),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {

                                    });
                                    passwo = !passwo;
                                  },
                                  child: Icon(passwo ? Icons.visibility_off_outlined : Icons.visibility, color: Colors.red),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: TextFormField(
                              controller: _reset,
                              validator: (value) {
                                if(value==null || value.isEmpty){
                                  return 'enter the value';
                                }
                                else if(value != _passwo.text){
                                  return 'password are not same';
                                }
                                return null;
                              },
                              obscureText: reset,
                              decoration: InputDecoration(
                                label: Text('Conform password'),
                                hintText: 'Conform',
                                prefixIcon: Icon(Icons.vpn_key_outlined),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {

                                    });
                                    reset = !reset;
                                  },
                                  child: Icon(reset ? Icons.visibility_off_outlined : Icons.visibility , color: Colors.red),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(200)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white54),),
                              onPressed: () async {
                                formlist.add(form1(_email, _passwo));
                                if(formKey.currentState!.validate()){
                                  form1(_email,_passwo);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage.Mydata(username1: _email.text , password1: _passwo.text)));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Registration complete')),
                                  );
                                }
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => Login1(),));
                              }, child: Text('\t\t\t\t\t\tRegister\t\t\t\t\t\t',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
