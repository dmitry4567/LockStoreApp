import 'dart:convert';

import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Future<dynamic> getDataOneProduct() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/products"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      });

      if (response.statusCode == 200) {
        List<dynamic> projects = jsonDecode(response.body);

        return projects.map((project) => Product.fromJson(project)).toList();
      } else {
        print('Ошибка HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка: $error');
    }
  }

  String _currentPageName = 'Home';

  Map<String, Widget> _tabs = {
    'Home': Text("1"),
    'Home2': Text("2"),
    'Home3': Text("3"),
  };

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: isDesktop
          ? SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: 82 + 86,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: 600,
                                height: 600,
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  "assets/images/lock1.jpg",
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "JA182765",
                                          style: TextStyle(
                                            color: Color(0xff454F5B),
                                            fontSize: 12,
                                            fontFamily: "SF",
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          height: 16,
                                          child: ListView.separated(
                                            shrinkWrap: true,
                                            itemCount: 5,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                width: 6,
                                              );
                                            },
                                            itemBuilder: (context, index) {
                                              return SvgPicture.asset(
                                                  "assets/icons/star_fill.svg");
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Text(
                                          "(12) отзывов",
                                          style: TextStyle(
                                            color: Color(0xff4295E4),
                                            fontSize: 11,
                                            fontFamily: "SF",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    const Text(
                                      "Дверной Замок Golden Soft для офиса",
                                      style: TextStyle(
                                        color: Color(0xff161C24),
                                        fontSize: 22,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    const Text(
                                      "Подходит для установки на:",
                                      style: TextStyle(
                                        color: Color(0xff161C24),
                                        fontSize: 12,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_box,
                                              size: 14,
                                              color: Color(0xff4295E4),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Деревянную дверь",
                                              style: TextStyle(
                                                color: Color(0xff454F5B),
                                                fontSize: 12,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_box,
                                              size: 14,
                                              color: Color(0xff4295E4),
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "Межкомнатную дверь",
                                              style: TextStyle(
                                                color: Color(0xff454F5B),
                                                fontSize: 12,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const ColorController(),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          "33 000₽",
                                          style: TextStyle(
                                            color: Color(0xff161C24),
                                            fontSize: 22,
                                            fontFamily: "SF",
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "37 000₽",
                                          style: TextStyle(
                                            color: Color(0xffA4A4A4),
                                            fontSize: 20,
                                            fontFamily: "SF",
                                            fontWeight: FontWeight.w300,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Color(0xffA4A4A4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 288,
                                          height: 50,
                                          child: FFButtonWidget(
                                            onPressed: () async {},
                                            text: 'Купить',
                                            options: const FFButtonOptions(
                                              width: double.infinity,
                                              height: double.infinity,
                                              color: Color(0xff4295E4),
                                              elevation: 0,
                                              textStyle: TextStyle(
                                                fontFamily: 'SF',
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color: Color(0xff454F5B),
                                              size: 20,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              "В избранное",
                                              style: TextStyle(
                                                color: Color(0xff4D4D4D),
                                                fontSize: 12,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentPageName = _tabs.keys.toList()[0];
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Характеристики",
                                    style: TextStyle(
                                      color: Color(0xff161C24),
                                      fontSize: 18,
                                      fontFamily: "SF",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _currentPageName == _tabs.keys.toList()[0]
                                      ? Container(
                                          width: 140,
                                          child: const Divider(
                                            color: Color(0xff4295E4),
                                            thickness: 3,
                                            height: 2,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 62,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentPageName = _tabs.keys.toList()[1];
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Описание",
                                    style: TextStyle(
                                      color: Color(0xff161C24),
                                      fontSize: 18,
                                      fontFamily: "SF",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _currentPageName == _tabs.keys.toList()[1]
                                      ? Container(
                                          width: 85,
                                          child: const Divider(
                                            color: Color(0xff4295E4),
                                            thickness: 3,
                                            height: 2,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 62,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentPageName = _tabs.keys.toList()[2];
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Отзывы",
                                    style: TextStyle(
                                      color: Color(0xff161C24),
                                      fontSize: 18,
                                      fontFamily: "SF",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _currentPageName == _tabs.keys.toList()[2]
                                      ? Container(
                                          width: 67,
                                          child: const Divider(
                                            color: Color(0xff4295E4),
                                            thickness: 3,
                                            height: 2,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          _tabs[_currentPageName]!,
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(child: Text("fesfsdrgdrgdrg")),
    );
  }
}

class ColorController extends StatefulWidget {
  const ColorController({super.key});

  @override
  State<ColorController> createState() => _ColorControllerState();
}

class _ColorControllerState extends State<ColorController> {
  List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.amber,
  ];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Цвет",
          style: TextStyle(
            color: Color(0xff161C24),
            fontSize: 14,
            fontFamily: "SF",
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 40,
          child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = index;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: colors[index],
                            border: Border.all(
                              color: index == selectedColor
                                  ? const Color(0xff4295E4)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                        index == selectedColor
                            ? const Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Icon(
                                  Icons.done,
                                  color: Color(0xff596469),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
