import 'dart:developer';

import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import '../../flutter_flow/custom_functions.dart' as functions;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController controller = PageController(initialPage: 0);
  int _activePage = 0;

  Future<dynamic> getDataProduct() async {
    // final response = await GetAllProduct.call();

    // log(response.toString());

    String url = "$baseUrl/products";

    try {
      final response = await http.get(Uri.parse(url), headers: {
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

    // return projects.map((project) => Product.fromJson(project)).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);

    return Scaffold(
      body: isDesktop
          ? SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 774 + 82,
                      color: Colors.black.withOpacity(0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ScrollConfiguration(
                              behavior: MouseDraggableScrollBehavior(),
                              child: PageView(
                                controller: controller,
                                onPageChanged: (int page) {
                                  setState(() {
                                    _activePage = page;
                                  });
                                },
                                children: const [
                                  PromoWidgetMobileDesktop(),
                                  PromoWidgetMobileDesktop(),
                                  PromoWidgetMobileDesktop(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_activePage > 0) {
                                setState(() {
                                  _activePage -= 1;
                                  controller.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              }
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  "assets/icons/arrow_left.svg"),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 24,
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _activePage == index
                                        ? const Color(0xff4295E4)
                                        : const Color(0xffADD7FF),
                                  ),
                                  width: 12,
                                  height: 12,
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () async {
                              if (_activePage < 2) {
                                setState(() {
                                  _activePage += 1;
                                  controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              }
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  "assets/icons/arrow_right.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                          // SizedBox(
                          //   width: 82,
                          // ),
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
                          // SizedBox(
                          //   width: 82,
                          // ),
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
                          // SizedBox(
                          //   width: 82,
                          // ),
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
                    ),
                    Container(
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
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 100),
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Text(
                            "Категории",
                            style: TextStyle(
                              color: Color(0xff161C24),
                              fontSize: 40,
                              fontFamily: "SF",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              top: 64,
                              left: 100,
                              right: 100,
                            ),
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 40,
                            crossAxisCount: 2,
                            children: [
                              Container(
                                height: 470,
                                color: Colors.black.withOpacity(0.02),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/images/lock2.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Для отелей",
                                            style: TextStyle(
                                              color: Color(0xff161C24),
                                              fontSize: 20,
                                              fontFamily: "SF",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            width: 220,
                                            height: 50,
                                            child: FFButtonWidget(
                                              onPressed: () {},
                                              text: 'Перейти',
                                              options: const FFButtonOptions(
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.transparent,
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color(0xff454F5B),
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xff161C24),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 470,
                                color: Colors.black.withOpacity(0.02),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/images/lock3.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Для шкафчиков",
                                            style: TextStyle(
                                              color: Color(0xff161C24),
                                              fontSize: 20,
                                              fontFamily: "SF",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            width: 220,
                                            height: 50,
                                            child: FFButtonWidget(
                                              onPressed: () {},
                                              text: 'Перейти',
                                              options: const FFButtonOptions(
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.transparent,
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color(0xff454F5B),
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xff161C24),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 470,
                                color: Colors.black.withOpacity(0.02),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/images/lock4.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Для офисов",
                                            style: TextStyle(
                                              color: Color(0xff161C24),
                                              fontSize: 20,
                                              fontFamily: "SF",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            width: 220,
                                            height: 50,
                                            child: FFButtonWidget(
                                              onPressed: () {},
                                              text: 'Перейти',
                                              options: const FFButtonOptions(
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.transparent,
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color(0xff454F5B),
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xff161C24),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 470,
                                color: Colors.black.withOpacity(0.02),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Image.asset(
                                        "assets/images/lock5.png",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Замки для дома",
                                            style: TextStyle(
                                              color: Color(0xff161C24),
                                              fontSize: 20,
                                              fontFamily: "SF",
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Container(
                                            width: 220,
                                            height: 50,
                                            child: FFButtonWidget(
                                              onPressed: () {},
                                              text: 'Перейти',
                                              options: const FFButtonOptions(
                                                width: double.infinity,
                                                height: double.infinity,
                                                color: Colors.transparent,
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  width: 1,
                                                  color: Color(0xff454F5B),
                                                ),
                                                textStyle: TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xff161C24),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 484,
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 36,
                        left: 100,
                        right: 100,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Наши популярные продукты",
                            style: TextStyle(
                              color: Color(0xff161C24),
                              fontSize: 42,
                              fontFamily: "SF",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Expanded(
                            child: FutureBuilder<dynamic>(
                              future: getDataProduct(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                          color: Color(0xFFFFA000)));
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else {
                                  return ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ProductCard(
                                        product:
                                            snapshot.data[index] as Product,
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.686,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (int page) {
                          setState(() {
                            _activePage = page;
                          });
                        },
                        children: const [
                          PromoWidgetMobile(),
                          PromoWidgetMobile(),
                          PromoWidgetMobile(),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(
                          top: 24, left: 8, right: 8, bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_activePage > 0) {
                                setState(() {
                                  _activePage -= 1;
                                  controller.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              }
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  "assets/icons/arrow_left.svg"),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 24,
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _activePage == index
                                        ? const Color(0xff4295E4)
                                        : const Color(0xffADD7FF),
                                  ),
                                  width: 12,
                                  height: 12,
                                );
                              },
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              if (_activePage < 2) {
                                setState(() {
                                  _activePage += 1;
                                  controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              }
                            },
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  "assets/icons/arrow_right.svg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                    ),
                    Container(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
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
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const Text(
                            "Категории",
                            style: TextStyle(
                              color: Color(0xff161C24),
                              fontSize: 20,
                              fontFamily: "SF",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GridView.count(
                            primary: false,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 40,
                            crossAxisCount: 2,
                            children: [
                              Container(
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.black.withOpacity(0.02),
                                      margin: const EdgeInsets.only(bottom: 40),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/lock5.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 0,
                                      child: Text(
                                        "Для отелей",
                                        style: TextStyle(
                                          color: Color(0xff161C24),
                                          fontSize: 12,
                                          fontFamily: "SF",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.black.withOpacity(0.02),
                                      margin: const EdgeInsets.only(bottom: 40),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/lock4.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 0,
                                      child: Text(
                                        "Для шкафчиков",
                                        style: TextStyle(
                                          color: Color(0xff161C24),
                                          fontSize: 12,
                                          fontFamily: "SF",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.black.withOpacity(0.02),
                                      margin: const EdgeInsets.only(bottom: 40),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/lock3.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 0,
                                      child: Text(
                                        "Для офисов",
                                        style: TextStyle(
                                          color: Color(0xff161C24),
                                          fontSize: 12,
                                          fontFamily: "SF",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: Colors.black.withOpacity(0.02),
                                      margin: const EdgeInsets.only(bottom: 40),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/lock2.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      bottom: 0,
                                      child: Text(
                                        "Аксессуары",
                                        style: TextStyle(
                                          color: Color(0xff161C24),
                                          fontSize: 12,
                                          fontFamily: "SF",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            height: 50,
                            child: FFButtonWidget(
                              onPressed: () async {},
                              text: 'Все категории',
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
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 484,
                      padding: const EdgeInsets.only(top: 40, bottom: 36),
                      child: Column(
                        children: [
                          const Text(
                            "Наши популярные продукты",
                            style: TextStyle(
                              color: Color(0xff161C24),
                              fontSize: 20,
                              fontFamily: "SF",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    width: 288 - 40,
                                    height: 426,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                "assets/images/lock5.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, left: 12),
                                              child: Text(
                                                "Дверной Замок Golden Soft для\nотеля",
                                                style: TextStyle(
                                                  color: Color(0xff454F5B),
                                                  fontSize: 14,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 12),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "33 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff161C24),
                                                      fontSize: 18,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    "37 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff454F5B),
                                                      fontSize: 16,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Color(0xffA4A4A4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            top: 17,
                                            right: 12,
                                            child: Container(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              child: const Text(
                                                "SALE",
                                                style: TextStyle(
                                                  color: Color(0xff161C24),
                                                  fontSize: 10,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 17,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                  vertical: 2,
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.one_k,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("В наличии"),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 2),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.search_off_sharp,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("Подарок"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    width: 288 - 40,
                                    height: 426,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                "assets/images/lock5.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, left: 12),
                                              child: Text(
                                                "Дверной Замок Golden Soft для\nотеля",
                                                style: TextStyle(
                                                  color: Color(0xff454F5B),
                                                  fontSize: 14,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 12),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "33 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff161C24),
                                                      fontSize: 18,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    "37 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff454F5B),
                                                      fontSize: 16,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Color(0xffA4A4A4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            top: 17,
                                            right: 12,
                                            child: Container(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              child: const Text(
                                                "SALE",
                                                style: TextStyle(
                                                  color: Color(0xff161C24),
                                                  fontSize: 10,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 17,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                  vertical: 2,
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.one_k,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("В наличии"),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 2),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.search_off_sharp,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("Подарок"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    width: 288 - 40,
                                    height: 426,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                "assets/images/lock5.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, left: 12),
                                              child: Text(
                                                "Дверной Замок Golden Soft для\nотеля",
                                                style: TextStyle(
                                                  color: Color(0xff454F5B),
                                                  fontSize: 14,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 12),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "33 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff161C24),
                                                      fontSize: 18,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    "37 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff454F5B),
                                                      fontSize: 16,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Color(0xffA4A4A4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            top: 17,
                                            right: 12,
                                            child: Container(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              child: const Text(
                                                "SALE",
                                                style: TextStyle(
                                                  color: Color(0xff161C24),
                                                  fontSize: 10,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 17,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                  vertical: 2,
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.one_k,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("В наличии"),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 2),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.search_off_sharp,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("Подарок"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 30),
                                    width: 288 - 40,
                                    height: 426,
                                    color: Colors.white,
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                "assets/images/lock5.png",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 4, left: 12),
                                              child: Text(
                                                "Дверной Замок Golden Soft для\nотеля",
                                                style: TextStyle(
                                                  color: Color(0xff454F5B),
                                                  fontSize: 14,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10, left: 12),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "33 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff161C24),
                                                      fontSize: 18,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    "37 000₽",
                                                    style: TextStyle(
                                                      color: Color(0xff454F5B),
                                                      fontSize: 16,
                                                      fontFamily: "SF",
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Color(0xffA4A4A4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            top: 17,
                                            right: 12,
                                            child: Container(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 4,
                                              ),
                                              child: const Text(
                                                "SALE",
                                                style: TextStyle(
                                                  color: Color(0xff161C24),
                                                  fontSize: 10,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            )),
                                        Positioned(
                                          top: 17,
                                          left: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 4,
                                                  vertical: 2,
                                                ),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.one_k,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("В наличии"),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                color: Colors.black
                                                    .withOpacity(0.02),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4,
                                                        vertical: 2),
                                                child: const Row(
                                                  children: [
                                                    Icon(
                                                      Icons.search_off_sharp,
                                                      size: 12,
                                                      color: Color(0xff4295E4),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Text("Подарок"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class PromoWidgetMobileDesktop extends StatelessWidget {
  const PromoWidgetMobileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/lock1.jpg",
            width: 500,
            height: 500,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            width: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Golden Soft\nGS-200Z-5 для офиса",
                style: TextStyle(
                  color: Color(0xff161C24),
                  fontSize: 42,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Замок дверной электронный Golden Soft\nGS-200Z-5 имеет роскошный глянцевый\nблеск, четкие линии, красивые формы.",
                style: TextStyle(
                  color: Color(0xff161C24),
                  fontSize: 12,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Подходит для установки на\nдеревянную/межкомнатную дверь.",
                style: TextStyle(
                  color: Color(0xff161C24),
                  fontSize: 12,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "Цена",
                style: TextStyle(
                  color: Color(0xff161C24),
                  fontSize: 10,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 4,
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
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Color(0xffA4A4A4),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 220,
                height: 50,
                child: FFButtonWidget(
                  onPressed: () async {},
                  text: 'Добавить в корзину',
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
            ],
          ),
        ],
      ),
    );
  }
}

class PromoWidgetMobile extends StatelessWidget {
  const PromoWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.02),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 0,
            indent: 0,
            thickness: 1,
            color: Colors.grey.shade300,
          ),
          Center(
            child: Image.asset(
              "assets/images/lock1.jpg",
              width: 320,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Golden Soft\nGS-200Z-5 для офиса",
                  style: TextStyle(
                    color: Color(0xff161C24),
                    fontSize: 20,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Цена",
                  style: TextStyle(
                    color: Color(0xff161C24),
                    fontSize: 10,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
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
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "37 000₽",
                      style: TextStyle(
                        color: Color(0xffA4A4A4),
                        fontSize: 20,
                        fontFamily: "SF",
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xffA4A4A4),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: FFButtonWidget(
                    onPressed: () async {},
                    text: 'Добавить в корзину',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: double.infinity,
                      color: Color(0xff4295E4),
                      elevation: 0,
                      textStyle: const TextStyle(
                        fontFamily: 'SF',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      width: 288 - 40,
      height: 426,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xffEAEAEA),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl:
                      "$baseUrl/photoItem/product/${widget.product.photos[0].fileName}",
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 12),
                child: Text(
                  widget.product.title,
                  style: const TextStyle(
                    color: Color(0xff454F5B),
                    fontSize: 14,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12),
                child: Row(
                  children: [
                    Text(
                      widget.product.price.toString() + "₽",
                      style: const TextStyle(
                        color: Color(0xff161C24),
                        fontSize: 18,
                        fontFamily: "SF",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      widget.product.oldPrice.toString() + "₽",
                      style: const TextStyle(
                        color: Color(0xff454F5B),
                        fontSize: 16,
                        fontFamily: "SF",
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xffA4A4A4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Positioned(
            top: 17,
            right: 12,
            child: Container(
              color: Colors.black.withOpacity(0.02),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: const Text(
                "SALE",
                style: TextStyle(
                  color: Color(0xff161C24),
                  fontSize: 10,
                  fontFamily: "SF",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 17,
          //   left: 12,
          //   child: Column(
          //     crossAxisAlignment:
          //         CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         color: Colors.black
          //             .withOpacity(0.02),
          //         padding:
          //             const EdgeInsets.symmetric(
          //           horizontal: 4,
          //           vertical: 2,
          //         ),
          //         child: const Row(
          //           children: [
          //             Icon(
          //               Icons.one_k,
          //               size: 12,
          //               color: Color(0xff4295E4),
          //             ),
          //             SizedBox(
          //               width: 2,
          //             ),
          //             Text("В наличии"),
          //           ],
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),
          //       Container(
          //         color: Colors.black
          //             .withOpacity(0.02),
          //         padding:
          //             const EdgeInsets.symmetric(
          //                 horizontal: 4,
          //                 vertical: 2),
          //         child: const Row(
          //           children: [
          //             Icon(
          //               Icons.search_off_sharp,
          //               size: 12,
          //               color: Color(0xff4295E4),
          //             ),
          //             SizedBox(
          //               width: 2,
          //             ),
          //             Text("Подарок"),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MouseDraggableScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

// final isDesktop = isDisplayDesktop(context);
//     if (isDesktop) {}
//     else {}
