import 'package:flutter/material.dart';
import '../card/player_info_card.dart';
import 'package:mysql1/mysql1.dart';
import 'package:swing/db_connection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            mypage(),
            PlayerInfoCard(player_name: '1',player_img: '1',player_id: '1',team_color: 'Colors.blue',),
          ],
        ),
      ),
    );
  }
}

class mypage extends StatefulWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  State<mypage> createState() => _mypageState();
}

class _mypageState extends State<mypage> {

  Future<void> connectToMySQL() async {
    // MySQL 연결 가져오기
    MySqlConnection conn = await DBConnection.getConnection();

    // 쿼리 실행
    Results results = await conn.query('SELECT * FROM city');

    // 결과 출력
    for (var row in results) {
      print('Column 1: ${row[0]}, Column 2: ${row[1]}');
    }

    // 연결 종료
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




