import 'package:flutter/material.dart';
import 'package:parcial/presentation/screens/form/form_screen/form_screen.dart';
import 'package:parcial/presentation/screens/form/petition/petition_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _indicador = 0;

  final List<Widget> _elementos = <Widget>[FormScreen(), PetitionScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation Bar")),
      body: _elementos[_indicador],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indicador,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        onTap: (value) {
          setState(() {
            _indicador = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Form"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_sharp),
            label: "Petition",
          ),
        ],
      ),
    );
  }
}
