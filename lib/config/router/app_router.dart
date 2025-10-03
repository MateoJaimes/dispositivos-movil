import 'package:flutter/widgets.dart';

class AppRouter {
  final String patch;
  final String title;
  final String description;
  final IconData icon;
  final WidgetBuilder context;

  const AppRouter({
    required this.patch,
    required this.title,
    required this.description,
    required this.icon,
    required this.context,
  });
}
