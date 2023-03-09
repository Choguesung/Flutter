import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../db/dpHelper.dart';
import '../model/dog.dart';

class HomeScreen extends StatefulWidget {
  static int? temp;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // 데이터베이스를 열고 참조 값을 얻습니다.

    DBHelper dbHelper = DBHelper();
    dbHelper.insertDog(Dog(id: 1, name: 'Mini', age: 8));
    dbHelper.insertDog(Dog(id: 2, name: 'Mini', age: 8));
    dbHelper.insertDog(Dog(id: 3, name: 'Mini', age: 8));

    dbHelper.deleteDog(3);

    dbHelper.getAllDog().then((value) => value.forEach((element) {
          print(
            "id: ${element.id}\nname: ${element.name}\nage: ${element.age}",
          );
          HomeScreen.temp = element.id;
        }));


    return Scaffold(
      body: Center(
        child: Text(
          '${HomeScreen.temp}',
        ),
      ),
    );
  }
}
