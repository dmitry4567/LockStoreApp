import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class CategoryWidgetMobile extends StatelessWidget {
  const CategoryWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            primary: true,
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
                          fontSize: 14,
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
                          fontSize: 14,
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
                          fontSize: 14,
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
                          fontSize: 14,
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
    );
  }
}
