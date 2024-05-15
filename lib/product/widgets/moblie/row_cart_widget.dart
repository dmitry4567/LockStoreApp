import 'package:flutter/material.dart';

class RowCartWidget extends StatelessWidget {
  const RowCartWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.color});

  final String title;
  final String text;
  final bool color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ? const Color(0xffFAFAFA) : Colors.white,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff181818),
                fontSize: 16,
                fontFamily: "SF",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xff454F5B),
                fontSize: 14,
                fontFamily: "SF",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
