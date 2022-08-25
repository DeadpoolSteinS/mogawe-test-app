import 'package:flutter/material.dart';

String uri =
    "https://backend-service-development-dot-mogawe-222614.appspot.com/api/mogawers/logIn";
const Color primaryColor = Color(0xffea2327);
const Color grayFont = Color(0xff979797);
const Color instruksiFont = Color(0xff7c7c7c);
const Color darkGrey = Color(0xffc7c7c7);
const Color lightBlack = Color(0xff757575);

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
