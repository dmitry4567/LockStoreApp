import 'package:LockStore/layout/adaptive.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);

    return Scaffold(
      body: isDesktop
          ? Container(
              width: 200,
              height: 200,
              color: Colors.red,
            )
          : Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
    );
  }
}
