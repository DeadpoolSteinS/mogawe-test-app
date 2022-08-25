import 'package:flutter/material.dart';
import 'package:mogawe_test_2/features/absen_guru/screens/absen_guru_screen.dart';
import 'package:mogawe_test_2/features/absensi_kelas/screens/absensi_kelas_screen.dart';
import 'package:mogawe_test_2/features/auth/screens/auth_screen.dart';
import 'package:mogawe_test_2/features/detail_murid/screens/detail_murid_screen.dart';
import 'package:mogawe_test_2/features/tugas_absen/screens/tugas_absen_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case AbsenGuruScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AbsenGuruScreen(),
      );
    case TugasAbsenScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TugasAbsenScreen(),
      );
    case AbsensiKelasScreen.routeName:
      String title = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AbsensiKelasScreen(title: title),
      );
    case DetailMuridScreen.routeName:
      List<dynamic> listArg = routeSettings.arguments as List<dynamic>;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DetailMuridScreen(argument: listArg),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
