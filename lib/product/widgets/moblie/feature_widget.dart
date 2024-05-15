import 'package:LockStore/product/widgets/desktop/row_cart_widget.dart';
import 'package:flutter/material.dart';

class FeatureMobile extends StatelessWidget {
  const FeatureMobile({super.key, required this.material});

  final String? material;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const RowCartWidget(
          title: "Тип двери",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "Деревянная, металлическая",
          color: true,
        ),
        const RowCartWidget(
          title: "Толщина двери",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "38-55 мм",
          color: false,
        ),
        const RowCartWidget(
          title: "Размеры",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "302мм * 43мм * 22.55мм",
          color: true,
        ),
        const RowCartWidget(
          title: "Питание",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "DC 6V, 4 AAA",
          color: false,
        ),
        const RowCartWidget(
          title: "Комплектация",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "Без мартизы, с мартизой",
          color: false,
        ),
        const RowCartWidget(
          title: "Память на количество карт",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "2023",
          color: true,
        ),
        RowCartWidget(
          title: "Материал",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: material ?? "Нет",
          color: false,
        ),
        const RowCartWidget(
          title: "Цвет",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "Черный, хром",
          color: true,
        ),
        const RowCartWidget(
          title: "Питание",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text: "DC 6V, 4 AAA",
          color: true,
        ),
        const RowCartWidget(
          title: "Разблокировка",
          fontSizeTitle: 14,
          fontSizeText: 12,
          text:
              "Пин-код, карта или браслет Mifaire, ключ, приложение, отпечаток пальца",
          color: false,
        )
      ]),
    );
  }
}
