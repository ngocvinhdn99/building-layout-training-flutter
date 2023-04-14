import 'package:building_layout_training/screen/all-product-screen.dart';
import 'package:building_layout_training/screen/favourite-product-screen.dart';
import 'package:building_layout_training/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';

class ShoppingPage extends StatefulWidget {
  static const routeName = '/shopping';
  const ShoppingPage({super.key});

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

  // @override
  // void initState() {
  //   super.initState();
  //   // "ref" can be used in all life-cycles of a StatefulWidget.
  //   loadCheckToken();
  // }

  // void loadCheckToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final bool isHaveToken = prefs.getBool('isHaveToken') ?? false;

  //   if (!isHaveToken) {
  //     Navigator.of(context).pushNamed(LoginPageState.routeName);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pagesInfo[_selectedIndex]['title'] as String),
        // automaticallyImplyLeading: false,
      ),
      body: _pagesInfo[_selectedIndex]['page'] as Widget,
      drawer: const HomeDrawer(),
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
