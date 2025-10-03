import 'package:parcial/config/router/app_router.dart';
import 'package:parcial/presentation/screens/screens.dart';
import 'package:flutter/material.dart';

class Routers {
  static final List<AppRouter> pages = [
    AppRouter(
      patch: '/', 
      title: 'Home', 
      description: 'Home Screen',
      icon: Icons.home,
      context: (context) => const HomeScreen(),
    ),
    AppRouter(
      patch: 'form', 
      title: 'Form', 
      description: 'Form Screen',
      icon: Icons.list,
      context: (context) => const FormScreen(),
    ),
    AppRouter(
      patch: 'petition', 
      title: 'Petition', 
      description: 'Petition Screen',
      icon: Icons.http,
      context: (context) => const PetitionScreen(),
    ),
  ];
  static Route() => {for (var page in pages) page.patch : page.context};
}