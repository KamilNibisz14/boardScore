import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game_score_bloc.dart';
import '../models/game.dart';
import '../screens/game_screen.dart';

class GameTile extends StatelessWidget {
  GameTile({Key? key, required this.gameData}) : super(key: key);

  Game gameData;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth / 25;
    return BlocBuilder<GameScoreBloc, GameScoreState>(
        builder: (context, state) {
    return Column(
      children: [
        Expanded(
            child: InkWell(
              onTap: (){
                context.read<GameScoreBloc>().add(SearchGameIndex(gameID: gameData.id));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GameScreen(gameData: gameData,),
                  ),
                );
              },
              child: Container(
                child: Image.network(
                  gameData.imageUrl,
                  errorBuilder: (_, __, ___) => Image(image: AssetImage('img/error_img.png')) //Image.network('https://zwierzetarnia.pl/assets/camaleon_cms/image-not-found-4a963b95bf081c3ea02923dceaeb3f8085e1a654fc54840aac61a57a60903fef.png'),
                ),
              ))),
        Expanded(
            child: Text(
          gameData.name,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        )),
      ],
    );});
  }
}
