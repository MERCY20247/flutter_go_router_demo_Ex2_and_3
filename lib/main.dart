import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/product_screen.dart';
import 'screens/search_screen.dart';
import 'screens/login_screen.dart';
import 'auth_service.dart';

void main() {
  runApp(const MyApp());
}

// GoRouter with route guards (redirect)
final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return ProductScreen(id: id);
      },
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) {
        final query = state.uri.queryParameters['q'] ?? '';
        return SearchScreen(query: query);
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  // Route guard (redirect)
  redirect: (BuildContext context, GoRouterState state) {
  final loggedIn = AuthService.isLoggedIn;
  final loggingIn = state.fullPath == '/login';

  if (!loggedIn && !loggingIn) return '/login'; // Not logged in → login
  if (loggedIn && loggingIn) return '/';       // Already logged in → home
  return null; // No redirect
},
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text("Page Not Found")),
    body: const Center(child: Text("404 - Page not found")),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'go_router App',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}