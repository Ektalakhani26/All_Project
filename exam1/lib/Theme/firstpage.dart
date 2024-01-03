import 'package:exam1/Theme/themedata.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: 500,
              decoration:
                  mybox().copyWith(borderRadius: BorderRadius.circular(0)),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text('WELCOME!',
                      style: myTextstyle30().copyWith(color: Colors.white)),
                  SizedBox(
                    height: 30,
                  ),
                  Icon(Icons.account_balance),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('username or Email'),
                  hintText: 'username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text('Password'),
                    hintText: 'password',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(),
                    ));
              },
              child: Text('Login', style: myTextstyle25()),
            ),
            TextButton(onPressed: () {}, child: Text('Forget Password?')),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 100)),
                Text('New to Blank Apps?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(),
                          ));
                    },
                    child: Text('Sign Up')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//===========================================================================
//===========================================================================
//===========================================================================
//===========================================================================
//=====================  SECOND PAGE =======================================
//==========================================================================
//============================================================================

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var value1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 180,
              decoration:
                  mybox().copyWith(borderRadius: BorderRadius.circular(0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_balance, size: 100),
                      Icon(Icons.compare_arrows_rounded, size: 100),
                      Icon(Icons.phone_android, size: 100),
                    ],
                  ),
                  Text('Connect to Your bank Account',
                      style: myTextstyle25().copyWith(fontSize: 20)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text('Your name'),
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Bank Account'),
                  hintText: 'Account',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  label: Text('Email'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Password'),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Use & Character with a mix letters,\n Numbers & Symbol',
                style:
                    myTextstyle25().copyWith(color: Colors.blue, fontSize: 16)),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.scale(
                  scale: 2,
                  child: Checkbox(
                    value: value1,
                    onChanged: (value) {
                      value1 = value!;
                      setState(() {});
                    },
                  ),
                ),
                Column(
                  children: [
                    Text("By sign up you agree to bank",
                        style: myTextstyle16().copyWith(color: Colors.black)),
                    Text(
                      'Tems of Use & privacy policy',
                      style: myTextstyle16().copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('SIGN UP',
                      style: myTextstyle25().copyWith(fontSize: 20)),
                ),
                Icon(Icons.compare_arrows_rounded,
                    size: 30, color: Colors.black),
                ElevatedButton(
                  style: ButtonStyle().copyWith(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text('Cancle',
                      style: myTextstyle25()
                          .copyWith(fontSize: 20, color: Colors.black)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Sign Up?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirstPage(),
                          ));
                    },
                    child: Text('Login')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//===========================================================================
//===========================================================================
//===========================================================================
//===========================================================================
//=====================  THIRD PAGE =======================================
//==========================================================================
//============================================================================

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 390,
              width: 500,
              decoration:
                  mybox().copyWith(borderRadius: BorderRadius.circular(0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.dehaze_outlined,
                          size: 30,
                        ),
                        margin: EdgeInsets.only(left: 20),
                      ),
                      Container(
                        child: Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        margin: EdgeInsets.only(right: 20),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/user.jpg'),
                        maxRadius: 60,
                        minRadius: 20,
                      ),
                    ],
                  ),
                  Text('YOUR NAME',
                      style: myTextstyle30(txtcolor: Colors.white)),
                  Text('your*email@gmail.com', style: myTextstyle16()),
                  Container(
                    width: 270,
                    height: 130,
                    decoration: mybox().copyWith(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'BALANCE',
                          style: myTextstyle16().copyWith(color: Colors.blue),
                        ),
                        Text("\$ 4,180.20",
                            style: myTextstyle30()
                                .copyWith(color: Colors.blue.shade900)),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('TRANSFER', style: myTextstyle16()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('LATEST TRANSACTION',
                style: myTextstyle16(txtcolor: Colors.blue)),
            SizedBox(
              height: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  maxRadius: 30,
                  minRadius: 30,
                  backgroundColor: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Letters asum Company'),
                        SizedBox(
                          width: 20,
                        ),
                        Text('\$ 2.030.80',
                            style: myTextstyle16(txtcolor: Colors.black87)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 10)),
                    Text('Recived Payment'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  maxRadius: 30,
                  minRadius: 30,
                  backgroundColor: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Actor ev LED.'),
                        SizedBox(
                          width: 95,
                        ),
                        Text('\$ 450.00',
                            style: myTextstyle16(txtcolor: Colors.black87)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 10)),
                    Text('justify'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  maxRadius: 30,
                  minRadius: 30,
                  backgroundColor: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Lacture amt sit LED.'),
                        SizedBox(
                          width: 50,
                        ),
                        Text('\$ 239.50',
                            style: myTextstyle16(txtcolor: Colors.black87)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 10)),
                    Text('cash & eficency payment'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  maxRadius: 30,
                  minRadius: 30,
                  backgroundColor: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Lacture amt sit LED.'),
                        SizedBox(
                          width: 50,
                        ),
                        Text('\$ 239.50',
                            style: myTextstyle16(txtcolor: Colors.black87)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 10)),
                    Text('cash & eficency payment'),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 250),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForthPage(),
                      ));
                },
                child:
                    Text('more>>', style: myTextstyle16(txtcolor: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//===========================================================================
//===========================================================================
//===========================================================================
//===========================================================================
//=====================  FORTH PAGE =======================================
//==========================================================================
//============================================================================

class ForthPage extends StatefulWidget {
  const ForthPage({Key? key}) : super(key: key);

  @override
  State<ForthPage> createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.dehaze_outlined,
          size: 30,
        ),
        actions: [
          //Text('ACCOUNT',style: myTextstyle25()),
          // Padding(padding: padding)
          Icon(
            Icons.settings,
            size: 30,
          ),
          // Icon(Icons.navigate_next_outlined,size: 30,),
        ],
        title: Row(
          children: [
            Icon(
              Icons.navigate_next_outlined,
              size: 30,
            ),
            SizedBox(
              width: 50,
            ),
            Text('ACCOUNT'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Stack(
            // children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/user1.jpg'),
              maxRadius: 60,
              minRadius: 20,
            ),
            // ],
            //),
            Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text('YOUR NAME'),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'KARINA BUYS',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text('BANK ACCOUNT'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '000 123 456',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 230),
              child: Text('EMAIL'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'krina_bariya@gmail.com',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 190),
              child: Text('PASSWORD'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: '*************',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text('PHONE'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '+44 3564215897',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 170),
              child: Text('YOUR ADDRESS'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText:
                      '45,rever viwe near canel rode varchha ,surat 395010',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FifthPage(),
                      ));
                },
                child: Text('SAVE CHANGES')),
          ],
        ),
      ),
    );
  }
}

//===========================================================================
//===========================================================================
//===========================================================================
//===========================================================================
//=====================  FIFTH PAGE =======================================
//==========================================================================
//============================================================================

class FifthPage extends StatefulWidget {
  const FifthPage({Key? key}) : super(key: key);

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.dehaze_outlined,
          size: 30,
        ),
        centerTitle: true,
        title: Row(
          children: [
            Icon(
              Icons.navigate_next,
              size: 30,
            ),
            SizedBox(
              width: 40,
            ),
            Text('EXCHANGE', style: myTextstyle25()),
          ],
        ),
        actions: [
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                CircleAvatar(
                  minRadius: 30,
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/doller.jpg'),
                ),
                Icon(Icons.compare_arrows_rounded,
                    size: 100, color: Colors.blue.shade900),
                CircleAvatar(
                  minRadius: 30,
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/rupee2.jpg'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60,
                ),
                Expanded(
                  flex: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('\$',
                          style: myTextstyle15().copyWith(fontSize: 40)),
                      // hintText: "TextField 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 100,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      //keyboardAppearance: ,
                      decoration: InputDecoration(
                        hintText: "1,000.00",
                        label: Text('1,000.00', style: myTextstyle15()),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('convert 10'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 60,
                ),
                Expanded(
                  flex: 30,
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('₹',
                          style: myTextstyle15().copyWith(fontSize: 40)),
                      // hintText: "TextField 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 100,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      //keyboardAppearance: ,
                      decoration: InputDecoration(
                        hintText: "780.00",
                        label: Text('780.00', style: myTextstyle15()),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('1', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('2', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('3', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('4', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('5', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('5', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('7', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('8', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('9', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 40),
                  child: Text('00', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('0', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
                Container(
                  height: 50,
                  width: 120,
                  padding: EdgeInsets.only(left: 50),
                  child: Text('x', style: myTextstyle40()),
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 300),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SixPage(),
                      ));
                },
                child: Text('Next<<', style: myTextstyle15()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//===========================================================================
//===========================================================================
//===========================================================================
//===========================================================================
//=====================  SIX PAGE =======================================
//==========================================================================
//============================================================================

class SixPage extends StatefulWidget {
  const SixPage({Key? key}) : super(key: key);

  @override
  State<SixPage> createState() => _SixPageState();
}

class _SixPageState extends State<SixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 800,
                  decoration:
                      mybox().copyWith(borderRadius: BorderRadius.circular(0)),
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.navigate_next,
                            size: 40,
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('Dashboard',
                            style: myTextstyle40().copyWith(fontSize: 35)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text('Pannel',
                            style: myTextstyle40().copyWith(fontSize: 35)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  height: 700,
                  width: 392,
                  top: 200,
                  child: Container(
                    decoration: mybox1(),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              maxRadius: 30,
                              minRadius: 20,
                              backgroundImage:
                                  AssetImage('assets/calander.png'),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text('Deadline',
                                    style:
                                        myTextstyle15().copyWith(fontSize: 20)),
                                Text('August 20th',
                                    style: myTextstyle15()
                                        .copyWith(color: Colors.black38)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 30),
                          padding: EdgeInsets.only(left: 40),
                          child: Column(
                            children: [
                              Text('Lorem ipsum dolor sit amet, consectetuer',
                                  style:
                                      myTextstyle16(txtcolor: Colors.black38)),
                              Text(
                                  'adipiscing elit. sed diam nonummy nibh\t\t\t\t',
                                  style:
                                      myTextstyle16(txtcolor: Colors.black38)),
                              Text('euismod tincidunt ut laoreet dolore magna',
                                  style:
                                      myTextstyle16(txtcolor: Colors.black38)),
                              Text(
                                  'aliquam erat volutpat. Ut wisi enim ad\t\t\t\t\t\t\t\t',
                                  style:
                                      myTextstyle16(txtcolor: Colors.black38)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            'Files',
                            style: myTextstyle25(txtcolor: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          //color: Colors.pink,
                          margin: EdgeInsets.only(left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 20,
                                minRadius: 10,
                                backgroundImage: AssetImage('assets/pin1.jpg'),
                                backgroundColor: Colors.blue.shade200,
                              ),

                              Column(
                                children: [
                                  Container(
                                    child: Text('Dashboard_hf.ai',style: myTextstyle16(txtcolor: Colors.black),),
                                    padding: EdgeInsets.only(top: 15),
                                    margin: EdgeInsets.only(right: 30),
                                  ),
                                  Container(
                                    child:  Text('August, 18th',style: myTextstyle16(txtcolor: Colors.black38)),
                                    margin: EdgeInsets.only(right: 50),
                                  )

                                ],
                              ),
                              Icon(Icons.download_sharp,size: 40,color: Colors.black26),
                            ],
                          ),
                          decoration: mybox().copyWith(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              //border: Border.all(width: 1),
                              boxShadow: [
                                BoxShadow(
                                   color: Colors.blue.shade100,
                                    spreadRadius: 1,
                                  blurRadius: 13,
                                  offset: Offset.fromDirection(570),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          //color: Colors.pink,
                          margin: EdgeInsets.only(left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 20,
                                minRadius: 10,
                                backgroundImage: AssetImage('assets/pin1.jpg'),
                                backgroundColor: Colors.blue.shade200,
                              ),

                              Column(
                                children: [
                                  Container(
                                    child: Text('Dashboard_v1.ai',style: myTextstyle16(txtcolor: Colors.black),),
                                    padding: EdgeInsets.only(top: 15),
                                    margin: EdgeInsets.only(right: 25),
                                  ),
                                  Container(
                                    child:  Text('August, 16th',style: myTextstyle16(txtcolor: Colors.black38)),
                                    margin: EdgeInsets.only(right: 50),
                                  )

                                ],
                              ),
                              Icon(Icons.download_sharp,size: 40,color: Colors.black26),
                            ],
                          ),
                          decoration: mybox().copyWith(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              //border: Border.all(width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade100,
                                  spreadRadius: 1,
                                  blurRadius: 13,
                                  offset: Offset.fromDirection(570),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          //color: Colors.pink,
                          margin: EdgeInsets.only(left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 20,
                                minRadius: 10,
                                backgroundImage: AssetImage('assets/pin1.jpg'),
                                backgroundColor: Colors.blue.shade200,
                              ),

                              Column(
                                children: [
                                  Container(
                                    child: Text('Mockup.v2.ai',style: myTextstyle16(txtcolor: Colors.black),),
                                    padding: EdgeInsets.only(top: 15),
                                    margin: EdgeInsets.only(right: 45),
                                  ),
                                  Container(
                                    child:  Text('August, 15th',style: myTextstyle16(txtcolor: Colors.black38)),
                                    margin: EdgeInsets.only(right: 50),
                                  )

                                ],
                              ),
                              Icon(Icons.download_sharp,size: 40,color: Colors.black26),
                            ],
                          ),
                          decoration: mybox().copyWith(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              //border: Border.all(width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade100,
                                  spreadRadius: 1,
                                  blurRadius: 13,
                                  offset: Offset.fromDirection(500),
                                ),
                              ]),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 70,
                          width: 300,
                          //color: Colors.pink,
                          margin: EdgeInsets.only(left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                maxRadius: 20,
                                minRadius: 10,
                                backgroundImage: AssetImage('assets/pin1.jpg'),
                                backgroundColor: Colors.blue.shade200,
                              ),

                              Column(
                                children: [
                                  Container(
                                    child: Text('Mockup.ai',style: myTextstyle16(txtcolor: Colors.black),),
                                    padding: EdgeInsets.only(top: 15),
                                    margin: EdgeInsets.only(right: 60),
                                  ),
                                  Container(
                                    child:  Text('August, 12th',style: myTextstyle16(txtcolor: Colors.black38)),
                                    margin: EdgeInsets.only(right: 50),
                                  )

                                ],
                              ),
                              Icon(Icons.download_sharp,size: 40,color: Colors.black26),
                            ],
                          ),
                          decoration: mybox().copyWith(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              //border: Border.all(width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.shade100,
                                  spreadRadius: 1,
                                  blurRadius: 13,
                                  offset: Offset.fromDirection(570),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  height: 70,
                  width: 70,
                  top: 170,
                  right: 50,
                  child: Container(
                    child: Image(image: AssetImage('assets/ekta2.jpg')),
                    decoration: mybox1().copyWith(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        //border: Border.all(width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.shade900,
                            spreadRadius: 1,
                            blurRadius: 13,
                            offset: Offset.fromDirection(400),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
