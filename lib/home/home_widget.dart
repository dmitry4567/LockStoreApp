import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/home/widgets/desktop/category_widget.dart';
import 'package:LockStore/home/widgets/desktop/information_widget.dart';
import 'package:LockStore/home/widgets/desktop/question_widget.dart';
import 'package:LockStore/home/widgets/mobile/category_widget.dart';
import 'package:LockStore/home/widgets/mobile/information_widget.dart';
import 'package:LockStore/home/widgets/mobile/question_widget.dart';
import 'package:LockStore/home/widgets/product.dart';
import 'package:LockStore/home/widgets/promo_widget.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:LockStore/product/widgets/desktop/call_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<dynamic> getDataProduct() async {
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

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);

    return Scaffold(
      body: isDesktop
          ? Container(
              color: Colors.white,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PromoWidgetController(
                      child: PromoWidgetDesktop(),
                    ),
                    const InformationWidgetDesktop(),
                    const QuestionWidgetDesktop(),
                    const CategoryWidgetDesktop(),
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
                                  if (snapshot.hasData) {
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
                                          margin: true,
                                        );
                                      },
                                    );
                                  } else {
                                    return const Center(
                                      child: Text("Ошибка получения данных"),
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CallDesktop(),
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
                    const PromoWidgetController(
                      child: PromoWidgetMobile(),
                    ),
                    const InformationWidgetMobile(),
                    const QuestionWidgetMobile(),
                    const CategoryWidgetMobile(),
                    Container(
                      width: double.infinity,
                      height: 484,
                      padding: const EdgeInsets.only(
                        top: 40,
                        bottom: 36,
                        left: 16,
                        right: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  if (snapshot.hasData) {
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
                                          margin: true,
                                        );
                                      },
                                    );
                                  } else {
                                    return const Center(
                                        child: Text("Ошибка получения данных"));
                                  }
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
            ),
    );
  }
}
