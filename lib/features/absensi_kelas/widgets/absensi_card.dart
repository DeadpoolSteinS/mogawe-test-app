import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mogawe_test_2/blocs/check_bloc.dart';
import 'package:mogawe_test_2/features/detail_murid/screens/detail_murid_screen.dart';
import 'package:mogawe_test_2/global.dart';

class AbsenesiCard extends StatelessWidget {
  final String title;

  AbsenesiCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String nowTime =
      DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now());
  final CheckBloc checkBloc = CheckBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckBloc, bool>(
      bloc: checkBloc,
      builder: (context, state) {
        return GestureDetector(
          onTap: state
              ? () {}
              : () {
                  Navigator.pushNamed(
                    context,
                    DetailMuridScreen.routeName,
                    arguments: [title, checkBloc],
                  );
                },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: darkGrey),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      const SizedBox(height: 4),
                      Text(
                        "Updated: $nowTime",
                        style: const TextStyle(
                          color: lightBlack,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    state ? Icons.check : Icons.arrow_forward,
                    color: state ? Colors.green : primaryColor,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
