import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutureBuilder Example',
      home: Scaffold(
        appBar: AppBar(title: Text('FutureBuilder Example')),
        body: Center(
          child: FutureBuilder<List>(
            future: fetchUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length.toInt(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(snapshot.data![index]['title']),
                      subtitle: Text(snapshot.data![index]['content']),
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
      ),
    );
  }
}

Future<List> fetchUsers() async {
  var dio = Dio();
  final response =
  await dio.get('http://13.209.14.107/api/post');

  return response.data;
}



