import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/detail_murid_bloc.dart';
import 'package:mogawe_test_2/blocs/radio_bloc.dart';

class MuridOption extends StatelessWidget {
  final List<String> option;
  final DetailMuridBloc detailMuridBloc;

  MuridOption({
    Key? key,
    required this.option,
    required this.detailMuridBloc,
  }) : super(key: key);

  final RadioBloc radioBloc = RadioBloc();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: option.length,
      itemBuilder: (_, index) {
        return SizedBox(
          height: 40,
          child: BlocBuilder<RadioBloc, int?>(
            bloc: radioBloc,
            builder: (context, state) {
              return RadioListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  option[index],
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                value: index,
                groupValue: state,
                onChanged: (int? value) {
                  if (state == null) {
                    detailMuridBloc.increase();
                  }
                  radioBloc.selected(value);
                },
              );
            },
          ),
        );
      },
    );
  }
}
