import 'package:board_score/models/player_data.dart';

class GameScore {
  final String id;
  String winner;
  List<PlayerData> players;
  GameScore({required this.id, this.winner = '', required this.players});

  factory GameScore.clone(GameScore source) {
    return GameScore(
        id: source.id, players: source.players, winner: source.winner);
  }

  factory GameScore.fromJson(Map<String, dynamic> json) {
    List<PlayerData> parsedPlayers =
        json["players"].map<PlayerData>((e) => PlayerData.fromJson(e)).toList();

    return GameScore(
        id: json["id"], winner: json['winner'], players: parsedPlayers);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> stringifiedPlayers =
        players.map((e) => e.toJson()).toList();

    return {"id": id, "winner": winner, "players": stringifiedPlayers};
  }
}
