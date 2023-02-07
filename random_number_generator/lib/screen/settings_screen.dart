import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: 10000
                    .toString()
                    .split('')
                    .map(
                      (e) => Image.asset(
                        'asset/img/$e.png',
                        width: 50.0,
                        height: 70.0,
                      ),
                    )
                    .toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('저장!'),
            )
          ],
        ));
  }
}
