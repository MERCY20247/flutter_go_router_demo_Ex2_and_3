import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: Center(
        child: Text(
          "Results for: $query",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}