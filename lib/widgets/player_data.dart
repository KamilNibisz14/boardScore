import 'package:board_score/bloc/game_score_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/player_data.dart';

class CurrentPlayerData extends StatelessWidget {
  CurrentPlayerData({Key? key, required this.playerData, this.isBorder})
      : super(key: key);

  bool? isBorder;
  PlayerData playerData;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double playerNameFontSize = screenWidth / 24;
    double playerDataContainerWidth = screenWidth * 0.9;
    Color buttonColor = Theme.of(context).bottomAppBarColor;
    return BlocBuilder<GameScoreBloc, GameScoreState>(
        builder: (context, state) {
      return Container(
        width: playerDataContainerWidth,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: isBorder == false
                    ? const BorderSide(color: Colors.transparent, width: 0)
                    : const BorderSide(color: Color(0xFFfcfcfc), width: 1))),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  playerData.name,
                  style: TextStyle(fontSize: playerNameFontSize),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    playerData.points.toString(),
                    style: TextStyle(fontSize: playerNameFontSize),
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<GameScoreBloc>()
                          .add(AddPoints(playerData: playerData));
                    },
                    onLongPress: () {
                      context
                          .read<GameScoreBloc>()
                          .add(RemovePoint(playerData: playerData));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: buttonColor,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
