import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is the Contact Screen"),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}