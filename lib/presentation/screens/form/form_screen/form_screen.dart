import "package:flutter/material.dart";
import "package:parcial/helper/dragonball_petition.dart";
import "package:parcial/model/dragonball_character.dart";

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

  String? _personajeSeleccionado;
  bool _favorito = false;

  final petition = DragonBallPetition();

  void send() {
    print("Género: $_genero");
    print("Hobbies -> Leer: $_leer, Viajar: $_viajar, Videojuegos: $_videojuegos");
    print("Personaje seleccionado: $_personajeSeleccionado");
    print("¿Es favorito?: $_favorito");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DragonBallCharacter>>(
      future: petition.getCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error al cargar personajes: ${snapshot.error}"));
        }

        final personajes = snapshot.requireData;

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

                // Eleccion de personaje
                const Text(
                  "Seleccione un Personaje:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: _personajeSeleccionado,
                  items: personajes.map((p) {
                    return DropdownMenuItem(
                      value: p.name,
                      child: Row(
                        children: [
                          Image.network(p.image, width: 40, height: 40),
                          const SizedBox(width: 10),
                          Text(p.name),
                        ],
                      ),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: "Seleccione un personaje",
                    icon: Icon(Icons.people),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _personajeSeleccionado = value;
                      _favorito = false;
                    });
                  },
                ),

                const SizedBox(height: 10),

                if (_personajeSeleccionado != null)
                  SwitchListTile(
                    value: _favorito,
                    onChanged: (val) => setState(() {
                      _favorito = val;
                    }),
                    title: Text("¿$_personajeSeleccionado es tu favorito?"),
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
      },
    );
  }
}
