import 'package:board_score/bloc/game_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/game.dart';
import '../widgets/games_list.dart';
import '../widgets/search_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double appBarFontSize = screenWidth / 18;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Board Score',
              style: TextStyle(
                fontSize: appBarFontSize,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<GameListBloc, GameListState>(
        builder: (context, state) {
          if (state is GameListInitial) {
            context.read<GameListBloc>().add(LoadGameEvent());
            return buildGameListModel([], true);
          } else if (state is GameListLoadingState) {
            return buildGameListModel(state.gameList, true);
          } else if (state is GameListLoadedState) {
            return buildGameListModel(state.gameList, false);
          } else if (state is GameListErrorState) {
            return const Center(
              child: Text('Something is wrong'),
            );
          }
          return const Text("Error");
        },
      ),
    );
  }
}

Widget buildGameListModel(List<Game> apiResult, bool isLoading) {
  return Stack(
    children: [
      GameList(gameList: apiResult, isLoading: isLoading),
      Align(alignment: Alignment.topCenter, child: SearchTextField()),
    ],
  );
}
