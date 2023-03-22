import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Icon/group_icon.dart';

class GroupTapView extends StatelessWidget {
  // 직무 동아리, 중앙 동아리 구분 하는 변수
  final bool isJob;

  const GroupTapView({
    required this.isJob,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(isJob == true){
      return _JobClub();
    }
    return _CentralClub();
  }
}

// 직무동아리 그려주는 뷰
class _JobClub extends StatelessWidget {
  const _JobClub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Expanded(
            child: FutureBuilder<List>(
              future: fetchDatas(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length.toInt(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GroupIcon(
                        // id: snapshot.data![index]['index'], 제발 인티저로 바꿔줘
                        id : snapshot.data![index]['index'],
                        // img: snapshot.data![index]['image_url'],
                        img: 'assets/img/core.png',
                        name: snapshot.data![index]['title'],
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
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

// 중앙동아리 그려주는 뷰
class _CentralClub extends StatelessWidget {
  const _CentralClub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

