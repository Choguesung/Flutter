import 'package:drift/drift.dart';

class Students extends Table{
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();
}

class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());
  
}