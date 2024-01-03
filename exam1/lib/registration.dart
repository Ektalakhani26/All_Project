import 'package:exam1/abc.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var _fname=TextEditingController();
  var _sname=TextEditingController();
  var _email=TextEditingController();
  var _mobleno=TextEditingController();
  var _ps=TextEditingController();
  var _rep=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var a=false;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Scaffold(
          appBar: AppBar(title: Text('Registration'),backgroundColor: Colors.black12),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text('Registration Page',style: TextStyle(color: Colors.pink,fontSize: 40,fontWeight: FontWeight.w900)),
                  // Image(image: AssetImage('assets/resgistration.png')),
                  Padding(
                    padding: EdgeInsets.all(10),
                     child:TextFormField(
                       controller: _fname,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _sname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'first name',
                        label: Text('surname'),
                        border: OutlineInputBorder(),

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'email',
                        label: Text('Email'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _mobleno,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Number',
                        label: Text('Mobile No'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _ps,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('password'),
                        suffixIcon: InkWell(
                          onTap: () {
                            a=a!;
                            setState(() {

                            });
                          },
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                        hintText: ('enter password'),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _rep,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Reset password',
                        label: Text('Reset pssw'),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.purple.shade700),),
                    onPressed: () {
                    if(_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')),
                      );
                    }
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => abc(),));
                  }, child: Text('Registration'),
                  ),

                ],
              ),
            ),
          ),
        ),
    );
  }
}
