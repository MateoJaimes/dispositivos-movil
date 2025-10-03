import 'package:dio/dio.dart';
import 'package:parcial/model/dragonball_character.dart';

class DragonBallPetition {
  static const url = "https://dragonball-api.com/api";

  final _dio = Dio();

  Future<List<DragonBallCharacter>> getCharacters() async {
    final response = await _dio.get("$url/characters");
    final data = response.data["items"];
    List<DragonBallCharacter> pj = [];

    for (int i = 0; i < data.length; i++) {
      pj.add(DragonBallCharacter.fromJsonMap(data[i]));
    }

    return pj;
  }
}