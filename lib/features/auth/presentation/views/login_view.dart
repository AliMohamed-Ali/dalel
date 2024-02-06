import 'package:dalel/core/function/navigation.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              customNavigation(context, '/signUp');
            },
            icon: const Icon(Icons.logout)),
      ]),
      body: const Center(
        child: Text("Login page "),
      ),
    );
  }
}
