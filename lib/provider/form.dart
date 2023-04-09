import 'package:hooks_riverpod/hooks_riverpod.dart';

class FormProvider extends StateNotifier<Map<String, String>> {
  // int count;

  // int count;
  FormProvider()
      : super({
          'userName': '',
          'password': '',
        });

  void changeUserName(newValue) => {state['userName'] = newValue};

  void changePassword(newValue) => {state['password'] = newValue};
}

final formProvider =
    StateNotifierProvider<FormProvider, Map<String, String>>((ref) {
  return FormProvider();
});
