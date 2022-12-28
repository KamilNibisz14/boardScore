import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/game.dart';
import '../services/games-service.dart';

part 'game_list_event.dart';
part 'game_list_state.dart';

class GameListBloc extends Bloc<GameListEvent, GameListState> {
  GamesService gameRepo;
  late List<Game> gameList = [];
  String searchPhrase = '';
  int skip = 0;

  GameListBloc(this.gameRepo) : super(GameListInitial()) {
    on<LoadGameEvent>(_LoadGameEvent);
    on<SearchEvent>(_SearchEvent);
  }

  void _LoadGameEvent(GameListEvent event, Emitter<GameListState> emit) async {
    emit(GameListLoadingState(gameList: gameList));
    try {
      List<Game> apiResult =
          await gameRepo.fetchGames(search: searchPhrase, skip: skip);
      gameList.addAll(apiResult);
      emit(
        GameListLoadedState(gameList: gameList),
      );
      skip += 10;
    } catch (e) {
      emit(GameListErrorState());
    }
  }

  void _SearchEvent(SearchEvent event, Emitter<GameListState> emit) {
    if (event.search != searchPhrase) {
      gameList = [];
      skip = 0;
    }
    searchPhrase = event.search;
    add(LoadGameEvent());
  }
}
