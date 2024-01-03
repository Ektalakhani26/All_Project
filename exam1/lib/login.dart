import 'package:exam1/book/form.dart';
import 'package:exam1/registration.dart';
import 'package:exam1/welcom.dart';
import 'package:flutter/material.dart';
import 'Theme/themedata.dart';
import 'abc.dart';

class login extends StatefulWidget {
   login({Key? key}) : super(key: key);
 var username1;
 var password1;


 login.Mydata({required this.username1, required this.password1});

  @override
  State<login> createState() => _loginState(username1,password1);

}

class _loginState extends State<login> {

  var username1;
  var password1;
  _loginState(this.username1,this.password1);

  final _formKey = GlobalKey<FormState>();
  var value1=false;
  var password=true;
  //var usename=true;
  var gender='male';
  var _name=TextEditingController();
  var _password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Scaffold(
          appBar: AppBar(title: Text('login page'),),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Image(image: AssetImage('assets/login.jpg')),
                  // Text('sign up',style: Theme.of(context).textTheme.bodyLarge),
                 // Text('sign up',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.deepPurpleAccent,fontSize: 35)),
                   Text('sign up',style: myTextstyle30()),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        hintText: 'enter name',
                        label: Text('name'),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty)
                          {
                            return 'enter value';
                          }
                        else if(username1 != _name.text){
                          return 'username are not same';
                        }
                        return null;
                        // if(value != _name.text)
                        //   return 'value are not same';
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _password,
                      onChanged: (value) {
                        _password = value as TextEditingController;
                      },
                      validator:  (value) {
                        if(value == null || value.isEmpty)
                        {
                          return 'enter value';
                        }
                        else if(password1 != _password.text){
                          return 'password are not same';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('password'),
                        suffixIcon: InkWell(
                          onTap: _passWord,
                          child: Icon(password ? Icons.visibility_off : Icons.visibility ,color: Colors.blue,),
                        ),
                        //icon: Icon(Icons.remove_red_eye_outlined),
                        hintText: ('enter password'),
                      ),
                      obscureText: password,
                    ),
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: value1,
                        onChanged: (value) {
                          value1=value!;
                          setState(() {

                          });
                        },
                      ),

                      Text('Accept Terms & Conditions'),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('username = ${_name.text}');
                      print('password = ${_password.text}');
                      // ignore: unrelated_type_equality_checks
                     //form1(_name, _password);
                      if (_formKey.currentState!.validate()) {
                        if(username1 == _name.text && password1 == _password.text) {
                          // if (_name.text != AutofillHints.familyName)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login completed')),
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Welcom(),));
                        }

                      }
                  }, child: Text('Login'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      Text("If you don't have account"),
                      TextButton(
                          onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MyCustomForm(),));
                      }, child: Text('Sign Up',style: TextStyle(color: Colors.blue),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        );

  }

  void _passWord() {
    setState(() {
      password = !password;
    });
  }
}
