import 'package:building_layout_training/providers/shopping.dart';
import 'package:building_layout_training/widgets/product-item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavouriteProductScreen extends ConsumerWidget {
  static const routeName = '/shopping';

  const FavouriteProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerProduct = ref.watch(productProvider);

    return Container(
      height: double.infinity,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: providerProduct.favouriteProducts
            .map((e) => ProductItemWidget(
                id: e.id,
                title: e.title,
                price: e.price,
                imageUrl: e.imageUrl,
                isFavourite: e.isFavourite))
            .toList(),
      ),
    );
  }
}
