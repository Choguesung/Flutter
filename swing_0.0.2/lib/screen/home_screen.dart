import 'package:flutter/material.dart';

import '../card/player_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayerInfoCard(player_id: '1',player_img: 'assets/images/1.png',player_name: '이정후',),
          ],
        ),
      ),
    );
  }
}
