import 'package:flutter/material.dart';
import 'package:mogawe_test_2/global.dart';

class CustomTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final int maxLines;
  final Icon? suffix;

  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.maxLines = 1,
    this.suffix,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: darkGrey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: grayFont,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(
                color: grayFont,
              ),
            ),
            suffixIcon: widget.suffix,
          ),
          // validator: (val) {
          //   if (val == null || val.isEmpty) {
          //     return 'Enter your ${widget.title}';
          //   }
          //   return null;
          // },
          maxLines: widget.maxLines,
        ),
      ],
    );
  }
}
