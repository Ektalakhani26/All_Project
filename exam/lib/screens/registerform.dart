import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../network/db.dart';
import '../utils/colors.dart';
import '../utils/icons.dart';
import '../utils/strings.dart';
import 'login.dart';

class rform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProjectState();
}

class ProjectState extends State {
  String url =
      'https://firebasestorage.googleapis.com/v0/b/abhb-aefd5.appspot.com/o/images%2Fuploadpro.webp?alt=media&token=025370cd-ed23-4b2b-a1e0-02b545818bee';

  getImage(String key) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);

    Reference storageReference = FirebaseStorage.instance
        .ref('images/')
        .child(DateTime.now().toString());

    ///UPLOAD IMAGE
    UploadTask task1 = storageReference.putFile(file!);

    print('++++');
    await (await task1).ref.getDownloadURL().then((value) {
      print('---$value');
      imageUrl = value.toString();
      setState(() {});
    });
    setState(() {});
  }

  File? file;

  TextEditingController dobController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController fmobController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController feecontroller = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool passChange = true;

  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    date = DateTime.now();
    cdate = date!.day.toString();
    cmonth = date!.month.toString();
    cyear = date!.year.toString();

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assett/logo.PNG'),
                  colorFilter: ColorFilter.mode(
                      Colors.white70.withOpacity(0.2), BlendMode.dstATop),
                  fit: BoxFit.fitHeight)),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: blue,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                arrowback,
                                color: white,
                              )),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 70.0)),
                      Text(
                        registerhere,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: blue),
                      ),
                    ],
                  ),
                  Divider(
                    color: black,
                    thickness: 1,
                    endIndent: 10,
                    indent: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: usercontroller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: unm,
                          hintText: enterurunm,
                          prefixIcon: Icon(icperson)),
                      validator: (val) => validateEmail(val),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: passChange,
                      controller: passcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: password,
                        hintText: enterurpass,
                        prefixIcon: Icon(icpassword),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passChange == false ? logineye : logineyeonoff,
                            color: blue,
                          ),
                          onPressed: () {
                            setState(() {
                              passChange = !passChange;
                            });
                          },
                        ),
                      ),
                      validator: (val) => validatePassword(val),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      validator: (val) {
                        return (val!.isEmpty) ? fullnm : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(icaccircle),
                        hintText: fullnm,
                        labelText: nmtitle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: addController,
                      validator: (val) {
                        return (val!.isEmpty) ? enteradd : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(iclocation),
                        hintText: enteradd,
                        labelText: addtitle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(icemail),
                        hintText: enteremail,
                        labelText: emailtitle,
                      ),
                      validator: (val) => validateEmail(val),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: dobController,
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: date!,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2023),
                        );
                        odate = selectedDate!.day.toString();
                        omonth = selectedDate.month.toString();
                        oyear = selectedDate.year.toString();
                        setState(() {
                          dobController.text =
                              odate + ' / ' + omonth + ' / ' + oyear;
                        });
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(icdate),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: date!,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2023),
                                );
                                odate = selectedDate!.day.toString();
                                omonth = selectedDate.month.toString();
                                oyear = selectedDate.year.toString();
                                setState(() {
                                  dobController.text =
                                      odate + ' / ' + omonth + ' / ' + oyear;
                                });
                              },
                              icon: Icon(icdate)),
                          border: OutlineInputBorder(),
                          label: Text(dob),
                          hintText: dob),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: mobController,
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val!.length != 10) return entermini10num;
                        return (val.isEmpty) ? plsentervalidnumber : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(iccall),
                        hintText: entermob,
                        labelText: mobnum,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: fmobController,
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val!.length != 10) return entermini10num;
                        return (val.isEmpty) ? plsentervalidnumber : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(iccall),
                        hintText: enterfatnum,
                        labelText: fathnum,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              gendertitle,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  gen = h1;
                                });
                              },
                              child: Text(female),
                            ),
                            Radio(
                                value: h1,
                                groupValue: gen,
                                onChanged: (val) {
                                  setState(() {
                                    gen = val.toString();
                                  });
                                }),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  gen = h2;
                                });
                              },
                              child: Text(male),
                            ),
                            Radio(
                                value: h2,
                                groupValue: gen,
                                onChanged: (val) {
                                  setState(() {
                                    gen = val.toString();
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: collegeController,
                      validator: (val) {
                        return (val!.isEmpty) ? entercity : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(icclg),
                        hintText: college,
                        labelText: clg,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: cityController,
                      validator: (val) {
                        return (val!.isEmpty) ? entercity : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(iclocation),
                        hintText: entercity,
                        labelText: city,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: stateController,
                      validator: (val) {
                        return (val!.isEmpty) ? enterstate : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(iclocation),
                        hintText: enterstate,
                        labelText: state,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: countryController,
                      validator: (val) {
                        return (val!.isEmpty) ? entercountry : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(icmap),
                        hintText: entercountry,
                        labelText: country,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: pincodeController,
                      keyboardType: TextInputType.phone,
                      validator: (val) {
                        if (val!.length != 6) return enterminisix;
                        return (val.isEmpty) ? plsentervalidnumber : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(icpin),
                        hintText: enterpin,
                        labelText: pin,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              icbook,
                              color: blackr,
                            ),
                          ),
                          Text(
                            coursetitle,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton(
                              value: abc,
                              icon: Icon(icarrowdown),
                              items: ['PROJECT', 'INTERMEDIATE', 'EXPERT']
                                  .map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  abc = newValue!.toString();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (val) {
                        return (val!.isEmpty) ? enterfee : null;
                      },
                      controller: feecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: fees,
                        hintText: enterfee,
                        prefixIcon: Icon(icfee),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: grey),
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              icblood,
                              color: blackr,
                            ),
                          ),
                          Text(
                            bloodtitle,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton(
                              value: xyz,
                              icon: Icon(icarrowdown),
                              items: [
                                'A+',
                                'A-',
                                'B+',
                                'B-',
                                'AB+',
                                'AB-',
                                'O+',
                                'O-',
                              ].map((String item1) {
                                return DropdownMenuItem(
                                  value: item1,
                                  child: Text(item1),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  xyz = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: clrgrey,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image: NetworkImage(profile1['url'])
                          image: (imageUrl != '')
                              ? NetworkImage(imageUrl)
                              : (profile1['url'] != null)
                                  ? NetworkImage(profile1['url']!)
                                  : AssetImage('assett/abc.PNG')
                                      as ImageProvider,
                        )),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                      onTap: () {
                        getImage(profile1['key'] ?? '');
                      },
                      child: Text(
                        uploadprofile,
                        style: TextStyle(fontSize: 16, color: blue),
                      )),
                  SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {
                      // Mydatabase.selectData().then((value) => setState(() {
                      // child: Text('Insert'),
                      if (key.currentState!.validate()) {
                        MyDataBase.rinsertdata(
                          Name: nameController.text,
                          Address: addController.text,
                          Email: emailController.text,
                          Personalmobile: mobController.text,
                          FathersNumber: fmobController.text,
                          DateOfbirth: dobController.text,
                          College: collegeController.text,
                          City: cityController.text,
                          State: stateController.text,
                          Country: countryController.text,
                          Pincode: pincodeController.text,
                          Username: usercontroller.text,
                          Password: passcontroller.text,
                          fees: feecontroller.text,
                          img: imageUrl,
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(Submit,
                              style: TextStyle(
                                  color: white, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center),
                        ),
                        decoration: BoxDecoration(
                          color: blue,
                          border: Border.all(color: org),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
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


