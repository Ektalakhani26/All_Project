import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/strings.dart';

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
          borderSide: const BorderSide(
            color: Color(0xff03508C),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Color(0xff03508C),
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
