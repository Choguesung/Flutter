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
                _GroupImage(
                  img: 'assets/img/core2.png',
                ),
                _GroupDetailCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupImage extends StatelessWidget {
  final String img;

  const _GroupImage({
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(img);
  }
}

class _GroupDetailCard extends StatelessWidget {
  const _GroupDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Text(
        "text",
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }
}
