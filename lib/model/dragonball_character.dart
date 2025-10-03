class DragonBallCharacter {
  int id;
  String name;
  String image;
  String description;

  DragonBallCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory DragonBallCharacter.fromJsonMap(Map<String, dynamic> json) {
    return DragonBallCharacter(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      description: json["description"] ?? "",
    );
  }
}
