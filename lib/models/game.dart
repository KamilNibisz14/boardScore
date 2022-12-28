class Game {
  final String id;
  final String name;
  final String imageUrl;
  final int ?min_players;
  final int ?max_players;
  final int ?min_playtime;
  final int ?max_playtime;
  final int ?min_age;
  final int ?year_published;
  final String ?description;
  const Game({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.min_players,
    required this.max_players,
    required this.min_playtime,
    required this.max_playtime,
    required this.min_age,
    required this.year_published,
    required this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      min_players: json['min_players'],
      max_players: json['max_players'],
      min_playtime: json['min_playtime'],
      max_playtime: json['max_playtime'],
      min_age: json['min_age'],
      year_published: json['year_published'],
      description: json['description'],
    );
  }
}