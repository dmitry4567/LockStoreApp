import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class CategoryWidgetDesktop extends StatelessWidget {
  const CategoryWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1232,
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
                        width: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        width: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.width * 0.3 > 400 ? 400 : MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
