class NarutoCharacter {
  final int id;
  final String name;
  final List<String> images;
  final List<String> jutsu;

  NarutoCharacter({
    required this.id,
    required this.name,
    required this.images,
    required this.jutsu,
  });

  factory NarutoCharacter.fromJsonMap(Map<String, dynamic> json) {
    return NarutoCharacter(
      id: (json['id'] ?? 0) as int,
      name: (json['name'] ?? 'Not Name') as String,
      images: (json['images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      jutsu: (json['jutsu'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
    );
  }
}