import 'package:flutter/material.dart';

class DescriptionDesktop extends StatelessWidget {
  const DescriptionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Text(
          "Замок дверной электронный Golden Soft GS-200Z-5 имеет роскошный глянцевый блеск,\nчеткие линии, красивые формы – этот замок сразу заявляет о своем высоком статусе.\nИзысканный черный цвет корпуса в обрамлении из золота мгновенно притягивает\nвзгляды. Функционален, удобен в работе и легок в уходе: для сохранения блеска\nдостаточно лишь протереть поверхность салфеткой."),
    );
  }
}
