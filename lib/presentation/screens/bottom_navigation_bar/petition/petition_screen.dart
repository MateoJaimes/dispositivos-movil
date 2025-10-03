import 'package:flutter/material.dart';
import 'package:parcial/helper/dragonball_petition.dart';
import 'package:parcial/model/dragonball_character.dart';

class PetitionScreen extends StatelessWidget {
  const PetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = DragonBallPetition();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: petition.getCharacters(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListCharacter(character: snapshot.requireData);
          },
        ),
      ),
    );
  }
}

class ListCharacter extends StatelessWidget {
  final List<DragonBallCharacter> character;
  const ListCharacter({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: character.length,
      itemBuilder: (context, index) {
        final item = character[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: ExpansionTile(
            leading: Image.network(item.image, width: 50, height: 50),
            title: Text(item.name),
            subtitle: Text("ID: ${item.id}"),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
