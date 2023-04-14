import 'package:building_layout_training/pages/layout_page.dart';
import 'package:building_layout_training/pages/login_page.dart';
import 'package:building_layout_training/pages/shopping_page.dart';
import 'package:building_layout_training/providers/auth.dart';
import 'package:building_layout_training/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

var initialRoute = LoginPageState.routeName;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isHaveToken = prefs.getBool('isHaveToken') ?? false;

  if (isHaveToken) {
    initialRoute = ShoppingPage.routeName;
  }

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final isHaveToken = ref.watch(authProvider).isHaveToken;
    print(isHaveToken);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // canvasColor: const Color.fromRGBO(255, 255, 255, 0.9),
      ),
      initialRoute: initialRoute,
      routes: {
        LoginPageState.routeName: (context) => const LoginPage(),
        ShoppingPage.routeName: (context) => const ShoppingPage(),
        LayoutPage.routeName: (context) => LayoutPage(),
      },
    );
  }
}
