import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/game.dart';
import 'game_tile.dart';
import 'package:board_score/bloc/game_list_bloc.dart';

class GameList extends StatefulWidget {
  List<Game> gameList;
  bool isLoading;
  GameList({required this.gameList, required this.isLoading, Key? key})
      : super(key: key);

  @override
  GameListStated createState() => GameListStated();
}

class GameListStated extends State<GameList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<GameListBloc>().add(LoadGameEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 90, left: 40, right: 40),
      child: Column(
        children: [
          if (widget.isLoading)
            const Center(child: CircularProgressIndicator()),
          Expanded(
              child: GridView.builder(
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 2,
                crossAxisCount: 2,
                crossAxisSpacing: 20),
            itemCount: widget.gameList.length,
            itemBuilder: (buildContext, index) {
              return GameTile(
                gameData: widget.gameList[index],
              );
            },
          )),
        ],
      ),
    );
  }
}
