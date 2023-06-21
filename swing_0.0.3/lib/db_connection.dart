import 'package:mysql1/mysql1.dart';

class DBConnection {
  static Future<MySqlConnection> getConnection() async {
    // MySQL 데이터베이스 연결 설정
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'qwer123',
      db: 'database',
    );

    // MySQL 데이터베이스 연결
    final conn = await MySqlConnection.connect(settings);

    return conn;
  }
}