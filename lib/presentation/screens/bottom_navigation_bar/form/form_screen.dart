import "package:flutter/material.dart";

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _genero = "Masculino";
  bool _leer = false;
  bool _viajar = false;
  bool _videojuegos = false;

  void send() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Nombre",
                icon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 14.0),

            TextField(
              decoration: const InputDecoration(
                labelText: "Correo Electrónico",
                icon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 14.0),

            const Text(
              "Seleccione género:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: const Text("Masculino"),
              value: "Masculino",
              groupValue: _genero,
              onChanged: (value) => setState(() => _genero = value ?? ""),
            ),
            RadioListTile(
              title: const Text("Femenino"),
              value: "Femenino",
              groupValue: _genero,
              onChanged: (value) => setState(() => _genero = value ?? ""),
            ),
            RadioListTile(
              title: const Text("Otro"),
              value: "Otro",
              groupValue: _genero,
              onChanged: (value) => setState(() => _genero = value ?? ""),
            ),

            const SizedBox(height: 14.0),

            const Text(
              "Seleccione hobbies:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text("Leer"),
              value: _leer,
              onChanged: (value) => setState(() => _leer = value ?? false),
            ),
            CheckboxListTile(
              title: const Text("Viajar"),
              value: _viajar,
              onChanged: (value) => setState(() => _viajar = value ?? false),
            ),
            CheckboxListTile(
              title: const Text("Videojuegos"),
              value: _videojuegos,
              onChanged: (value) =>
                  setState(() => _videojuegos = value ?? false),
            ),

            const SizedBox(height: 14.0),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: send,
                child: const Text("Enviar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
