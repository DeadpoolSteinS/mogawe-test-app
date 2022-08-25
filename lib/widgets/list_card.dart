import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mogawe_test_2/global.dart';

class ListCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  ListCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String nowTime =
      DateFormat('dd MMM yyyy, HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              icon: const Icon(
                Icons.arrow_forward,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
