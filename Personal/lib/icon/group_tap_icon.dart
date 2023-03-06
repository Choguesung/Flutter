import 'package:flutter/material.dart';
import 'package:personal/component/group_detail.dart';

import '../screen/event_page1.dart';

class GrouptapIcon extends StatelessWidget {
  final int id;
  final String img;
  final String name;

  const GrouptapIcon({
    required this.id,
    required this.img,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GroupDetail()),
        );
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(300.0),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
