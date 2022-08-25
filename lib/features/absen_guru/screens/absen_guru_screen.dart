import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/progress_absen_bloc.dart';
import 'package:mogawe_test_2/features/absen_guru/widgets/instruksi1.dart';
import 'package:mogawe_test_2/features/absen_guru/widgets/instruksi2.dart';
import 'package:mogawe_test_2/features/tugas_absen/screens/tugas_absen_screen.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';
import 'package:mogawe_test_2/widgets/custom_appbar.dart';

class AbsenGuruScreen extends StatelessWidget {
  static const String routeName = '/absen-guru';

  AbsenGuruScreen({
    Key? key,
  }) : super(key: key);

  final ProgressAbsenBloc progressAbsenBloc = ProgressAbsenBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => progressAbsenBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomAppbar(title: "Absen Guru"),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Instruksi1(instruksi: 1),
                    Instruksi2(instruksi: 2),
                  ],
                ),
              ),
            ),
            Material(
              elevation: 4,
              child: Container(
                height: 72,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocBuilder<ProgressAbsenBloc, int>(
                  bloc: progressAbsenBloc,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Row(
                            children: [
                              Text("$state/2"),
                              const SizedBox(width: 10),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: state / 2,
                                  color: primaryColor,
                                  backgroundColor: const Color(0xffc4c4c4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        BigBtn(
                          onTap: progressAbsenBloc.state != 2
                              ? () {}
                              : () {
                                  Navigator.pushNamed(
                                    context,
                                    TugasAbsenScreen.routeName,
                                  );
                                },
                          title: const Text("Lanjut"),
                          width: 100,
                          bgColor: progressAbsenBloc.state != 2
                              ? grayFont
                              : primaryColor,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
