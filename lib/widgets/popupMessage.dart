import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//positional optonal named parameter
toastInfo(String msg,
    {Color backgroundColor = const Color.fromARGB(255, 176, 143, 255),
    Color textColor = Colors.white}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16,
  );
}
