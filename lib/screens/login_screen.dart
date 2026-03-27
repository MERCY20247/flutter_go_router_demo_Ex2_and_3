import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService.isLoggedIn = true; // Log in the user
            context.go('/'); // Navigate to Home
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}