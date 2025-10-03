import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcial/config/router/router.dart';
import 'package:parcial/config/theme/app_theme.dart';
import 'package:parcial/presentation/providers/count_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkTheme = ref.watch(changeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: Routers.route(),
      theme: AppTheme(dart: darkTheme, selectColor: 0).getTheme(),
    );
  }
}
