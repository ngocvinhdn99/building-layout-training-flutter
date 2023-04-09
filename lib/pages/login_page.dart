import 'package:building_layout_training/provider/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends StatefulWidget {
  bool isHidePassword = true;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void toggleShowPassword() {
    setState(() {
      widget.isHidePassword = !widget.isHidePassword;
    });
  }

  void onSubmit(value) {
    // final emailText = emailController.text;
    // final inputText = passwordController.text;

    // print(emailText);
    // print(inputText);
    print(value);
  }

  @override
  Widget build(BuildContext context) {
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

    // Widget sectionForm = ;

    Widget sectionForm = Consumer(builder: (_, WidgetRef ref, __) {
      // final value = ref.watch(formProvider);
      return Column(
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
            // controller: emailController,
            onChanged: (value) =>
                {ref.read(formProvider.notifier).changeUserName(value)},
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10)),
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
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              TextField(
                // controller: passwordController,
                onChanged: (value) =>
                    {ref.read(formProvider.notifier).changePassword(value)},
                obscureText: widget.isHidePassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10)),
              ),
              IconButton(
                  onPressed: toggleShowPassword,
                  icon: Icon(widget.isHidePassword
                      ? Icons.visibility_off
                      : Icons.visibility))
            ],
          ),
        ],
      );
    });

    Widget sectionSubmit = Consumer(builder: (_, WidgetRef ref, __) {
      final value = ref.watch(formProvider);
      return Column(
        children: [
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => onSubmit(value),
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
    });

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
