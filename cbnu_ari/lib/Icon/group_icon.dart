import 'package:flutter/material.dart';

import '../screen/group_detail_screen.dart';

class GroupIcon extends StatelessWidget {
  final int id;
  final String img;
  final String name;

  const GroupIcon({
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
          MaterialPageRoute(
            builder: (context) => GroupDetail(
              group_id: id,
            ),
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 2.0,
            right: 2.0,
          ),
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
      ),
    );
  }
}
