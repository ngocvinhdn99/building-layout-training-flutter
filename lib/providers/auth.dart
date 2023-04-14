import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthNotifier extends ChangeNotifier {
  bool isHaveToken = false;

  void updateToken(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isHaveToken', value);
    isHaveToken = value;

    notifyListeners();
  }
}

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our AuthNotifier class.
final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  return AuthNotifier();
});
