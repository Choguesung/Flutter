import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';

const DEFAULT_COLORS = [
  // red
  'F44336',
  // orange
  'FF9800',
  // yellow
  'FFEB3B',
  // green
  'FCAF50',
  // navy
  '3F51B5',
  // purple
  '9C27B0',
];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  final colors = await database.getCategoryColors();

  if(colors.isEmpty){
    for(String hexCode in DEFAULT_COLORS){
      await database.createCategoryColor(
        CategoryColorsCompanion(
          //id는 자동 증가
          hexCode: Value(hexCode),
        ),
      );
    }
  }

  print(
    await database.getCategoryColors(),
  );

  runApp(
    MaterialApp(
      theme: ThemeData(
      fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}
