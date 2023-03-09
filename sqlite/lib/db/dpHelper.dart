import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/dog.dart';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'Dog.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE Dog(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
    );
  }
  Future<void> insertDog(Dog dog) async {
    final db = await database;

    await db.insert("Dog", dog.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Dog>> getAllDog() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Dog');

    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<dynamic> getDog(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      'Dog',
      where: 'id = ?',
      whereArgs: [id],
    ));

    return maps.isNotEmpty ? maps : null;
  }

  Future<void> updateDog(Dog dog) async {
    final db = await database;

    await db.update(
      "Dog",
      dog.toMap(),
      where: "id = ?",
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    final db = await database;

    await db.delete(
      "Dog",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}