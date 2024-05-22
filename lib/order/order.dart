import 'package:LockStore/app_state.dart';
import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_widgets.dart';
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

  Future<dynamic> makeOrder() async {
    try {
      final response =
          await http.patch(Uri.parse("$baseUrl/order/post"), headers: {
        "Access-Control-Allow-Origin": "*",
        'Accept': '*/*',
        'Authorization': 'Bearer ${FFAppState().userAuthToken}'
      }, body: {
        "status": "fsef",
        "shippingAddress": "fsef"
      });

      if (response.statusCode == 200) {
        final navBarWidgetState =
            context.findAncestorStateOfType<NavBarPageState>();

        navBarWidgetState!.changeWidget(const HomePage());
        return "1";
      } else {
        print('Ошибка HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Ошибка: $error');
    }
    return null;
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
                                      padding: EdgeInsets.only(top: 24),
                                      child: Text(
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 24,
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
                                    ListView.builder(
                                      itemCount: 1,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(
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
                                                      "$baseUrl/photoItem/product/lock1.png",
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                    color: Color(0xFF4295E4),
                                                  )),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
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
                                                            "fsefse",
                                                            style:
                                                                const TextStyle(
                                                              fontFamily: 'SF',
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
                                                                    () async {},
                                                                icon: SvgPicture
                                                                    .asset(
                                                                        "assets/icons/minus.svg"),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: const Color(
                                                                        0xffEAEAEA),
                                                                    width: 1,
                                                                  ),
                                                                ),
                                                                width: 60,
                                                                height: 32,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    Text("1"),
                                                              ),
                                                              IconButton(
                                                                onPressed:
                                                                    () async {},
                                                                icon: SvgPicture
                                                                    .asset(
                                                                        "assets/icons/plus.svg"),
                                                              ),
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
                                                            onTap: () async {},
                                                            child: const Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.close,
                                                                  color: Color(
                                                                      0xff161C24),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Text(
                                                            "33000₽",
                                                            style:
                                                                const TextStyle(
                                                              fontFamily: 'SF',
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
                                      padding: EdgeInsets.only(
                                        right: 24,
                                      ),
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "К оплате:",
                                            style: const TextStyle(
                                                fontFamily: 'SF',
                                                color: Color(0xFF161C24),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                height: 1),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "60000",
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
                                          vertical: 16, horizontal: 24),
                                      child: FFButtonWidget(
                                        onPressed: () async {},
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
          : SizedBox(),
    );
  }
}
