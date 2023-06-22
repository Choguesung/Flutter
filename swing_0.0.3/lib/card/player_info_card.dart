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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image(
                      image: AssetImage('assets/img/hanhwa.png'), // 이미지 경로 설정
                      width: 80, // 이미지의 가로 크기 지정
                      height: 80, // 이미지의 세로 크기 지정
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('채은성'),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
