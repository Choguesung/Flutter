import 'package:flutter/material.dart';

class PlayerInfoCard extends StatelessWidget {
  final String player_img;
  final String player_id;
  final String player_name;
  final String team_color;

  const PlayerInfoCard({
    required this.player_id,
    required this.player_img,
    required this.player_name,
    required this.team_color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: Color(),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('$player_name'),
              Text('$player_name'),
              Text('$player_name'),
            ],
          ),
        ),
      );
  }
}
