import 'package:flutter/material.dart';
import 'package:personal/screen/group.dart';
import '../icon/group_tap_icon.dart';

class GroupTapView extends StatelessWidget {
  const GroupTapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.separated(
              itemCount: 11,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 8.0);
              },
              itemBuilder: (context, index) {
                return GrouptapIcon(
                  id: index,
                  img: 'assets/img/core2.png',
                  name: '코어',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
