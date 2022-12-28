import 'package:board_score/bloc/game_score_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/player_data.dart';

class AddPlayer extends StatelessWidget {
  const AddPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Text(
            'Add Player',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
              label: Text('Name'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    PlayerData playerData =
                        PlayerData(name: titleController.text);
                    context
                        .read<GameScoreBloc>()
                        .add(AddPlayerData(playerData: playerData));
                    Navigator.pop(context);
                  },
                  child: Text('Add'))
            ],
          ),
        ],
      ),
    );
  }
}
