import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuestionWidgetDesktop extends StatelessWidget {
  const QuestionWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 433,
      padding: const EdgeInsets.only(top: 93),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "Почему GoldenService?",
            style: TextStyle(
              color: Color(0xff161C24),
              fontSize: 40,
              fontFamily: "SF",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    color: const Color(0xffC4CDD5),
                    height: 226,
                    width: 1,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
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
                          fontSize: 18,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    color: const Color(0xffC4CDD5),
                    height: 226,
                    width: 1,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    color: const Color(0xffC4CDD5),
                    height: 226,
                    width: 1,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
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
                          fontSize: 18,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    color: const Color(0xffC4CDD5),
                    height: 226,
                    width: 1,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    color: const Color(0xffC4CDD5),
                    height: 226,
                    width: 1,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
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
                          fontSize: 18,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    color: const Color(0xffC4CDD5),
                    height: 226,
                    width: 1,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
