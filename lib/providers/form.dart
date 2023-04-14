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
}

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our FormNotifier class.
final formProvider = ChangeNotifierProvider<FormNotifier>((ref) {
  return FormNotifier();
});
