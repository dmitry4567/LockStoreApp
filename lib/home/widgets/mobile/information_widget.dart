import 'package:flutter/material.dart';

class InformationWidgetMobile extends StatelessWidget {
  const InformationWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF2F8FF),
      child: GridView.count(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0),
        crossAxisCount: 2,
        children: [
          Container(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "5,567",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Счастливых клиентов",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "372",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Продаж в день",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1245",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Продуктов на выбор",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "20",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Лет на рынке",
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
