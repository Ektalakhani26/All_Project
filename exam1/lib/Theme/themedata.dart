
import 'package:flutter/material.dart';

 TextStyle myTextstyle30({Color txtcolor=Colors.amber })
{
      return TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: txtcolor,
      );
}
TextStyle myTextstyle15({Color txtcolor=Colors.blue })
{
  return TextStyle(
    //fontSize: 30,
    fontWeight: FontWeight.bold,
    color: txtcolor,
  );
}
TextStyle myTextstyle40({Color txtcolor=Colors.white })
{
  return TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: txtcolor,
  );
}

TextStyle myTextstyle25({Color txtcolor=Colors.white})
{
  return TextStyle(
    fontSize: 25,
   // fontWeight: FontWeight.bold,
    color: txtcolor,
    //backgroundColor: Colors.blue.shade900,
  );
}
TextStyle myTextstyle16({Color txtcolor=Colors.white})
{
  return TextStyle(
    fontSize: 16,
    // fontWeight: FontWeight.bold,
    color: txtcolor,
    //backgroundColor: Colors.blue.shade900,
  );
}
BoxDecoration mybox1 ()
{
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
  );


}
BoxDecoration mybox ()
{
  return BoxDecoration(
    color: Colors.blue.shade900,
    borderRadius: BorderRadius.circular(20),
  );


}