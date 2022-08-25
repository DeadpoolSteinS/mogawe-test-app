import 'package:flutter/material.dart';
import 'package:mogawe_test_2/features/absensi_kelas/screens/absensi_kelas_screen.dart';
import 'package:mogawe_test_2/widgets/custom_appbar.dart';
import 'package:mogawe_test_2/widgets/list_card.dart';

class TugasAbsenScreen extends StatelessWidget {
  static const String routeName = '/tugas-absen';
  const TugasAbsenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppbar(title: "Tugas Absen Hari Ini"),
      ),
      body: Column(
        children: [
          ListCard(
              title: "Absensi Kelas 3",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AbsensiKelasScreen.routeName,
                  arguments: "Absensi Kelas 3",
                );
              }),
          ListCard(
              title: "Absensi Kelas 4",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AbsensiKelasScreen.routeName,
                  arguments: "Absensi Kelas 4",
                );
              }),
        ],
      ),
    );
  }
}
