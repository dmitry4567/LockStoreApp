import 'package:flutter/material.dart';

class InformationWidgetDesktop extends StatelessWidget {
  const InformationWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      color: const Color(0xffF2F8FF),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "5,567",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Счастливых клиентов",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1245",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Продуктов на выбор",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "372",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Продаж в день",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "20",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Лет на рынке",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
