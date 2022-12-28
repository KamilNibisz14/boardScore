class PlayerData {
  final String name;
  int points;
  PlayerData({required this.name, this.points = 0});

  factory PlayerData.fromJson(Map<String, dynamic> json) {
    return PlayerData(name: json['name'], points: json['points']);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "points": points};
  }
}
