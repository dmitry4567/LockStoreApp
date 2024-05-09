import 'package:LockStore/product/widgets/desktop/row_cart_widget.dart';
import 'package:flutter/material.dart';

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key, required this.material});

  final String? material;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RowCartWidget(
                    title: "Память на количество карт",
                    text: "2023",
                    color: true,
                  ),
                  RowCartWidget(
                    title: "Материал",
                    text: material ?? "Нет",
                    color: false,
                  ),
                  const RowCartWidget(
                    title: "Цвет",
                    text: "Черный, хром",
                    color: true,
                  ),
                  const RowCartWidget(
                    title: "Питание",
                    text: "DC 6V, 4 AAA",
                    color: false,
                  ),
                  const RowCartWidget(
                    title: "Разблокировка",
                    text:
                        "Пин-код, карта или браслет Mifaire, ключ, приложение, отпечаток пальца",
                    color: false,
                  ),
                ]),
          ),
          const SizedBox(
            width: 30,
          ),
          const Expanded(
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
