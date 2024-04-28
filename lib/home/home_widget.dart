import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:flutter/material.dart';
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
          ? Container(
              height: 774 + 126,
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
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.686,
                    child: PageView(
                      controller: controller,
                      onPageChanged: (int page) {
                        _activePage = page;
                      },
                      children: const [
                        PromoWidget(),
                        PromoWidget(),
                        PromoWidget(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _activePage -= 1;
                              controller.previousPage(
                                duration: Durations.long1,
                                curve: Curves.ease,
                              );
                            });
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                SvgPicture.asset("assets/icons/arrow_left.svg"),
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
                            setState(() {
                              _activePage += 1;
                              controller.nextPage(
                                duration: Durations.long1,
                                curve: Curves.ease,
                              );
                            });
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
                  Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle:
                            Text('this is a description of the motivation')),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle:
                            Text('this is a description of the motivation')),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle:
                            Text('this is a description of the motivation')),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle:
                            Text('this is a description of the motivation')),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Motivation $int'),
                        subtitle:
                            Text('this is a description of the motivation')),
                  ),
                ],
              ),
            ),
    );
  }
}

class PromoWidget extends StatelessWidget {
  const PromoWidget({super.key});

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

// final isDesktop = isDisplayDesktop(context);
//     if (isDesktop) {}
//     else {}
