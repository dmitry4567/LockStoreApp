import 'dart:convert';
import 'package:LockStore/app_state.dart';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/home/cartItem.dart';
import 'package:LockStore/home/home_widget.dart';
import 'package:LockStore/navigation_bar_widget.dart';
import 'package:LockStore/order/order.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class CartDialogMobile extends StatefulWidget {
  const CartDialogMobile(this.keyScaffold, {super.key});

  final GlobalKey<ScaffoldState> keyScaffold;

  @override
  State<CartDialogMobile> createState() => _CartDialogMobileState();
}

class _CartDialogMobileState extends State<CartDialogMobile> {
  Future<int> getTotalPrice() async {
    try {
      final response = await http
          .get(Uri.parse("$baseUrl/cart/getUserCartTotalPrice"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${FFAppState().userAuthToken}'
      });

      if (response.statusCode == 200) {
        int price = jsonDecode(response.body);

        return price;
      } else {
        print('Ошибка HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка: $error');
    }

    return 0;
  }

  Future<List<CartItem>> getCartItems() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/cart/all"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${FFAppState().userAuthToken}'
      });

      if (response.statusCode == 200) {
        dynamic projects = jsonDecode(response.body);

        List<dynamic> data = projects['data'];
        totalPrice = projects['totalPrice'];

        setState(() {});

        return data.map((data2) => CartItem.fromJson(data2)).toList();
      } else {
        print('Ошибка HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка: $error');
    }
    return [];
  }

  Future<dynamic> deleteProduct(int id) async {
    try {
      final response =
          await http.delete(Uri.parse("$baseUrl/cart/$id"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer ${FFAppState().userAuthToken}'
      });

      if (response.statusCode == 200) {
        print("delete");
      } else {
        print('Ошибка HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка: $error');
    }
    return null;
  }

  Future<dynamic> updateQuantityProduct(int productId, int quantity) async {
    try {
      final response = await http
          .patch(Uri.parse("$baseUrl/cart/updateProductFromCart"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*',
        'Authorization': 'Bearer ${FFAppState().userAuthToken}'
      }, body: {
        "productId": productId.toString(),
        "quantity": quantity.toString()
      });

      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);

        int newPrice = data['updateTotalPrice'];

        totalPrice = newPrice;

        setState(() {});

        return "1";
      } else {
        print('Ошибка HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка: $error');
    }
    return null;
  }

  Future<List<CartItem>>? cartItems;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();

    cartItems = getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        ),
      ),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 24,
                  bottom: 16,
                  left: 16,
                  right: 16,
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
                child: FutureBuilder<List<CartItem>>(
                  future: cartItems,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFF4295E4)));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              color: Colors.white,
                              child: Row(
                                children: [
                                  CachedNetworkImage(
                                    width: 68,
                                    imageUrl:
                                        "$baseUrl/photoItem/product/${snapshot.data[index].product.photoItems[0].fileName}",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                      color: Color(0xFF4295E4),
                                    )),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 68,
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
                                              Text(
                                                snapshot
                                                    .data[index].product.title,
                                                style: const TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xFF161C24),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      if (snapshot.data[index]
                                                              .quantity >
                                                          1) {
                                                        updateQuantityProduct(
                                                            snapshot.data[index]
                                                                .product.id,
                                                            snapshot.data[index]
                                                                    .quantity -
                                                                1);

                                                        setState(() {
                                                          snapshot.data[index]
                                                                  .quantity =
                                                              snapshot
                                                                      .data[
                                                                          index]
                                                                      .quantity -
                                                                  1;
                                                        });
                                                      }
                                                    },
                                                    icon: SvgPicture.asset(
                                                      "assets/icons/minus.svg",
                                                      width: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xffEAEAEA),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    width: 40,
                                                    height: 23,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      snapshot
                                                          .data[index].quantity
                                                          .toString(),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  IconButton(
                                                    onPressed: () async {
                                                      updateQuantityProduct(
                                                          snapshot.data[index]
                                                              .product.id,
                                                          snapshot.data[index]
                                                                  .quantity +
                                                              1);

                                                      setState(() {
                                                        snapshot.data[index]
                                                            .quantity = snapshot
                                                                .data[index]
                                                                .quantity +
                                                            1;
                                                      });
                                                    },
                                                    icon: SvgPicture.asset(
                                                      "assets/icons/plus.svg",
                                                      width: 16,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  await deleteProduct(snapshot
                                                      .data[index].product.id);
                                                  setState(
                                                    () {
                                                      cartItems =
                                                          getCartItems();
                                                    },
                                                  );
                                                },
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: Color(0xff4295E4),
                                                  weight: 24,
                                                ),
                                              ),
                                              Text(
                                                "${snapshot.data[index].product.price.toString()}₽",
                                                style: const TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xFF161C24),
                                                  fontSize: 14,
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
                        );
                      } else {
                        return const Center(
                            child: Text("Ошибка получения данных"));
                      }
                    }
                  },
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.only(
                  top: 18,
                  left: 16,
                  right: 16,
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
                          "$totalPrice₽",
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
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 44,
                          child: FFButtonWidget(
                            onPressed: () async {
                              final navBarWidgetState = widget
                                  .keyScaffold.currentState!.context
                                  .findAncestorStateOfType<NavBarPageState>();

                              navBarWidgetState!
                                  .changeWidget(const OrderPage());

                              Navigator.pop(context);
                            },
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
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          width: double.infinity,
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
                                fontWeight: FontWeight.w400,
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
  }
}
