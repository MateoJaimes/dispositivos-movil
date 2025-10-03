import 'package:parcial/config/router/app_router.dart';
import 'package:parcial/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class Routers {
  static final List<AppRouter> pages = [
    AppRouter(
      path: '/',
      title: 'Home',
      description: 'Home Screen',
      icon: Icons.home,
      context: (context) => const HomeScreen(),
    ),
    AppRouter(
      path: "/bottom_navigation_bar",
      title: "Bottom Navigation Bar",
      description: "Bottom Navigation Bar Screen",
      icon: Icons.list,
      context: (context) => const BottomNavigationBarScreen(),
    ),
  ];

  static route() => {for (var page in pages) page.path: page.context};
}
