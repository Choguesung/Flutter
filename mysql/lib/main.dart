import 'package:flutter/material.dart';
import 'package:mysql/database/db_connection.dart';
import 'package:mysql1/mysql1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MySQL Connection',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> connectToMySQL() async {
    // MySQL 연결 가져오기
    MySqlConnection conn = await DBConnection.getConnection();

    // 쿼리 실행
    Results results = await conn.query('SELECT * FROM world.city');

    // 결과 출력
    for (var row in results) {
      print('Column 1: ${row[0]}, Column 2: ${row[1]}');
    }

    // 연결 종료
    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MySQL Connection Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: connectToMySQL,
          child: Text('Connect to MySQL'),
        ),
      ),
    );
  }
}


