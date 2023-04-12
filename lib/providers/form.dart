import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account {
  final String email;
  final String password;

  Account(this.email, this.password);
}

class FormNotifier extends ChangeNotifier {
  Account formValues = Account('', '');
  bool isHidePassword = true;
  bool isHaveToken = false;

  void toggleShowPassword() {
    isHidePassword = !isHidePassword;
    notifyListeners();
  }

  void updateAccount(email, password) {
    formValues = Account(email, password);
    notifyListeners();
  }

  void clearAccount() {
    formValues = Account('', '');
    notifyListeners();
  }

  void updateToken(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isHaveToken', value);
    isHaveToken = value;
    notifyListeners();
  }
}

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our FormNotifier class.
final formProvider = ChangeNotifierProvider<FormNotifier>((ref) {
  return FormNotifier();
});
