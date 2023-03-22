import 'package:dio/dio.dart';

Future<List> fetchDatas() async {
  var dio = Dio();
  final response =
  await dio.get('http://13.209.14.107/api/post');

  return response.data;
}