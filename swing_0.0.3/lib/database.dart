import 'package:mysql1/mysql1.dart';

void sql() async {
  // MySQL 데이터베이스 연결 설정
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'your_username',
    password: 'your_password',
    db: 'your_database',
  );

  // MySQL 데이터베이스 연결
  final conn = await MySqlConnection.connect(settings);

  // 쿼리 실행
  Results results = await conn.query('SELECT * FROM your_table');

  // 결과 출력
  for (var row in results) {
    print('Column 1: ${row[0]}, Column 2: ${row[1]}');
  }

  // 연결 종료
  await conn.close();
}
