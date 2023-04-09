import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class CountNotifer extends ChangeNotifier {
  int count = 0;

  void plusCount() {
    count = count + 1;
    notifyListeners();
  }

  void decreaseCount() {
    count = count - 1;
    notifyListeners();
  }
}

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our CountNotifer class.
final countProvider = ChangeNotifierProvider<CountNotifer>((ref) {
  return CountNotifer();
});
