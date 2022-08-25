import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mogawe_test_2/features/auth/screens/auth_screen.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: primaryColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoGawe Test',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xfff7f7f7),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: primaryColor,
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
