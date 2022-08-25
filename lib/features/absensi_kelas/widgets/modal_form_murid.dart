import 'package:flutter/material.dart';
import 'package:mogawe_test_2/blocs/list_murid_bloc.dart';
import 'package:mogawe_test_2/features/absensi_kelas/widgets/form_murid.dart';

class ModalFormMurid extends StatelessWidget {
  final ListMuridBloc listMuridBloc;

  const ModalFormMurid({
    Key? key,
    required this.listMuridBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      contentPadding: const EdgeInsets.all(16),
      content: SizedBox(
        width: 367,
        height: 230,
        child: Form(
          child: FormMurid(listMuridBloc: listMuridBloc),
        ),
      ),
    );
  }
}
