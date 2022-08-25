import 'package:flutter/material.dart';
import 'package:mogawe_test_2/global.dart';

class BigBtn extends StatelessWidget {
  final VoidCallback onTap;
  final Widget title;
  final double width;
  final double height;
  final Color bgColor;

  const BigBtn({
    Key? key,
    required this.onTap,
    required this.title,
    this.width = double.infinity,
    this.height = 40,
    this.bgColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        primary: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: title,
    );
  }
}
