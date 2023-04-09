import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/shopping.dart';

class ProductItemWidget extends ConsumerWidget {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final isFavourite;

  ProductItemWidget(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      required this.isFavourite});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerProduct = ref.read(productProvider);

    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(title), Text(price.toString())],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    providerProduct.toggleFavourite(id);
                  },
                  icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_outline)),
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            ],
          ),
        ],
      ),
    );
  }
}
