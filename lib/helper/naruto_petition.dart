import 'package:parcial/model/naruto_character.dart';
import 'package:dio/dio.dart';

class NarutoPetition {
  static const url = "https://dattebayo-api.onrender.com";
  final _dio = Dio();

  Future<List<NarutoCharacter>> getAllCharacters() async {
    final response = await _dio.get("$url/characters");
    final data = response.data["characters"] as List;
    return data.map((e) => NarutoCharacter.fromJsonMap(e)).toList();
  }
}
