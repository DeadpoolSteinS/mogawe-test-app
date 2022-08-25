import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/absen_detail_bloc.dart';
import 'package:mogawe_test_2/blocs/check_bloc.dart';
import 'package:mogawe_test_2/blocs/progress_absen_bloc.dart';
import 'package:mogawe_test_2/features/absen_guru/widgets/modal_absen.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';

class Instruksi2 extends StatelessWidget {
  final int instruksi;

  Instruksi2({
    Key? key,
    required this.instruksi,
  }) : super(key: key);

  final CheckBloc checkBloc = CheckBloc();
  final AbsenDetailBloc absenDetailBloc = AbsenDetailBloc();

  @override
  Widget build(BuildContext context) {
    ProgressAbsenBloc progressAbsenBloc = context.read<ProgressAbsenBloc>();
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => selectedBloc),
    //     BlocProvider(create: (context) => absenBloc),
    //   ],
    //   child: Container(
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 18,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Instruksi $instruksi",
                    style: const TextStyle(
                      fontSize: 12,
                      color: instruksiFont,
                    ),
                  )
                ],
              ),
              BlocBuilder<CheckBloc, bool>(
                bloc: checkBloc,
                builder: (context, state) {
                  return Icon(
                    Icons.check_circle,
                    color: state ? primaryColor : darkGrey,
                    size: 16,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text("Absen"),
          const SizedBox(height: 8),
          const Text(
            "Lakukan absen sebelum jam 7 Pagi, diatas jam tersebut dicatat terlambat. Lakukan di dalam radius 20m dari lingkungan sekolah.",
            style: TextStyle(
              color: grayFont,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/smk.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // BlocConsumer(builder: builder, listener: listener)
          BlocBuilder<CheckBloc, bool>(
            bloc: checkBloc,
            builder: (context, state) {
              return state
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.check,
                              color: primaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Clock In",
                              style: TextStyle(
                                fontSize: 12,
                                color: grayFont,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(absenDetailBloc.state!),
                            Row(
                              children: const [
                                Text(
                                  "500 m",
                                  style: TextStyle(
                                    color: grayFont,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : BigBtn(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ModalAbsen(
                            checkBloc: checkBloc,
                            progressAbsenBloc: progressAbsenBloc,
                            absenDetailBloc: absenDetailBloc,
                          ),
                        );
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on),
                          Text(
                            "Absen",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
      // ),
    );
  }
}
