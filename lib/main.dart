import 'package:building_layout_training/pages/layout_page.dart';
import 'package:building_layout_training/pages/login_page.dart';
import 'package:building_layout_training/pages/shopping_page.dart';
import 'package:building_layout_training/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final form = ref.watch(formProvider);

    var isAccount =
        form.formValues.email.isNotEmpty && form.formValues.password.isNotEmpty;

    print(isAccount);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // canvasColor: const Color.fromRGBO(255, 255, 255, 0.9),
      ),
      initialRoute:
          isAccount ? ShoppingPage.routeName : LoginPageState.routeName,
      routes: {
        '/': (context) => LayoutPage(),
        LoginPageState.routeName: (context) => const LoginPage(),
        ShoppingPage.routeName: (context) => const ShoppingPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(
          'vinh'), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
