import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mogawe_test_2/features/absen_guru/screens/absen_guru_screen.dart';
import 'package:mogawe_test_2/global.dart';

class AuthService {
  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      password = sha256.convert(utf8.encode(password)).toString();

      http.Response res = await http.post(
        Uri.parse(uri),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      signinHandle(
        response: res,
        context: context,
        onSuccess: () {
          Navigator.pushNamed(
            context,
            AbsenGuruScreen.routeName,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signinHandle({
    required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess,
  }) {
    switch (jsonDecode(response.body)['returnValue']) {
      case "000":
        onSuccess();
        break;
      default:
        showSnackBar(context, jsonDecode(response.body)['message']);
    }
  }
}
