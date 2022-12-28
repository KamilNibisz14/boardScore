import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import '../models/game.dart';
import '../widgets/icon_description_widget.dart';

class GameDescription extends StatelessWidget {
  GameDescription({Key? key, required this.gameData}) : super(key: key);

  Game gameData;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double appBarFontSize = screenWidth / 18;
    double titleFontSize = screenWidth / 15;
    double descriptionFontSize = screenWidth / 22;

    String _parseHtmlString(String htmlString) {
      final document = parse(htmlString);
      final String parsedString = parse(document.body?.text).documentElement!.text;

      return parsedString;
    }
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
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    gameData.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: titleFontSize,
                        letterSpacing: 1.2
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: IconDescriptionWidget(
                            icon: Icons.person,
                            value1: gameData.min_players == null ? 0 : gameData.min_players!,
                            value2: gameData.max_players == null ? 0 : gameData.max_players!,
                          )
                        ),
                        Expanded(
                          child: IconDescriptionWidget(
                            icon: Icons.access_time_rounded,
                            value1: gameData.min_playtime == null ? 0 : gameData.min_playtime!,
                            value2: gameData.max_playtime == null ? 0 : gameData.max_playtime!,
                          )
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                              child: IconDescriptionWidget(
                                icon: Icons.calendar_today,
                                value1: gameData.year_published == null ? 0 : gameData.year_published!,
                              )
                          ),
                          Expanded(
                              child: IconDescriptionWidget(
                                icon: Icons.child_care,
                                value1: gameData.min_age == null? 0:gameData.min_age! ,
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
                      child: Text(
                        _parseHtmlString(gameData.description == null ? " ":gameData.description! ),
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: descriptionFontSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
