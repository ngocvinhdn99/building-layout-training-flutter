import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormNotifier extends ChangeNotifier {
  Map<String, String> formValues = {
    'email': '',
    'password': '',
  };
  bool isHidePassword = true;

  void updateFormValues(key, newValue) {
    formValues.update(key, (value) => newValue);
    // notifyListeners();
  }

  void toggleShowPassword() {
    isHidePassword = !isHidePassword;
    notifyListeners();
  }
}

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our FormNotifier class.
final formProvider = ChangeNotifierProvider<FormNotifier>((ref) {
  return FormNotifier();
});
