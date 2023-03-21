import 'package:cbnu_ari/screen/test_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Icon/shortcut_icon.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _SearchBar(),
            _Schedules(),
            _ShortCut(),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: TextField(),
            ),
            SizedBox(
              width: 2.0,
            ),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}

class _Schedules extends StatelessWidget {
  const _Schedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('나의 일정1'),
      ],
    );
  }
}

class _ShortCut extends StatelessWidget {
  const _ShortCut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder<List>(
        future: fetchDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length.toInt(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ShortCutIcon(
                  img: 'assets/img/core2.png',
                  text: snapshot.data![index]['title'],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<List> fetchDatas() async {
  var dio = Dio();
  final response =
  await dio.get('http://13.209.14.107/api/post');

  return response.data;
}

