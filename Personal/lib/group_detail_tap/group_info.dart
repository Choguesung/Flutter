import 'package:flutter/material.dart';

class GroupInfo extends StatefulWidget {
  const GroupInfo({Key? key}) : super(key: key);

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('helo'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
