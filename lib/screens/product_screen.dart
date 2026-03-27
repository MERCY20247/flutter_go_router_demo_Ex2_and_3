import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String id; 

  const ProductScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product $id")),
      body: Center(
        child: Text(
          "You are viewing product with ID: $id",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}