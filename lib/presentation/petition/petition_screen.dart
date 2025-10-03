import 'package:flutter/material.dart';
import 'package:parcial/helper/naruto_petition.dart';
import 'package:parcial/model/naruto_character.dart';

class PetitionScreen extends StatelessWidget {
  const PetitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final petition = NarutoPetition();
    return Scaffold(
      appBar: AppBar(title: Text('Personajes de Naruto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: petition.getAllCharacters(), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListCharacter(character: snapshot.requireData);  
          
          },
        ), 
      )
    );
  }
}

class ListCharacter extends StatelessWidget {
  final List<NarutoCharacter> character;
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
             leading: item.images.isNotEmpty
                 ? CircleAvatar(backgroundImage: NetworkImage(item.images[0]))
                 : const CircleAvatar(child: Icon(
                  Icons.person_4_rounded,
                  color: Colors.black,
                  )),
             title: Text(item.name),
             subtitle: Text("ID: ${item.id}"),
             children: [
               if (item.jutsu.isNotEmpty)
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     "Jutsu: ${item.jutsu[0]}, ${item.jutsu[1]}",
                     style: const TextStyle(fontSize: 16),
                   ),
                 )
               else
                 const Padding(
                   padding: EdgeInsets.all(8.0),
                   child: Text("Jutsu: Ninguno"),
                 ),
             ],
           ),
         );
       },
     );
   }
}