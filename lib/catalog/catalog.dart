import 'dart:convert';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/home/widgets/product.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                                padding: const EdgeInsets.only(
                                  left: 100,
                                  right: 100,
                                  top: 82 + 86,
                                  bottom: 20,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Все замки",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "(${snapshot.data.length})",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height - 225,
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
                                      product:
                                          snapshot.data[index] as Product,
                                      margin: false,
                                    );
                                  },
                                ),
                              )
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
            : FutureBuilder<dynamic>(
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
                        width: double.infinity,
                        height: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top,
                                  bottom: 20,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Все замки",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 26,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "(${snapshot.data.length})",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    MediaQuery.of(context).padding.top,
                                child: GridView.builder(
                                  padding: const EdgeInsets.all(0),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 30,
                                  ),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      product:
                                          snapshot.data[index] as Product,
                                      margin: false,
                                    );
                                  },
                                ),
                              )
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
                }));
  }
}
