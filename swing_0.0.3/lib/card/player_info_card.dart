import 'package:flutter/material.dart';
import 'package:swing/screen/home_screen.dart';

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
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(), 
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.orange,
              width: 2,
            ),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage('assets/img/sihwan.jpeg'), // 이미지 경로 설정
                          width: 80, // 이미지의 가로 크기 지정
                          height: 80, // 이미지의 세로 크기 지정
                        ),
                      ),
                      Text(
                        '노시환',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image(
                            image: AssetImage('assets/img/hanwha.png'), // 이미지 경로 설정
                            width: 40, // 이미지의 가로 크기 지정
                            height: 40, // 이미지의 세로 크기 지정
                          ),
                          Text(
                            '한화 이글스',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'NO.8',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '포지션',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          ' 3루수',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '출생',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          ' 1999.06.12',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '신체',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        Text(
                          ' 185cm, 96kg',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'OPS',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              ' 0.989',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        graph2(a: 40.0,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class graph2 extends StatelessWidget {
  final double a;

  const graph2({
    required this.a,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80, // 그래프의 전체 너비
      height: 10, // 그래프의 높이
      decoration: BoxDecoration(
        color: Colors.grey[300], // 그래프의 배경색
        borderRadius: BorderRadius.circular(10), // 그래프의 테두리 둥글기 설정
      ),
      child: Align(
        alignment: Alignment.centerLeft, // 그래프의 시작 위치 (왼쪽)
        child: Container(
          width: a, // 그래프의 채워진 너비
          decoration: BoxDecoration(
            color: Colors.blue, // 그래프의 채워진 색
            borderRadius: BorderRadius.circular(10), // 그래프의 테두리 둥글기 설정
          ),
        ),
      ),
    );
  }
}