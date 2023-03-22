import 'package:cbnu_ari/const/colors.dart';
import 'package:cbnu_ari/screen/test_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Icon/shortcut_icon.dart';
import '../view/group_tap_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _SearchBar(),
          _Schedules(),
          _ShortCut(),
          _GroupTapBar(),
        ],
      ),
    );
  }
}

//추가로 구현
class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flexible(
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

// 스케줄 탭 추가 구현
class _Schedules extends StatelessWidget {
  const _Schedules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('나의 일정'),
      ],
    );
  }
}

// 바로가기
class _ShortCut extends StatelessWidget {
  const _ShortCut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: FutureBuilder<List>(
        future: fetchDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length.toInt(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ShortCutIcon(
                  img: 'assets/img/core.png',
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

// 서버에 요청
Future<List> fetchDatas() async {
  var dio = Dio();
  final response =
  await dio.get('http://13.209.14.107/api/post');

  return response.data;
}

class _GroupTapBar extends StatelessWidget {
  const _GroupTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.category,
                  ),
                  text: '직무 동아리',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: '중앙 동아리',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              GroupTapView(isJob: true),
              GroupTapView(isJob: false),
            ],
          ),
        ),
      ),
    );
  }
}
