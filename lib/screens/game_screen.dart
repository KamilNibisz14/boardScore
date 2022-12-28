import 'package:board_score/bloc/game_score_bloc.dart';
import 'package:board_score/models/game.dart';
import 'package:board_score/widgets/add_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/player_data.dart';
import '../widgets/player_list_view.dart';
import 'game_description.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key, required this.gameData}) : super(key: key);

  Game gameData;

  void _addPlayer(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: AddPlayer(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    Color iconColor = Theme.of(context).bottomAppBarColor;
    double textContainerWidth = screenWidth * 0.7;
    double appBarFontSize = screenWidth / 18;
    double titleFontSize = screenWidth / 18;
    double iconSize = titleFontSize * 1.4;
    double leadingPlayerNameFontSize = screenWidth / 22;
    return BlocBuilder<GameScoreBloc, GameScoreState>(
      builder: (context, state) {
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
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: textContainerWidth,
                        child: Text(
                          gameData.name,
                          style: TextStyle(
                              fontSize: titleFontSize, letterSpacing: 1.2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GameDescription(
                                gameData: gameData,
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.info_outline,
                          size: iconSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: SingleChildScrollView(
                    child: PlayerListView()
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addPlayer(context),
            tooltip: 'Add Player',
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              size: 32,
              color: iconColor,
            ),
          ),
        );
      },
    );
    /*
    return BlocBuilder<GameScoreBloc, GameScoreState>(
      builder: (context, state) {
        context.read<GameScoreBloc>().add(SearchGameIndex(gameID: gameData.id));
        print(state.gameData!.id);
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
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: textContainerWidth,
                        child: Text(
                          gameData.name,
                          style: TextStyle(
                              fontSize: titleFontSize, letterSpacing: 1.2),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => GameDescription(
                                gameData: gameData,
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.info_outline,
                          size: iconSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            'leading:  Kamil',
                            textAlign: TextAlign.left,
                            style:
                                TextStyle(fontSize: leadingPlayerNameFontSize),
                          ),
                        ),
                        Column(
                          children: [
                            PlayerData(
                              name: "Kamil",
                              points: 4,
                            ),
                            PlayerData(
                              name: "Kamil",
                              points: 4,
                            ),
                            PlayerData(
                              name: "Kamil",
                              points: 4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addPlayer(context),
            tooltip: 'Add Player',
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              size: 32,
              color: iconColor,
            ),
          ),
        );
      },
    );
   */
  }
}

/*
 BlocBuilder<GameScoreBloc, GameScoreState>(
        builder: (context, state) {
          if(state is GameScoreInitial){
            context.read<GameScoreBloc>().add(SearchGameIndex(gameID: widget.gameData.id));
            return CircularProgressIndicator();
          }
          else{
            //print(context.read<GameScoreBloc>().currentIndex);
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: textContainerWidth,
                          child: Text(
                            widget.gameData.name,
                            style: TextStyle(
                                fontSize: titleFontSize, letterSpacing: 1.2),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GameDescription(
                                  gameData: widget.gameData,
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.info_outline,
                            size: iconSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Text(
                              'leading:  Kamil',
                              textAlign: TextAlign.left,
                              style:
                              TextStyle(fontSize: leadingPlayerNameFontSize),
                            ),
                          ),
                          Column(
                            children: [
                              PlayerData(
                                name: "Kamil",
                                points: 4,
                              ),
                              PlayerData(
                                name: "Kamil",
                                points: 4,
                              ),
                              PlayerData(
                                name: "Kamil",
                                points: 4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addPlayer(context),
        tooltip: 'Add Player',
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          size: 32,
          color: iconColor,
        ),
      ),
    );
 */