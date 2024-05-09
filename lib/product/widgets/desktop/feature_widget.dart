import 'package:LockStore/product/widgets/desktop/row_cart_widget.dart';
import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowCartWidget(
                    title: "Память на количество карт",
                    text: "2023",
                    color: true,
                  ),
                  RowCartWidget(
                    title: "Материал",
                    text: "Нет",
                    color: false,
                  ),
                  RowCartWidget(
                    title: "Цвет",
                    text: "Черный, хром",
                    color: true,
                  ),
                  RowCartWidget(
                    title: "Питание",
                    text: "DC 6V, 4 AAA",
                    color: false,
                  ),
                  RowCartWidget(
                    title: "Разблокировка",
                    text:
                        "Пин-код, карта или браслет Mifaire, ключ, приложение, отпечаток пальца",
                    color: false,
                  ),
                ]),
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowCartWidget(
                    title: "Тип двери",
                    text: "Деревянная, металлическая",
                    color: true,
                  ),
                  RowCartWidget(
                    title: "Толщина двери",
                    text: "38-55 мм",
                    color: false,
                  ),
                  RowCartWidget(
                    title: "Размеры",
                    text: "302мм * 43мм * 22.55мм",
                    color: true,
                  ),
                  RowCartWidget(
                    title: "Комплектация",
                    text: "Без мартизы, с мартизой",
                    color: false,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
