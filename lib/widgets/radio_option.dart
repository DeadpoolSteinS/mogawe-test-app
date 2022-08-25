import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mogawe_test_2/blocs/check_bloc.dart';
import 'package:mogawe_test_2/blocs/progress_absen_bloc.dart';
import 'package:mogawe_test_2/blocs/radio_bloc.dart';

class RadioOption extends StatelessWidget {
  final CheckBloc checkBloc;
  final List<String> option;

  RadioOption({
    Key? key,
    required this.checkBloc,
    required this.option,
  }) : super(key: key);

  final RadioBloc radioBloc = RadioBloc();

  @override
  Widget build(BuildContext context) {
    ProgressAbsenBloc progressAbsenBloc = context.read<ProgressAbsenBloc>();
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
                    progressAbsenBloc.increase();
                    checkBloc.change();
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
