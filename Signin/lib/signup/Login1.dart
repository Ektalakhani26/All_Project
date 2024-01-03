
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin/main.dart';

import '../screen/myntra.dart';
import 'signin.dart';


class Login1 extends StatefulWidget {
  Login1({Key? key}) : super(key: key);
  var username1;
  var password1;
  Login1.Mydata({required this.username1, required this.password1});

  @override
  State<Login1> createState() => _Login1State(username1, password1);
}

class _Login1State extends State<Login1> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  var password = true;
  var username1;
  var password1;

  static const image = "Image";
  var form1 = GlobalKey<FormState>();
  _Login1State(this.username1, this.password1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // savedImage();
  }

  // void savedImage() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var Image = pref.getBool(image);
  //   if(Image != null){
  //
  //   }
//}

  File? _image;
  final _imagepicker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickerImage =
    await _imagepicker.pickImage(source: ImageSource.gallery);
    if(pickerImage != null){
      setState(() {
        _image = File(pickerImage.path);
      });
    }
  }
  Future<void> _CamaraImage() async{
      final XFile? pickImage = await _imagepicker.pickImage(source: ImageSource.camera);
      if(pickImage != null){
        setState(() {
          _image = File(pickImage.path);
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: form1,
      child: Scaffold(
       // backgroundColor: Color.fromRGBO(100, 20, 450, 10),
        body: Column(
          children: [
            // SizedBox(height: 150,),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children:[
                  Container(
                    height: size.height,
                    width: size.width,
                    child: Image(image: AssetImage('assets/waller.jpg'),fit: BoxFit.fill,),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height*0.1-20),
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height / 1.2,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/waller.jpg'),fit: BoxFit.fill),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 3,
                                    color: Colors.black54,
                                    blurRadius: 30,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: [
                              //Image(image: AssetImage('assets/leave.jpg'),fit: BoxFit.fill,),
                              Stack(
                                clipBehavior: Clip.none,alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: size.height * 0.4,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(100, 20, 450, 5),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10))),
                                    child: Image(image: AssetImage('assets/waller.jpg'),fit: BoxFit.fill,),
                                  ),
                                  Stack(
                                    children: [
                                      Center(
                                        child: CircleAvatar(
                                        maxRadius: size.height*0.1,
                                          backgroundColor: Colors.cyan.shade700,
                                          // backgroundColor: Colors.white,
                                           // child:_image != null
                                           //     ? Image.file(_image!, fit: BoxFit.cover)
                                           //     : const Text('Please select an image'),
                                        // child: ClipPath(
                                        //     clipper: ShapeBorderClipper(
                                        //         shape:  CircleBorder(side: BorderSide(width: 1,color: Colors.blueAccent.shade700),)),
                                        //     clipBehavior: Clip.hardEdge,
                                        //     child: _image != null ? Image.file(
                                        //       _image!,fit: BoxFit.cover)
                                        //         : Image.asset('assets/foot1.jpg',fit: BoxFit.fill,),),
                                          backgroundImage: _image == null ? null :
                                          FileImage(File(_image!.path)),
                                     ),
                                      ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 100,top: 100),
                                      child: InkWell(
                                        onTap: _openImagePicker,
                                          child: PopupMenuButton(
                                            child: Icon(Icons.camera_alt,color: Colors.black87,size: size.height/15,),
                                            itemBuilder: (context) {
                                              return[
                                                PopupMenuItem(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        setState(() {
                                                          _CamaraImage();
                                                        });
                                                      },
                                                        child: Text('Camera'),
                                                    ),
                                                ),
                                                PopupMenuItem(
                                                    child: InkWell(
                                                        child: Text('Gallary'),
                                                      // onDoubleTap: () {
                                                      //   Navigator.pop(context);
                                                      //
                                                      // },
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        setState(() {
                                                          _openImagePicker();
                                                        });

                                                      },
                                                    ),
                                                ),
                                              ];
                                            },
                                            //Icon(Icons.camera_alt,color: Colors.black87,size: size.height/15,)
                                      ),
                                      ),
                                    ),
                                  ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('USER LOGIN',
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 450, 10),
                                      fontSize: 30,
                                      shadows: [
                                        Shadow(
                                            color: Color.fromRGBO(0, 0, 350, 5),
                                            blurRadius: 8,
                                            offset: Offset(0, 2))
                                      ])),
                              Spacer(flex: 7),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: TextFormField(
                                  controller: _username,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'enter the value';
                                    } else if (username1 != _username.text) {
                                      return 'username are not same';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    label: Text('username'),
                                    hintText: 'username',
                                    prefixIcon: Icon(Icons.person_outline_rounded),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(200)),
                                  ),
                                ),
                              ),
                              Spacer(flex: 2),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                child: TextFormField(
                                  controller: _password,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'enter the value';
                                    } else if (password1 != _password.text) {
                                      return 'password are not same';
                                    }
                                  },
                                  obscureText: password,
                                  decoration: InputDecoration(
                                    fillColor: Colors.pinkAccent,
                                    label: Text('Password'),
                                    hintText: 'Password',
                                    prefixIcon: Icon(Icons.lock_outline),
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {});
                                        password = !password;
                                      },
                                      child: Icon(
                                          password
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility,
                                          color: Colors.blueAccent),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(200)),
                                  ),
                                ),
                              ),
                              Spacer(flex: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(
                                              EdgeInsets.only(left: 0))),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignIn(),
                                            ));
                                      },
                                      child: Text('Signin',style: TextStyle(color: Colors.black),)),
                                  // Spacer(flex: 1,),
                                 
                                  TextButton(
                                      style: ButtonStyle(
                                          padding: MaterialStatePropertyAll(
                                              EdgeInsets.only(right: 0))),

                                      onPressed: () {
                                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Crovsol.name(uname: _username.text,pa: _password.text),));
                                      },
                                      child: Text('Forget Password ?',style: TextStyle(color: Colors.black),)),
                                  // Spacer(flex: 1,),
                                ],
                              ),
                              Spacer(
                                flex: 6,
                              ),
                              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade300)),
                                  onPressed: () async{
                                   if (form1.currentState!.validate()) {
                                     if (username1 == _username.text &&
                                          password1 == _password.text) {
                                      SharedPreferences pref = await SharedPreferences.getInstance();
                                      pref.setBool(CrovsolState.login, true);
                                        setState(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Myntra(),
                                              ));
                                        });
                                     }
                                   }
                                  },
                                  child: Text('Login')),
                              // Spacer(
                              //   flex: 5,
                              // ),
                              LoadingAnimationWidget.discreteCircle(
                                  color: Colors.white,
                                 // size: _kSize,
                                  secondRingColor: Colors.black,
                                  thirdRingColor: Colors.purple, size: 20),
                            ],
                          ),
                        ),
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
