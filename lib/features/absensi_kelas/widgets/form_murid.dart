import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mogawe_test_2/blocs/list_murid_bloc.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';
import 'package:mogawe_test_2/widgets/custom_textfield.dart';

class FormMurid extends StatefulWidget {
  final ListMuridBloc listMuridBloc;

  const FormMurid({
    Key? key,
    required this.listMuridBloc,
  }) : super(key: key);

  @override
  State<FormMurid> createState() => _FormMuridState();
}

class _FormMuridState extends State<FormMurid> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final String nowTime = DateFormat('HH:mm').format(DateTime.now());

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                  controller: _namaController,
                  title: "Nama",
                  hintText: "Masukkan nama murid",
                ),
                const SizedBox(height: 12),
                CustomTextfield(
                  controller: _alamatController,
                  title: "Alamat",
                  hintText: "Masukkan alamat murid",
                ),
                const SizedBox(height: 12),
                BigBtn(
                  onTap: () {
                    widget.listMuridBloc.addItem(_namaController.text);
                    Navigator.pop(context);
                  },
                  title: const Text(
                    "Lanjut",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
