import 'dart:developer';

import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../flutter_flow/custom_functions.dart' as functions;

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController controller = PageController(initialPage: 0);
  int _activePage = 0;

  Future<dynamic> getData() async {
    final response =
        await GetAllProject.call(token: FFAppState().userAuthToken);

    if (functions.resultCodeSuccess(getJsonField(
      (response.jsonBody ?? ''),
      r'''$.status''',
    ))) {
      var projects = getJsonField(response.jsonBody ?? '', r'''$.data''');

      return projects.map((project) => Project.fromJson(project)).toList();
    }

    return null;
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
                                children: [
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
                                    duration: Durations.long1,
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
                                    duration: Durations.long1,
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
                                    Expanded(
                                      child: Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset(
                                          "assets/images/lock2.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
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
                                    Expanded(
                                      child: Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset(
                                          "assets/images/lock3.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
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
                                    Expanded(
                                      child: Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset(
                                          "assets/images/lock4.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
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
                                    Expanded(
                                      child: Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Image.asset(
                                          "assets/images/lock5.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      bottom: 20,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
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
                  ],
                ),
              ),
            )
          : Container(
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
                                    duration: Durations.long1,
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
                                    duration: Durations.long1,
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
                      color: Colors.white,
                      child: GridView.count(
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
                                      fontWeight: FontWeight.w400,
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
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),Container(
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
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),Container(
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
                                      fontWeight: FontWeight.w400,
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
              Text(
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
              Text(
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
              Text(
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
              const SizedBox(
                height: 16,
              ),
              Container(
                width: 220,
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
