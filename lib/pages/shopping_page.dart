import 'package:building_layout_training/screen/all-product-screen.dart';
import 'package:building_layout_training/screen/favourite-product-screen.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  static const routeName = '/shopping';

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int _selectedIndex = 0;

  final _pagesInfo = [
    {
      'page': const AllProductScreen(),
      'title': 'All Product',
      'icon': Icons.production_quantity_limits,
    },
    {
      'page': const FavouriteProductScreen(),
      'title': 'Favourite Product',
      'icon': Icons.favorite,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(_pagesInfo[_selectedIndex]['title'] as String)),
      body: _pagesInfo[_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        items: _pagesInfo
            .map((e) => BottomNavigationBarItem(
                  icon: Icon(e['icon'] as IconData),
                  label: e['title'] as String,
                ))
            .toList(),
        currentIndex: _selectedIndex,
        onTap: (value) => {
          setState(
            () => {_selectedIndex = value},
          )
        },
      ),
    );
  }
}
