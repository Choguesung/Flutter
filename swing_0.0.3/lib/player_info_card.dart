import 'package:flutter/material.dart';
import 'package:swing/colors.dart';

class PlayerInfoCard extends StatelessWidget {
  final String player_img;
  final String player_id;
  final String player_name;

  const PlayerInfoCard({
    required this.player_id,
    required this.player_img,
    required this.player_name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: PRIMARY_COLOR,
            width: 2,
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('hellop'),
            Text('hellop'),
          ],
        ),
      ),
    );
  }
}
