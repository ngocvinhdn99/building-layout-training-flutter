import 'package:building_layout_training/pages/login_page.dart';
import 'package:building_layout_training/providers/auth.dart';
import 'package:building_layout_training/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDrawer extends ConsumerStatefulWidget {
  const HomeDrawer({super.key});

  @override
  HomeDrawerState createState() => HomeDrawerState();
}

class HomeDrawerState extends ConsumerState<HomeDrawer> {
  void handleLogout() {
    ref.read(formProvider).clearAccount();
    ref.read(authProvider).updateToken(false);
    Navigator.of(context).pushNamed(LoginPageState.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Menu',
              textAlign: TextAlign.center,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: handleLogout,
                child: Text('Log out'),
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
