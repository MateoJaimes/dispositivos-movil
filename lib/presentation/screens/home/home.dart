import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcial/config/router/router.dart';
import 'package:parcial/presentation/providers/count_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final change = ref.watch(changeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(changeProvider.notifier).update((res) => !res);
            },
            icon: change ? Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Parcial 1 - Programacion Dispositivos Moviles'),
            Text('Mateo Alejandro Jaimes Uribe - 192094'),
            Text('Juan Sebastian Meza Garcia - 192122'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ...Routers.pages.map((res) {
              return ListTile(
                title: Text(res.title),
                subtitle: Text(res.description),
                onTap: () {
                  Navigator.pushNamed(context, res.path);
                },
                leading: Icon(res.icon),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
