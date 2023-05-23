import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: fetchSeoulTemperature(),
      ),
    );
  }
}

Future<void> fetchSeoulTemperature() async {
  final response = await http.get(Uri.parse('https://search.naver.com/search.naver?query=서울+기온')); // 네이버에서 서울 기온 검색 페이지의 URL

  if (response.statusCode == 200) {
    final html = response.body;
    final document = parser.parse(html);

    // 기온 정보가 포함된 요소를 선택하여 추출
    final temperatureElement = document.querySelector('#main_pack .today_area .info_data .todaytemp');
    final temperature = temperatureElement?.text;

    // 추출한 기온 정보 출력
    print('서울 현재 기온: $temperature℃');
  } else {
    print('Failed to fetch data: ${response.statusCode}');
  }
}
