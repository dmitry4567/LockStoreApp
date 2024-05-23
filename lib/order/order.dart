import 'dart:convert';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:LockStore/app_state.dart';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
import 'package:LockStore/home/cartItem.dart';
import 'package:LockStore/home/home_widget.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:LockStore/navigation_bar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int? _deliveryValue = 0;
  int? _paymentValue = 0;

  List<String> _delivery = ['Сдек', 'Почта России', 'Деловые линии'];
  List<String> _payment = ['Оплата при получении товара', 'Банковская карта'];

  Future<bool> makeOrder() async {
    try {
      final response =
          await http.post(Uri.parse("$baseUrl/order/post"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*',
        'Authorization': 'Bearer ${FFAppState().userAuthToken}'
      }, body: {
        "status": "fsef",
        "shippingAddress": "fsef"
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Ошибка: $error');
    }
    return false;
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
    final isDesktop = isDisplayDesktop(context);

    return Scaffold(
      body: isDesktop
          ? Container(
              color: Colors.white,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 100,
                    right: 100,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 82 + 40,
                        ),
                        color: Colors.white,
                        child: const Text(
                          "Оформление заказа",
                          style: TextStyle(
                            color: Color(0xff161C24),
                            fontSize: 42,
                            fontFamily: "SF",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 57,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffEAEAEA),
                                    width: 1,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '1. Контактные данные',
                                      style: TextStyle(
                                        color: Color(0xff161C24),
                                        fontSize: 18,
                                        fontFamily: "SF",
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 44,
                                                child: TextFormField(
                                                  obscureText: false,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Фамилия',
                                                    hintStyle: TextStyle(
                                                      color: Color(0xffADADAD),
                                                      fontSize: 14,
                                                      fontFamily: 'SF',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffEBECEC),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4295E4),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFF14343),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 14, 16, 14),
                                                  ),
                                                  style: const TextStyle(
                                                    fontFamily: 'SF',
                                                    color: Color(0xFF454F5B),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                height: 44,
                                                child: TextFormField(
                                                  obscureText: false,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Имя',
                                                    hintStyle: TextStyle(
                                                      color: Color(0xffADADAD),
                                                      fontSize: 14,
                                                      fontFamily: 'SF',
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xffEBECEC),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4295E4),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFF14343),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 14, 16, 14),
                                                  ),
                                                  style: const TextStyle(
                                                    fontFamily: 'SF',
                                                    color: Color(0xFF454F5B),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: 44,
                                              child: TextFormField(
                                                obscureText: false,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'Телефон',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xffADADAD),
                                                    fontSize: 14,
                                                    fontFamily: 'SF',
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xffEBECEC),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff4295E4),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFF14343),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              16, 14, 16, 14),
                                                ),
                                                style: const TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xFF454F5B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 44,
                                              child: TextFormField(
                                                obscureText: false,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'E-mail',
                                                  hintStyle: TextStyle(
                                                    color: Color(0xffADADAD),
                                                    fontSize: 14,
                                                    fontFamily: 'SF',
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xffEBECEC),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff4295E4),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFF14343),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              16, 14, 16, 14),
                                                ),
                                                style: const TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xFF454F5B),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 24),
                                      child: const Text(
                                        '2. Доставка',
                                        style: TextStyle(
                                          color: Color(0xff161C24),
                                          fontSize: 18,
                                          fontFamily: "SF",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Column(
                                        children: <Widget>[
                                          for (int i = 0;
                                              i <= _delivery.length - 1;
                                              i++)
                                            Row(
                                              children: [
                                                Radio(
                                                  value: i,
                                                  groupValue: _deliveryValue,
                                                  activeColor:
                                                      const Color(0xff4295E4),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _deliveryValue = value;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  _delivery[i],
                                                  style: const TextStyle(
                                                    fontFamily: 'SF',
                                                    color: Color(0xFF454F5B),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 24),
                                      child: const Text(
                                        '3. Доставка',
                                        style: TextStyle(
                                          color: Color(0xff161C24),
                                          fontSize: 18,
                                          fontFamily: "SF",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Column(
                                        children: <Widget>[
                                          for (int i = 0;
                                              i <= _payment.length - 1;
                                              i++)
                                            Row(
                                              children: [
                                                Radio(
                                                  value: i,
                                                  groupValue: _paymentValue,
                                                  activeColor:
                                                      const Color(0xff4295E4),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _paymentValue = value;
                                                    });
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  _payment[i],
                                                  style: const TextStyle(
                                                    fontFamily: 'SF',
                                                    color: Color(0xFF454F5B),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 24),
                                      width: 647,
                                      height: 150,
                                      child: TextFormField(
                                        maxLines: 10,
                                        obscureText: false,
                                        decoration: const InputDecoration(
                                          hintText: 'Напишите комментарий',
                                          hintStyle: TextStyle(
                                            color: Color(0xffADADAD),
                                            fontSize: 14,
                                            fontFamily: 'SF',
                                            fontWeight: FontWeight.w300,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xffEBECEC),
                                              width: 1,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff4295E4),
                                              width: 1,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFF14343),
                                              width: 1,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 14, 16, 14),
                                        ),
                                        style: const TextStyle(
                                          fontFamily: 'SF',
                                          color: Color(0xFF454F5B),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Flexible(
                              flex: 43,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffEAEAEA),
                                    width: 1,
                                  ),
                                ),
                                child: FutureBuilder<List<CartItem>>(
                                  future: cartItems,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<dynamic> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          color: Color(0xFF4295E4),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'));
                                    } else {
                                      if (snapshot.hasData) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 16,
                                                horizontal: 16,
                                              ),
                                              child: Text(
                                                "Итого",
                                                style: TextStyle(
                                                  fontFamily: 'SF',
                                                  color: Color(0xFF161C24),
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                              height: 0.5,
                                              color: Color(0xffEAEAEA),
                                            ),
                                            snapshot.data.length == 0
                                                ? Container(
                                                    width: double.infinity,
                                                    height: 200,
                                                    color: Colors.white,
                                                    child: const Center(
                                                      child:
                                                          Text("Товаров нет"),
                                                    ),
                                                  )
                                                : ListView.builder(
                                                    itemCount:
                                                        snapshot.data.length,
                                                    shrinkWrap: true,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Container(
                                                        margin: const EdgeInsets
                                                            .symmetric(
                                                          horizontal: 30,
                                                          vertical: 24,
                                                        ),
                                                        color: Colors.white,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  CachedNetworkImage(
                                                                width: 136,
                                                                imageUrl:
                                                                    "$baseUrl/photoItem/product/${snapshot.data[index].product.photoItems[0].fileName}",
                                                                fit: BoxFit
                                                                    .cover,
                                                                placeholder: (context,
                                                                        url) =>
                                                                    const Center(
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                  color: Color(
                                                                      0xFF4295E4),
                                                                )),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    const Icon(Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 136,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 4,
                                                                ),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          snapshot
                                                                              .data[index]
                                                                              .product
                                                                              .title,
                                                                          style:
                                                                              const TextStyle(
                                                                            fontFamily:
                                                                                'SF',
                                                                            color:
                                                                                Color(0xFF161C24),
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            IconButton(
                                                                              onPressed: () async {
                                                                                if (snapshot.data[index].quantity > 1) {
                                                                                  updateQuantityProduct(snapshot.data[index].product.id, snapshot.data[index].quantity - 1);

                                                                                  setState(() {
                                                                                    snapshot.data[index].quantity = snapshot.data[index].quantity - 1;
                                                                                  });
                                                                                }
                                                                              },
                                                                              icon: SvgPicture.asset("assets/icons/minus.svg"),
                                                                            ),
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                border: Border.all(
                                                                                  color: const Color(0xffEAEAEA),
                                                                                  width: 1,
                                                                                ),
                                                                              ),
                                                                              width: 60,
                                                                              height: 32,
                                                                              alignment: Alignment.center,
                                                                              child: Text(snapshot.data[index].quantity.toString()),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: () async {
                                                                                updateQuantityProduct(snapshot.data[index].product.id, snapshot.data[index].quantity + 1);

                                                                                setState(() {
                                                                                  snapshot.data[index].quantity = snapshot.data[index].quantity + 1;
                                                                                });
                                                                              },
                                                                              icon: SvgPicture.asset("assets/icons/plus.svg"),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            await deleteProduct(snapshot.data[index].product.id);
                                                                            setState(
                                                                              () {
                                                                                cartItems = getCartItems();
                                                                              },
                                                                            );
                                                                          },
                                                                          child:
                                                                              const Row(
                                                                            children: [
                                                                              Icon(
                                                                                Icons.close,
                                                                                color: Color(0xff161C24),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "${snapshot.data[index].product.price.toString()}₽",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontFamily:
                                                                                'SF',
                                                                            color:
                                                                                Color(0xFF161C24),
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
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
                                            Container(
                                              padding: const EdgeInsets.only(
                                                right: 24,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    "К оплате:",
                                                    style: TextStyle(
                                                        fontFamily: 'SF',
                                                        color:
                                                            Color(0xFF161C24),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "$totalPrice₽",
                                                    style: const TextStyle(
                                                        fontFamily: 'SF',
                                                        color:
                                                            Color(0xFF161C24),
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height: 1),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16,
                                                      horizontal: 24),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  if (totalPrice != 0) {
                                                    makeOrder().then((value) {
                                                      if (value) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(functions
                                                                .setupSnackBarInfo(
                                                                    "Заказ оформлен"));

                                                        final navBarWidgetState =
                                                            context.findAncestorStateOfType<
                                                                NavBarPageState>();

                                                        navBarWidgetState!
                                                            .changeWidget(
                                                                const HomePage());
                                                      }
                                                    });
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(functions
                                                            .setupSnackBarInfo(
                                                                "Заказ пустой"));
                                                  }
                                                },
                                                text: 'Подтвердить заказ',
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
                                        );
                                      } else {
                                        return const Center(
                                            child: Text(
                                                "Ошибка получения данных"));
                                      }
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 24,
                        ),
                        child: const Text(
                          "Оформление заказа",
                          style: TextStyle(
                            color: Color(0xff161C24),
                            fontSize: 22,
                            fontFamily: "SF",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        '1. Контактные данные',
                        style: TextStyle(
                          color: Color(0xff161C24),
                          fontSize: 18,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Имя',
                            hintStyle: TextStyle(
                              color: Color(0xffADADAD),
                              fontSize: 14,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEBECEC),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4295E4),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF14343),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                          ),
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Color(0xFF454F5B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Фамилия',
                            hintStyle: TextStyle(
                              color: Color(0xffADADAD),
                              fontSize: 14,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEBECEC),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4295E4),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF14343),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                          ),
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Color(0xFF454F5B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Телефон',
                            hintStyle: TextStyle(
                              color: Color(0xffADADAD),
                              fontSize: 14,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEBECEC),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4295E4),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF14343),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                          ),
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Color(0xFF454F5B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: TextFormField(
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'E-mail',
                            hintStyle: TextStyle(
                              color: Color(0xffADADAD),
                              fontSize: 14,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEBECEC),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4295E4),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF14343),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                          ),
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Color(0xFF454F5B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: Text(
                          '2. Доставка',
                          style: TextStyle(
                            color: Color(0xff161C24),
                            fontSize: 18,
                            fontFamily: "SF",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          children: <Widget>[
                            for (int i = 0; i <= _delivery.length - 1; i++)
                              Row(
                                children: [
                                  Radio(
                                    value: i,
                                    groupValue: _deliveryValue,
                                    activeColor: const Color(0xff4295E4),
                                    onChanged: (value) {
                                      setState(() {
                                        _deliveryValue = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    _delivery[i],
                                    style: const TextStyle(
                                      fontFamily: 'SF',
                                      color: Color(0xFF454F5B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24),
                        child: Text(
                          '3. Оплата',
                          style: TextStyle(
                            color: Color(0xff161C24),
                            fontSize: 18,
                            fontFamily: "SF",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          children: <Widget>[
                            for (int i = 0; i <= _payment.length - 1; i++)
                              Row(
                                children: [
                                  Radio(
                                    value: i,
                                    groupValue: _paymentValue,
                                    activeColor: const Color(0xff4295E4),
                                    onChanged: (value) {
                                      setState(() {
                                        _paymentValue = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    _payment[i],
                                    style: const TextStyle(
                                      fontFamily: 'SF',
                                      color: Color(0xFF454F5B),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 24),
                        height: 150,
                        child: TextFormField(
                          maxLines: 10,
                          obscureText: false,
                          decoration: const InputDecoration(
                            hintText: 'Напишите комментарий',
                            hintStyle: TextStyle(
                              color: Color(0xffADADAD),
                              fontSize: 14,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w300,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffEBECEC),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff4295E4),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFF14343),
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
                          ),
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Color(0xFF454F5B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      FutureBuilder<List<CartItem>>(
                        future: cartItems,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF4295E4),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            if (snapshot.hasData) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      // horizontal: 24,
                                    ),
                                    child: Text(
                                      "Итого",
                                      style: TextStyle(
                                        fontFamily: 'SF',
                                        color: Color(0xFF161C24),
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 0.5,
                                    color: Color(0xffEAEAEA),
                                  ),
                                  snapshot.data.length == 0
                                      ? Container(
                                          width: double.infinity,
                                          height: 200,
                                          color: Colors.white,
                                          child: const Center(
                                            child: Text("Товаров нет"),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: snapshot.data.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 30,
                                                vertical: 24,
                                              ),
                                              color: Colors.white,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: CachedNetworkImage(
                                                      width: 136,
                                                      imageUrl:
                                                          "$baseUrl/photoItem/product/${snapshot.data[index].product.photoItems[0].fileName}",
                                                      fit: BoxFit.cover,
                                                      placeholder: (context,
                                                              url) =>
                                                          const Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                        color:
                                                            Color(0xFF4295E4),
                                                      )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          const Icon(
                                                              Icons.error),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Container(
                                                      height: 136,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 4,
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot
                                                                    .data[index]
                                                                    .product
                                                                    .title,
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'SF',
                                                                  color: Color(
                                                                      0xFF161C24),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      if (snapshot
                                                                              .data[index]
                                                                              .quantity >
                                                                          1) {
                                                                        updateQuantityProduct(
                                                                            snapshot.data[index].product.id,
                                                                            snapshot.data[index].quantity - 1);

                                                                        setState(
                                                                            () {
                                                                          snapshot
                                                                              .data[index]
                                                                              .quantity = snapshot.data[index].quantity - 1;
                                                                        });
                                                                      }
                                                                    },
                                                                    icon: SvgPicture
                                                                        .asset(
                                                                            "assets/icons/minus.svg"),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: const Color(
                                                                            0xffEAEAEA),
                                                                        width:
                                                                            1,
                                                                      ),
                                                                    ),
                                                                    width: 60,
                                                                    height: 32,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(snapshot
                                                                        .data[
                                                                            index]
                                                                        .quantity
                                                                        .toString()),
                                                                  ),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      updateQuantityProduct(
                                                                          snapshot
                                                                              .data[
                                                                                  index]
                                                                              .product
                                                                              .id,
                                                                          snapshot.data[index].quantity +
                                                                              1);

                                                                      setState(
                                                                          () {
                                                                        snapshot
                                                                            .data[
                                                                                index]
                                                                            .quantity = snapshot
                                                                                .data[index].quantity +
                                                                            1;
                                                                      });
                                                                    },
                                                                    icon: SvgPicture
                                                                        .asset(
                                                                            "assets/icons/plus.svg"),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  await deleteProduct(
                                                                      snapshot
                                                                          .data[
                                                                              index]
                                                                          .product
                                                                          .id);
                                                                  setState(
                                                                    () {
                                                                      cartItems =
                                                                          getCartItems();
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: Color(
                                                                          0xff161C24),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                "${snapshot.data[index].product.price.toString()}₽",
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      'SF',
                                                                  color: Color(
                                                                      0xFF161C24),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
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
                                  Container(
                                    padding: const EdgeInsets.only(
                                      right: 24,
                                    ),
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "К оплате:",
                                          style: TextStyle(
                                              fontFamily: 'SF',
                                              color: Color(0xFF161C24),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 1),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "$totalPrice₽",
                                          style: const TextStyle(
                                              fontFamily: 'SF',
                                              color: Color(0xFF161C24),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              height: 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        if (totalPrice != 0) {
                                          makeOrder().then((value) {
                                            if (value) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(functions
                                                      .setupSnackBarInfo(
                                                          "Заказ оформлен"));

                                              final navBarWidgetState = context
                                                  .findAncestorStateOfType<
                                                      NavBarPageState>();

                                              navBarWidgetState!.changeWidget(
                                                  const HomePage());
                                            }
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                                  functions.setupSnackBarInfo(
                                                      "Заказ пустой"));
                                        }
                                      },
                                      text: 'Подтвердить заказ',
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
                              );
                            } else {
                              return const Center(
                                  child: Text("Ошибка получения данных"));
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
