import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui';

class PromoWidgetController extends StatefulWidget {
  const PromoWidgetController({super.key, required this.child});

  final Widget child;

  @override
  State<PromoWidgetController> createState() => _PromoWidgetControllerState();
}

class _PromoWidgetControllerState extends State<PromoWidgetController> {
  final PageController controller = PageController(initialPage: 0);
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: widget.child is PromoWidgetDesktop
                ? 774 + 82
                : MediaQuery.of(context).size.height * 0.7,
            color: Colors.white,
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
                        widget.child,
                        widget.child,
                        widget.child,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (_activePage > 0) {
                      setState(() {
                        _activePage -= 1;
                        controller.previousPage(
                          duration: const Duration(milliseconds: 300),
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
                    child: SvgPicture.asset("assets/icons/arrow_left.svg"),
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
                        margin: const EdgeInsets.symmetric(horizontal: 8),
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
                          duration: const Duration(milliseconds: 300),
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
                    child: SvgPicture.asset("assets/icons/arrow_right.svg"),
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

class PromoWidgetDesktop extends StatelessWidget {
  const PromoWidgetDesktop({super.key});

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
                const Text(
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
                  width: double.infinity,
                  height: 50,
                  child: FFButtonWidget(
                    onPressed: () async {},
                    text: 'Добавить в корзину',
                    options: const FFButtonOptions(
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
