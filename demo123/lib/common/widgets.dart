import 'package:demo123/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo123/utils/strings.dart';

Widget Txtfield({
  validate,
  controllervalue,
  obscuretxt,
  labletxt,
  hinttxt,
  suffixic,
}) {
  return TextFormField(
    obscureText: obscuretxt,
    validator: validate,
    controller: controllervalue,
    decoration: InputDecoration(
        suffixIcon: suffixic,
        label: Text(labletxt),
        hintText: hinttxt,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  BorderSide(
            color: blue,
            width: 2.0,
          ),
        )),
  );
}

Widget sizeBox(height) {
  return SizedBox(
    height: height,
  );
}
