import 'package:LockStore/backend/api_requests/api_calls.dart';
import 'package:LockStore/flutter_flow/flutter_flow_util.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/navigation_bar_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product, required this.margin});

  final Product product;
  final bool margin;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final navBarWidgetState =
            context.findAncestorStateOfType<NavBarPageState>();

        navBarWidgetState!.changePage(2, widget.product);
      },
      child: Container(
        margin: EdgeInsets.only(right: widget.margin ? 30 : 0),
        width: 288 - 40,
        height: 426,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffEAEAEA),
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl:
                        "$baseUrl/photoItem/product/${widget.product.photos[0].fileName}",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 12),
                  child: Text(
                    widget.product.title,
                    style: const TextStyle(
                      color: Color(0xff454F5B),
                      fontSize: 14,
                      fontFamily: "SF",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 12),
                  child: Row(
                    children: [
                      Text(
                        "${widget.product.price}₽",
                        style: const TextStyle(
                          color: Color(0xff161C24),
                          fontSize: 18,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "${widget.product.oldPrice}₽",
                        style: const TextStyle(
                          color: Color(0xff454F5B),
                          fontSize: 16,
                          fontFamily: "SF",
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Color(0xffA4A4A4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Positioned(
              top: 17,
              right: 12,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: const Text(
                  "SALE",
                  style: TextStyle(
                    color: Color(0xff161C24),
                    fontSize: 10,
                    fontFamily: "SF",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 17,
            //   left: 12,
            //   child: Column(
            //     crossAxisAlignment:
            //         CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         color: Colors.black
            //             .withOpacity(0.02),
            //         padding:
            //             const EdgeInsets.symmetric(
            //           horizontal: 4,
            //           vertical: 2,
            //         ),
            //         child: const Row(
            //           children: [
            //             Icon(
            //               Icons.one_k,
            //               size: 12,
            //               color: Color(0xff4295E4),
            //             ),
            //             SizedBox(
            //               width: 2,
            //             ),
            //             Text("В наличии"),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 8,
            //       ),
            //       Container(
            //         color: Colors.black
            //             .withOpacity(0.02),
            //         padding:
            //             const EdgeInsets.symmetric(
            //                 horizontal: 4,
            //                 vertical: 2),
            //         child: const Row(
            //           children: [
            //             Icon(
            //               Icons.search_off_sharp,
            //               size: 12,
            //               color: Color(0xff4295E4),
            //             ),
            //             SizedBox(
            //               width: 2,
            //             ),
            //             Text("Подарок"),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
