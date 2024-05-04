import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionWidgetMobile extends StatelessWidget {
  const QuestionWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "Почему GoldenService?",
            style: TextStyle(
              color: Color(0xff161C24),
              fontSize: 20,
              fontFamily: "SF",
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const Divider(
                  height: 0.5,
                  color: Color(0xffC4CDD5),
                ),
                const SizedBox(
                  height: 24,
                ),
                SvgPicture.asset(
                  "assets/icons/box.svg",
                  width: 82,
                  height: 82,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Наносим ваш логотип компании\nна наш продукт",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff454F5B),
                    fontSize: 14,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  height: 0.5,
                  color: Color(0xffC4CDD5),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const Divider(
                  height: 0.5,
                  color: Color(0xffC4CDD5),
                ),
                const SizedBox(
                  height: 24,
                ),
                SvgPicture.asset(
                  "assets/icons/like.svg",
                  width: 82,
                  height: 82,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Наносим ваш логотип компании\nна наш продукт",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff454F5B),
                    fontSize: 14,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  height: 0.5,
                  color: Color(0xffC4CDD5),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const Divider(
                  height: 0.5,
                  color: Color(0xffC4CDD5),
                ),
                const SizedBox(
                  height: 24,
                ),
                SvgPicture.asset(
                  "assets/icons/box.svg",
                  width: 82,
                  height: 82,
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                  "Возврат удвоенной стоимости\nкаждого замка в случае брака.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff454F5B),
                    fontSize: 14,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  height: 0.5,
                  color: Color(0xffC4CDD5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
