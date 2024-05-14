import 'package:LockStore/category/category_widget.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/flutter_flow/nav/nav.dart';
import 'package:LockStore/home/home_widget.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:LockStore/product/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    Key? key,
    required this.initialPage,
    this.params,
  }) : super(key: key);

  final String initialPage;
  final FFParameters? params;

  @override
  State<NavBarWidget> createState() => NavBarPageState();
}

class NavBarPageState extends State<NavBarWidget> {
  late String _currentPageName;

  Map<String, Widget> _tabs = {
    'Home': HomePage(),
    'Category': CategoryPage(),
    'ProductPage': ProductPage(),
  };

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage;
  }

  void changePage(int value) {
    setState(() {
      _currentPageName = _tabs.keys.toList()[value];
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final currentIndex = _tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      key: _key,
      appBar: !isDesktop
          ? AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          width: 32, height: 32, "assets/icons/heart.svg"),
                      const SizedBox(
                        width: 24,
                      ),
                      SvgPicture.asset(
                          width: 32, height: 32, "assets/icons/shop.svg"),
                    ],
                  ),
                ),
              ],
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _tabs[_currentPageName]!,
          isDesktop
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 82,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          width: 50,
                                          height: 42,
                                          "assets/icons/logo.svg",
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _currentPageName =
                                                  _tabs.keys.toList()[0];
                                            });
                                          },
                                          child: const Text(
                                            "Главная",
                                            style: TextStyle(
                                                color: Color(0xff161C24),
                                                fontSize: 18,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 32,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _currentPageName =
                                                  _tabs.keys.toList()[1];
                                            });
                                          },
                                          child: const Text(
                                            "Каталог",
                                            style: TextStyle(
                                                color: Color(0xff161C24),
                                                fontSize: 18,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 32,
                                        ),
                                        const Text(
                                          "Оптовая продажа",
                                          style: TextStyle(
                                              color: Color(0xff161C24),
                                              fontSize: 18,
                                              fontFamily: "SF",
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              width: 20,
                                              height: 20,
                                              "assets/icons/phone.svg",
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Text(
                                              "+7 (966) 55 88 499",
                                              style: TextStyle(
                                                  color: Color(0xff454F5B),
                                                  fontSize: 16,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _showSimpleDialog(context);
                                              },
                                              child: SvgPicture.asset(
                                                  width: 32,
                                                  height: 32,
                                                  "assets/icons/heart.svg"),
                                            ),
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                setState(() {
                                                  prefs.clear();

                                                  context.push("/signIn");
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                  width: 32,
                                                  height: 32,
                                                  "assets/icons/shop.svg"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                    // GestureDetector(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       _currentPageName = _tabs.keys.toList()[0];
                                    //     });
                                    //   },
                                    //   child: Container(
                                    //     width: 50,
                                    //     height: 30,
                                    //     color: Colors.white,
                                    //     child: const Text(
                                    //       "fsefs1",
                                    //       style: TextStyle(color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       _currentPageName = _tabs.keys.toList()[1];
                                    //     });
                                    //   },
                                    //   child: Container(
                                    //     width: 50,
                                    //     height: 30,
                                    //     color: Colors.white,
                                    //     child: const Text(
                                    //       "fsefs2",
                                    //       style: TextStyle(color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 0,
                            indent: 0,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

void _showSimpleDialog(context) {

  void getDataOrder() {
    
  }

  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            ),
          ),
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                      bottom: 16,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Корзина",
                          style: TextStyle(
                            fontFamily: 'SF',
                            color: Color(0xFF161C24),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            weight: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0.5,
                    color: Color(0xffEAEAEA),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 9,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 200,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 24,
                          ),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/lock1.jpg",
                                width: 136,
                              ),
                              Expanded(
                                child: Container(
                                  height: 136,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Дверной Замок Golden Soft для офиса",
                                            style: TextStyle(
                                              fontFamily: 'SF',
                                              color: Color(0xFF161C24),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: SvgPicture.asset(
                                                    "assets/icons/minus.svg"),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xffEAEAEA),
                                                    width: 1,
                                                  ),
                                                ),
                                                width: 60,
                                                height: 32,
                                                alignment: Alignment.center,
                                                child: const Text("1"),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              GestureDetector(
                                                onTap: () {},
                                                child: SvgPicture.asset(
                                                    "assets/icons/plus.svg"),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.delete_outline,
                                                color: Color(0xff4295E4),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Удалить",
                                                style: TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xFF4295E4),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "33 000₽",
                                            style: TextStyle(
                                              fontFamily: 'SF',
                                              color: Color(0xFF161C24),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                      left: 30,
                      right: 30,
                      bottom: 18,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Итого:",
                              style: TextStyle(
                                fontFamily: 'SF',
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${66000}₽",
                              style: const TextStyle(
                                fontFamily: 'SF',
                                color: Color(0xFF161C24),
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 249,
                              height: 44,
                              child: FFButtonWidget(
                                onPressed: () async {},
                                text: 'Оформить заказ',
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
                            Container(
                              width: 216,
                              height: 44,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: const Color(0xff4295E4),
                                width: 1,
                              )),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Продолжить покупки',
                                options: const FFButtonOptions(
                                  width: double.infinity,
                                  height: double.infinity,
                                  color: Colors.white,
                                  elevation: 0,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}

//  onTap: (index) {
            //     if (index != 3) {
            //       setState(() {
            //         _currentPageName = _tabs.keys.toList()[index];
            //       });
            //     }
            //   },