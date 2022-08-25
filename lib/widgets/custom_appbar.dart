import 'package:flutter/material.dart';
import 'package:mogawe_test_2/global.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sms_outlined,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
