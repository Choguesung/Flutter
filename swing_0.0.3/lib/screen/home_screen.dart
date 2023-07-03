import 'package:flutter/material.dart';
import 'package:swing/bar/gameschedule_bar.dart';
import '../card/player_info_card.dart';
import 'package:mysql1/mysql1.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GameScheduleBar(children: [],),
              PlayerInfoCard(player_name: '1',player_img: '1',player_id: '1',team_color: 'Colors.blue',),
            ],
          ),
        ),
      ),
    );
  }
}




