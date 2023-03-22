import 'package:cbnu_ari/card/post_card.dart';
import 'package:flutter/material.dart';

import '../response/response.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _PostList(),
        ],
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);

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
                return PostCard(
                  // snapshot.data![index]['id']
                  // post_id : snapshot.data![index]['index'],
                  title: snapshot.data![index]['title'],
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

