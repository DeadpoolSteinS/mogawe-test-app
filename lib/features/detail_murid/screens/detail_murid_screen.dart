import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/check_bloc.dart';
import 'package:mogawe_test_2/blocs/detail_murid_bloc.dart';
import 'package:mogawe_test_2/features/detail_murid/widgets/murid_option.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';
import 'package:mogawe_test_2/widgets/custom_appbar.dart';

class DetailMuridScreen extends StatelessWidget {
  static const String routeName = '/detail-murid';
  final List<dynamic> argument;

  DetailMuridScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  final CheckBloc checkBloc = CheckBloc();
  final DetailMuridBloc detailMuridBloc = DetailMuridBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppbar(title: argument[0]),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("1. Sudah Mengerjakan PR?"),
            MuridOption(
              option: const ["Sudah", "Belum"],
              detailMuridBloc: detailMuridBloc,
            ),
            const SizedBox(height: 16),
            const Text("2. Sudah Sarapan?"),
            MuridOption(
              option: const ["Sudah", "Belum"],
              detailMuridBloc: detailMuridBloc,
            ),
            const SizedBox(height: 16),
            const Text("3. Kondisi Anak"),
            MuridOption(
              option: const ["Sehat", "Kurang Sehat", "Tidak Sehat"],
              detailMuridBloc: detailMuridBloc,
            ),
            const SizedBox(height: 16),
            BlocBuilder<DetailMuridBloc, int>(
              bloc: detailMuridBloc,
              builder: (context, state) {
                return BigBtn(
                  onTap: state != 3
                      ? () {}
                      : () {
                          argument[1].change();
                          Navigator.pop(context);
                        },
                  title: const Text("Selesai"),
                  bgColor: state != 3 ? grayFont : primaryColor,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
