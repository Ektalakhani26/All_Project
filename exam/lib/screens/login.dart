
import 'package:exam/screens/registerform.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/db.dart';
import '../network/shared data.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Login1();
}

class Login1 extends State {
  final key1 = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool passChange = true;

  @override
  void initState() {
    super.initState();
    // Mydatabase.selectData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: [
              Form(
                key: key1,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assett/logo.PNG')),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        wlcflt,
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      const SizedBox(height: 25),
                      const SizedBox(height: 35),
                      TextFormField(
                        controller: usernameController,
                        validator: (val) => validateEmail(val),
                        decoration: InputDecoration(
                          hintText: enterurunm,
                          labelText: unm,
                          fillColor: org,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: passController,
                        validator: (val) => validatePassword(val),
                        obscureText: passChange,
                        decoration: InputDecoration(
                            labelText: password,
                            hintText: enterpassword,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passChange = !passChange;
                                });
                              },
                              icon: Icon(
                                passChange == false ? logineye : logineyeonoff,
                                color: blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: blue,
                                width: 2.0,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: MaterialButton(
                          minWidth: 150.0,
                          height: 40.0,
                          color: blue,
                          onPressed: () async {
                            print('*****$profile1');
                            await getvalue(
                                usernameController.text, passController.text);
                            if (key1.currentState!.validate()) {
                              userEmail = usernameController.text;

                              SharedPreferences pref =
                              await SharedPreferences.getInstance();
                              pref.setString('user', userEmail);
                              MyDataBase.selectUserData(userEmail)
                                  .then((value) {
                                if (profile1['Pass'] == passController.text)
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(
                                    builder: (context) => DashBord(),
                                  ));

                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid Login Detail!'),backgroundColor: blue,));
                            }
                          },
                          child: Text(login, style: TextStyle(color: white)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          Text(forgoturpass),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const Forget();
                                    },
                                  ),
                                );
                              });
                            },
                            child: Text(
                              resethere,
                              style: TextStyle(color: org),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(donthaveac),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return rform();
                                  }),
                                );
                              });
                            },
                            child: Text(
                              registerhere,
                              style: TextStyle(color: org),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Forget1();
}

class Forget1 extends State {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(arrowback),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: white, //background color of box
              boxShadow: [
                BoxShadow(
                  color: blue,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: const Offset(
                    3.0,
                    3.0,
                  ),
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  children: [
                    Form(
                      key: key,
                      child: Column(
                        children: [
                          const SizedBox(height: 100),
                          Text(forgotpass,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              )),
                          const SizedBox(height: 30),
                          Text(description),
                          const SizedBox(height: 40),
                          TextFormField(
                            validator: (val) => validateEmail(val),
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: enteruremail,
                              labelText: email,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 30.0,
                                  right: 70.0,
                                  left: 30.0,
                                  bottom: 50.0)),
                          Center(
                            child: MaterialButton(
                              minWidth: 80.0,
                              height: 40.0,
                              color: blue,
                              onPressed: () {
                                {
                                  if (key.currentState!.validate()) {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const Code();
                                        },
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Text(
                                sendotp,
                                style: TextStyle(fontSize: 20.0, color: white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Code extends StatefulWidget {
  const Code({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Code1();
}

class Code1 extends State {
  final bool autoFocus = true;
  final key = GlobalKey<FormState>();

  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(arrowback),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: white, //background color of box
                boxShadow: [
                  BoxShadow(
                    color: blue,
                    blurRadius: 6.0,
                    spreadRadius: 0.5,
                    offset: const Offset(
                      3.0,
                      3.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(verifycode,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        )),
                    const SizedBox(height: 50),
                    Form(
                      key: key,
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                controller: otp1,
                                validator: (val) {
                                  return (val!.isEmpty) ? 'enter' : null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.length == 0) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                autofocus: autoFocus,
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide()),
                                ),
                              )),
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: TextFormField(
                                controller: otp2,
                                validator: (val) {
                                  return (val!.isEmpty) ? 'enter' : null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.length == 0) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                //style: const TextStyle(color:Color(0xffF36F24)),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide()),
                                ),
                              )),
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: TextFormField(
                                controller: otp3,
                                validator: (val) {
                                  return (val!.isEmpty) ? 'enter' : null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.length == 0) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                // style: const TextStyle(color:Color(0xffF36F24) ),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide()),
                                ),
                              )),
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: TextFormField(
                                controller: otp4,
                                validator: (val) {
                                  return (val!.isEmpty) ? 'enter' : null;
                                },
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.length == 0) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                maxLength: 1,
                                keyboardType: TextInputType.phone,
                                textAlign: TextAlign.center,
                                // style: const TextStyle(color: Color(0xffF36F24)),
                                decoration: const InputDecoration(
                                  counterText: '',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide()),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 70),
                        Text(
                          verificationcode,
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            resendotp,
                            style: TextStyle(fontSize: 20.0, color: blue),
                          ),
                        ),
                        // const SizedBox(width: 100),
                        Container(
                          height: 50,
                          width: 100,
                          color: blue,
                          child: IconButton(
                              onPressed: () {
                                if (key.currentState!.validate()) {
                                  otpp1 = otp1.text;
                                  otpp2 = otp2.text;
                                  otpp3 = otp3.text;
                                  otpp4 = otp4.text;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return const Password();
                                      }));
                                }

                                setState(() {});
                              },
                              icon: Icon(
                                arrowforword,
                                size: 35,
                                color: white,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Password1();
}

class Password1 extends State {
  bool Passchange = true;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController newpass1Controller = TextEditingController();
  TextEditingController confnewpassController = TextEditingController();
  bool passChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(arrowback),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            height: MediaQuery.of(context).size.height / 1.6,
            decoration: BoxDecoration(
              color: white, //background color of box
              boxShadow: [
                BoxShadow(
                  color: blue,
                  blurRadius: 6.0,
                  spreadRadius: 0.5,
                  offset: const Offset(
                    3.0,
                    3.0,
                  ),
                )
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Text(resetpass,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            )),
                        const SizedBox(height: 40),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              enterpass,
                              style: TextStyle(
                                  color: blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: newpass1Controller,
                          validator: (value) => validatePassword(value),
                          obscureText: passChange,
                          decoration: InputDecoration(
                              labelText: reenterpass,
                              hintText: enterpassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passChange = !passChange;
                                  });
                                },
                                icon: Icon(
                                  passChange == false
                                      ? logineye
                                      : logineyeonoff,
                                  color: blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: blue,
                                  width: 2.0,
                                ),
                              )),
                        ),
                        const SizedBox(height: 20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              reenterpass,
                              style: TextStyle(
                                  color: blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: confnewpassController,
                          // validator: (value) => validatePassword(value),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Please re-enter your new password';
                            }
                            if (val != newpass1Controller.text) {
                              return 'Password must be same..';
                            }
                            return null;
                          },
                          obscureText: passChange,
                          decoration: InputDecoration(
                              labelText: confirmpass,
                              // prefixIcon: Icon(loginlock),
                              hintText: enterpassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passChange = !passChange;
                                  });
                                },
                                icon: Icon(
                                  passChange == false
                                      ? logineye
                                      : logineyeonoff,
                                  color: blue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide(
                                  color: blue,
                                  width: 2.0,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        MaterialButton(
                          minWidth: 120.0,
                          height: 40.0,
                          color: blue,
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              npasspass = newpass1Controller.text;
                              confpasspass = confnewpassController.text;

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return DashBord();
                              }));
                            }
                            setState(() {});
                          },
                          child: Text(save, style: TextStyle(color: white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}