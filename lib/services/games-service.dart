import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:board_score/models/game.dart';
import 'package:http/http.dart' as http;

class GamesService {
  static const _apiUrl = "https://api.boardgameatlas.com/api/";
  Future<List<Game>> fetchGames({int skip = 0, String search = ''}) async {
    final response = await http.get(Uri.parse(
        '${_apiUrl}sea rch?name=$search&skip=$skip&limit=10&client_id=${dotenv.env['BOARD_GAME_ATLAS_SECRET_API_KEY']}'));
    if (response.statusCode == 200) {
      Iterable decodedGames = json.decode(response.body)['games'];
      return List<Game>.from(decodedGames.map((g) => Game.fromJson(g)));
    } else {
      throw Exception('Failed to load games');
    }
  }
}