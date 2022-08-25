import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mogawe_test_2/blocs/absen_detail_bloc.dart';
import 'package:mogawe_test_2/blocs/check_bloc.dart';
import 'package:mogawe_test_2/blocs/progress_absen_bloc.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';

class ModalAbsen extends StatelessWidget {
  final CheckBloc checkBloc;
  final ProgressAbsenBloc progressAbsenBloc;
  final AbsenDetailBloc absenDetailBloc;

  ModalAbsen({
    Key? key,
    required this.checkBloc,
    required this.progressAbsenBloc,
    required this.absenDetailBloc,
  }) : super(key: key);

  final String nowTime = DateFormat('HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: SizedBox(
        width: 367,
        height: 165,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Clock In",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.alarm_outlined,
                          color: primaryColor,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Clock In",
                          style: TextStyle(
                            fontSize: 11,
                            color: darkGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      nowTime,
                      style: const TextStyle(
                        color: lightBlack,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.near_me_outlined,
                          color: primaryColor,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "My Current Location",
                          style: TextStyle(
                            fontSize: 11,
                            color: darkGrey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Jl. Lenteng Agung",
                      style: TextStyle(
                        color: lightBlack,
                        fontSize: 16,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      actions: [
        BigBtn(
          onTap: () {
            progressAbsenBloc.increase();
            checkBloc.change();
            absenDetailBloc.change("$nowTime - Jl. Lenteng Agung");
            Navigator.pop(context);
          },
          title: const Text(
            "Clock In",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
