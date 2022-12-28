part of 'game_list_bloc.dart';

abstract class GameListEvent extends Equatable {
  const GameListEvent();

  @override
  List<Object> get props => [];
}

class LoadGameEvent extends GameListEvent {}

class SearchEvent extends GameListEvent {
  final String search;

  const SearchEvent({
    required this.search,
  });

  @override
  List<Object> get props => [search];
}
