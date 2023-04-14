import 'package:building_layout_training/pages/shopping_page.dart';
import 'package:building_layout_training/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  static const routeName = '/login';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final form = ref.read(formProvider);

    void onSubmit() {
      final emailText = emailController.text;
      final passwordText = passwordController.text;

      if (emailText.isEmpty || passwordText.isEmpty) return;

      form.updateAccount(emailText, passwordText);
      form.updateToken(true);
      // Navigator.of(context).pushNamed(ShoppingPage.routeName);
    }

    Widget sectionHeader = Column(children: const [
      Text(
        'Login',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        width: double.infinity,
        child: Text(
          'We suggest using the email address you use at work',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 30,
      ),
    ]);

    Widget sectionForm = Column(
      children: [
        Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Address email',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            )),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), contentPadding: EdgeInsets.all(10)),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8),
            child: const Text(
              'Password',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            )),
        Consumer(
          builder: (context, ref, child) {
            final isHidePassword = ref.watch(formProvider).isHidePassword;

            return Stack(
              alignment: AlignmentDirectional.centerEnd,
              children: [
                TextField(
                  controller: passwordController,
                  obscureText: isHidePassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10)),
                ),
                IconButton(
                    onPressed: () => form.toggleShowPassword(),
                    icon: Icon(isHidePassword
                        ? Icons.visibility_off
                        : Icons.visibility))
              ],
            );
          },
        )
      ],
    );

    Widget sectionSubmit = Column(
      children: [
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSubmit,
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.purple),
                padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [sectionHeader, sectionForm, sectionSubmit],
        ),
      ),
    );
  }
}
