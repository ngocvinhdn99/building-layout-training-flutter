import 'package:building_layout_training/pages/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/form.dart';
import 'login_page.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends ConsumerState<LandingPage> {
  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    loadCheckToken();
  }

  void loadCheckToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isHaveToken = prefs.getBool('isHaveToken') ?? false;

    if (isHaveToken) {
      ref.read(formProvider).updateToken(isHaveToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isHasToken = ref.watch(formProvider).isHaveToken;

    if (isHasToken) {
      print('shopping page');

      Future.microtask(
          () => Navigator.of(context).pushNamed(ShoppingPage.routeName));
    } else {
      print('login page');
      Future.microtask(
          () => Navigator.of(context).pushNamed(LoginPageState.routeName));
    }

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
