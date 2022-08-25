import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/list_murid_bloc.dart';
import 'package:mogawe_test_2/features/absensi_kelas/widgets/absensi_card.dart';
import 'package:mogawe_test_2/features/absensi_kelas/widgets/modal_form_murid.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';
import 'package:mogawe_test_2/widgets/search_murid.dart';

class BodyAbsensiKelas extends StatelessWidget {
  final ListMuridBloc listMuridBloc;

  const BodyAbsensiKelas({
    Key? key,
    required this.listMuridBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchMurid(listMuridBloc: listMuridBloc),
              BigBtn(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ModalFormMurid(
                      listMuridBloc: listMuridBloc,
                    ),
                  );
                },
                title: const Text("+ Murid"),
                width: 102,
                height: 46,
              ),
            ],
          ),
        ),
        BlocBuilder<ListMuridBloc, List<String>>(
          bloc: listMuridBloc,
          builder: (context, state) {
            return state.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text("Tidak ada data siswa"),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.length,
                    itemBuilder: ((context, index) {
                      return AbsenesiCard(title: state[index]);
                    }),
                  );
          },
        )
      ],
    );
  }
}
