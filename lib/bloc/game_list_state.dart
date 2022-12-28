part of 'game_list_bloc.dart';

abstract class GameListState extends Equatable {
  const GameListState({this.gameList = const <Game>[]});

  final List<Game> gameList;

  @override
  List<Object> get props => [gameList];
}

class GameListInitial extends GameListState {}

class GameListLoadingState extends GameListState {
  final List<Game> gameList;
  const GameListLoadingState({required this.gameList});
}

class GameListLoadedState extends GameListState {
  final List<Game> gameList;
  const GameListLoadedState({required this.gameList});
}

class GameListErrorState extends GameListState {}
