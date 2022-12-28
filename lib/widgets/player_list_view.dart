import 'package:board_score/widgets/player_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game_score_bloc.dart';

class PlayerListView extends StatelessWidget {
  const PlayerListView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double leadingPlayerNameFontSize = screenWidth / 22;
    return BlocBuilder<GameScoreBloc, GameScoreState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              'leading:  ${state.gameData[state.currentIndex].winner}',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: leadingPlayerNameFontSize),
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.gameData[state.currentIndex].players.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    context.read<GameScoreBloc>().add(DeletePlayer(
                        playerData:
                            state.gameData[state.currentIndex].players[index]));
                  },
                  child: CurrentPlayerData(
                    playerData:
                        state.gameData[state.currentIndex].players[index],
                  ),
                );
              }),
        ],
      );
    });
  }
}
