import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          // Logout button
          ElevatedButton(
            onPressed: () {
              AuthService.isLoggedIn = false; // log out
              context.go('/login'); // redirect to login
            },
            child: const Text("Logout"),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome to Home Screen",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),

              // About and Contact buttons
              ElevatedButton(
                onPressed: () => context.push('/about'),
                child: const Text("Go to About"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => context.push('/contact'),
                child: const Text("Go to Contact"),
              ),
              const SizedBox(height: 20),

              // Product buttons
              ...List.generate(5, (index) {
                final productId = index + 1;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: () => context.push('/product/$productId'),
                    child: Text("Product $productId"),
                  ),
                );
              }),
              const SizedBox(height: 20),

              // Search button example
              ElevatedButton(
                onPressed: () => context.push('/search?q=shoes'),
                child: const Text("Search for 'shoes'"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}