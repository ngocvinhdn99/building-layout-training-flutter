import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final isFavourite;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      this.isFavourite = false});
}

class ProductNotifier extends ChangeNotifier {
  final List<Product> products = [
    Product(
        id: '001',
        title: 'Áo nam',
        price: 100000,
        imageUrl:
            'https://bizweb.dktcdn.net/thumb/1024x1024/100/399/392/products/2-1.jpg'),
    Product(
        id: '002',
        title: 'Quần nam',
        price: 200000,
        imageUrl:
            'https://agiare.vn/wp-content/uploads/2019/06/gia-quan-tay-nam-han-quoc.jpg',
        isFavourite: true),
    Product(
        id: '003',
        title: 'Giày nam',
        price: 300000,
        imageUrl:
            'https://media3.scdn.vn/img4/2020/04_16/mfOeVT3B8in5hrQ1tOdI_simg_de2fe0_500x500_maxb.jpg'),
    Product(
        id: '004',
        title: 'Đồng hồ nam',
        price: 400000,
        imageUrl:
            'https://fridayshopping.vn/wp-content/uploads/2022/03/10-cach-chon-dong-ho-nam-dep-don-gian-va-phu-hop-nhat.jpg',
        isFavourite: true),
  ];

  List<Product> get favouriteProducts {
    return products.where((e) => e.isFavourite).toList();
  }

  void toggleFavourite(productId) {
    final index = products.indexWhere((e) => e.id == productId);
    products[index] = Product(
        id: products[index].id,
        title: products[index].title,
        price: products[index].price,
        imageUrl: products[index].imageUrl,
        isFavourite: !products[index].isFavourite);

    notifyListeners();
  }
}

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our ProductNotifier class.
final productProvider = ChangeNotifierProvider<ProductNotifier>((ref) {
  return ProductNotifier();
});
