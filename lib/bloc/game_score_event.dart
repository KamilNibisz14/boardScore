part of 'game_score_bloc.dart';

abstract class GameScoreEvent extends Equatable {
  const GameScoreEvent();

  @override
  List<Object> get props => [];
}

class LoadGameEvent extends GameScoreEvent {}

class SearchGameIndex extends GameScoreEvent {
  final String gameID;
  const SearchGameIndex({required this.gameID});

  @override
  List<Object> get props => [gameID];
}

class AddPlayerData extends GameScoreEvent {
  final PlayerData playerData;
  const AddPlayerData({required this.playerData});

  @override
  List<Object> get props => [playerData];
}

class AddPoints extends GameScoreEvent {
  final PlayerData playerData;
  const AddPoints({required this.playerData});

  @override
  List<Object> get props => [playerData];
}

class RemovePoint extends GameScoreEvent {
  final PlayerData playerData;
  const RemovePoint({required this.playerData});
  @override
  List<Object> get props => [playerData];
}

class DeletePlayer extends GameScoreEvent {
  final PlayerData playerData;
  const DeletePlayer({required this.playerData});

  @override
  List<Object> get props => [playerData];
}
