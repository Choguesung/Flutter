import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../card/group_card.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _GroupList(),
        ],
      ),
    );
  }
}

class _GroupList extends StatelessWidget {
  const _GroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FutureBuilder<List>(
        future: fetchDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length.toInt(),
              itemBuilder: (BuildContext context, int index) {
                return GroupCard(
                  // snapshot.data![index]['id']
                  group_id : snapshot.data![index]['index'],
                  img: 'assets/img/core.png',
                  name: snapshot.data![index]['title'],
                  content: snapshot.data![index]['content'],
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