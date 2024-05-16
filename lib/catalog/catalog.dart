import 'dart:convert';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/home/widgets/product.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
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
        backgroundColor: Colors.white,
        body: isDesktop
            ? FutureBuilder<dynamic>(
                future: getDataProduct(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: Color(0xFFFFA000)));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    if (snapshot.hasData) {
                      return Container(
                        padding: const EdgeInsets.only(
                          left: 100,
                          right: 100,
                        ),
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 100,
                                  right: 100,
                                  top: 82 + 86,
                                  bottom: 20,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Все замки",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "(4)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   width: double.infinity,
                              //   height: 200,
                              //   child: ListView.builder(
                              //     padding: const EdgeInsets.all(0),
                              //     shrinkWrap: true,
                              //     itemCount: snapshot.data.length,
                              //     scrollDirection: Axis.horizontal,
                              //     physics: const BouncingScrollPhysics(),
                              //     itemBuilder: (context, index) {
                              //       return ProductCard(
                              //         product:
                              //             snapshot.data[index] as Product,
                              //       );
                              //     },
                              //   ),
                              // ),
                              Container(
                                height: 800,
                                padding: const EdgeInsets.only(
                                  left: 100,
                                  right: 100,
                                ),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 40,
                                    mainAxisSpacing: 40,
                                  ),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      product: snapshot.data[index] as Product,
                                      margin: false,
                                    );
                                  },
                                ),
                              )
                              // GridView.builder(
                              //     primary: false,
                              //     shrinkWrap: true,
                              //     physics:
                              //         const NeverScrollableScrollPhysics(),
                              //     padding: const EdgeInsets.only(
                              //       top: 64,
                              //       left: 100,
                              //       right: 100,
                              //     ),
                              //     crossAxisSpacing: 40,
                              //     mainAxisSpacing: 40,
                              //     crossAxisCount: 2,
                              //     children: [

                              //     ]),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("Ошибка получения данных"),
                      );
                    }
                  }
                })
            : const SizedBox());
  }
}
