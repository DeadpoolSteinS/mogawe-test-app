import 'package:flutter/material.dart';
import 'package:mogawe_test_2/blocs/list_murid_bloc.dart';
import 'package:mogawe_test_2/global.dart';

class SearchMurid extends StatelessWidget {
  final ListMuridBloc listMuridBloc;

  const SearchMurid({
    Key? key,
    required this.listMuridBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        onChanged: (content) {
          listMuridBloc.filter(content);
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(10),
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(16),
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: darkGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(color: darkGrey),
          ),
          hintText: 'Cari Murid',
          hintStyle: TextStyle(color: darkGrey),
          suffixIcon: Icon(
            Icons.search,
            color: lightBlack,
          ),
        ),
      ),
    );
  }
}
