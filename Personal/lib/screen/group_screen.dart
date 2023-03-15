import 'package:flutter/material.dart';
import 'package:personal/component/group_card.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _GroupList(),
        ],
      ),
    );
  }
}

class _GroupList extends StatelessWidget {
  const _GroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.separated(
          itemCount: 12,
          separatorBuilder: (context, index) {
            return SizedBox(height: 8.0);
          },
          itemBuilder: (context, index) {
            return GroupCard(
              group_id: index.toInt(),
              img: 'assets/img/core.png',
              name: '코어',
            );
          },
        ),
      ),
    );
  }
}
