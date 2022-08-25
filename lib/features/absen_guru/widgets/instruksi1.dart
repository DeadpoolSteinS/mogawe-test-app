import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/check_bloc.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/widgets/radio_option.dart';

class Instruksi1 extends StatelessWidget {
  final int instruksi;

  Instruksi1({
    Key? key,
    required this.instruksi,
  }) : super(key: key);

  final CheckBloc checkBloc = CheckBloc();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      child: Column(
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
          const Text(
              "Hari ini hari Senin, apakah Anda sudah berpakaian Seragam Batik PNS?"),
          const SizedBox(height: 8),
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/unsplash_k502bjvxqHI.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          RadioOption(
            checkBloc: checkBloc,
            option: const ["Sudah", "Waduh, Belum"],
          ),
        ],
      ),
    );
  }
}
