import 'package:flutter/material.dart';
import 'package:mogawe_test_2/blocs/list_murid_bloc.dart';
import 'package:mogawe_test_2/features/absensi_kelas/widgets/body_absensi_kelas.dart';
import 'package:mogawe_test_2/widgets/custom_appbar.dart';

class AbsensiKelasScreen extends StatefulWidget {
  static const String routeName = '/absensi-kelas';
  final String title;

  const AbsensiKelasScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<AbsensiKelasScreen> createState() => _AbsensiKelasScreenState();
}

class _AbsensiKelasScreenState extends State<AbsensiKelasScreen> {
  final ListMuridBloc listMuridBloc = ListMuridBloc(init: []);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar(title: widget.title),
      ),
      body: BodyAbsensiKelas(listMuridBloc: listMuridBloc),
    );
  }
}
