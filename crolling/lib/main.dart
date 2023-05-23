import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seoul Weather',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String temperature = '';

  @override
  void initState() {
    super.initState();
    fetchSeoulTemperature();
  }

  Future<void> fetchSeoulTemperature() async {
    final response = await http.get(Uri.parse('https://www.google.com/search?q=서울+기온'));

    if (response.statusCode == 200) {
      final html = response.body;
      final document = parser.parse(html);

      final temperatureElement = document.querySelector('.wob_t');

      if (temperatureElement != null) {
        final temp = temperatureElement.text.trim();

        setState(() {
          temperature = temp;
        });
      }
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seoul Weather'),
      ),
      body: Center(
        child: Text(
          'Current Temperature: $temperature℃',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
