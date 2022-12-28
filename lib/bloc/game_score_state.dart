part of 'game_score_bloc.dart';

class GameScoreState extends Equatable {
  List<GameScore> gameData;
  int currentIndex;
  GameScoreState({this.gameData = const [], this.currentIndex = 0});

  GameScoreState copyWith({
    List<GameScore>? gameData,
    int? currentIndex,
  }) {
    return GameScoreState(
      gameData: gameData ?? this.gameData,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [gameData, currentIndex];
}
