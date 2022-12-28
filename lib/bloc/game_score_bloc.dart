import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/game_score.dart';
import '../models/player_data.dart';

part 'game_score_event.dart';
part 'game_score_state.dart';

class GameScoreBloc extends HydratedBloc<GameScoreEvent, GameScoreState> {
  GameScoreBloc() : super(GameScoreState()) {
    on<SearchGameIndex>(_onSearchGameIndex);
    on<AddPlayerData>(_onAddPlayerData);
    on<AddPoints>(_onAddPoints);
    on<RemovePoint>(_onRemovePoint);
    on<DeletePlayer>(_onDeletePlayer);
  }
  void _onSearchGameIndex(SearchGameIndex event, Emitter<GameScoreState> emit) {
    final String gameID = event.gameID;
    final scores = List.of(state.gameData);
    int gameIdx = scores.indexWhere((element) => element.id == gameID);
    if (gameIdx < 0) {
      scores.add(GameScore(id: gameID, players: []));
      gameIdx = scores.length - 1;
    }

    emit(state.copyWith(gameData: scores, currentIndex: gameIdx));
  }

  void _onAddPlayerData(AddPlayerData event, Emitter<GameScoreState> emit) {
    final scores = state.gameData.map((e) => GameScore.clone(e)).toList();
    scores[state.currentIndex].players.add(event.playerData);
    emit(state.copyWith(gameData: scores));
  }

  void _onAddPoints(AddPoints event, Emitter<GameScoreState> emit) {
    final scores = state.gameData.map((e) => GameScore.clone(e)).toList();
    final player = event.playerData;
    final index = scores[state.currentIndex].players.indexOf(player);
    scores[state.currentIndex].players[index].points++;
    emit(state.copyWith(gameData: scores));
    winning(emit);
  }

  void _onRemovePoint(RemovePoint event, Emitter<GameScoreState> emit) {
    final scores = state.gameData.map((e) => GameScore.clone(e)).toList();
    final index = scores[state.currentIndex].players.indexOf(event.playerData);
    final currentPlayer = scores[state.currentIndex].players[index];
    if (currentPlayer.points > 0) currentPlayer.points--;

    emit(state.copyWith(gameData: scores));
    winning(emit);
  }

  void _onDeletePlayer(DeletePlayer event, Emitter<GameScoreState> emit) async {
    final scores = state.gameData.map((e) => GameScore.clone(e)).toList();
    scores[state.currentIndex].players.remove(event.playerData);
    emit(state.copyWith(gameData: scores));
    winning(emit);
  }

  void winning(Emitter<GameScoreState> emit) {
    final scores = state.gameData.map((e) => GameScore.clone(e)).toList();
    final currentGame = scores[state.currentIndex];
    if (scores.isNotEmpty && currentGame.players.isNotEmpty) {
      currentGame.players.sort((a, b) => b.points - a.points);
      currentGame.winner = currentGame.players.first.name;
      return emit(state.copyWith(gameData: scores));
    }
    currentGame.winner = '';
    return emit(state.copyWith(gameData: scores));
  }

  @override
  GameScoreState? fromJson(Map<String, dynamic> json) {
    try {
      List<GameScore> retrivedScores = json["scores"]
          .map<GameScore>((el) => GameScore.fromJson(el))
          .toList();
      if (retrivedScores.isNotEmpty) {
        return GameScoreState(gameData: retrivedScores);
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(GameScoreState state) {
    List<Map<String, dynamic>> stringifiedData =
        state.gameData.map((e) => e.toJson()).toList();

    return {"scores": stringifiedData};
  }
}
