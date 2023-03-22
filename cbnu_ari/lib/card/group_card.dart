import 'package:cbnu_ari/const/colors.dart';
import 'package:cbnu_ari/screen/group_detail_screen.dart';
import 'package:cbnu_ari/screen/test_screen.dart';
import 'package:flutter/material.dart';

class GroupCard extends StatelessWidget {
  final int group_id;
  final String img;
  final String name;
  final String content;

  const GroupCard({
    required this.group_id,
    required this.img,
    required this.name,
    required this.content,
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupDetail(group_id: group_id)),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: PRIMARY_COLOR,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Image(
                    img: img,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Name(
                        name: name,
                      ),
                      _Content(
                        content: content,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  final String img;

  const _Image({
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300.0),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Name extends StatelessWidget {
  final String name;

  const _Name({
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 24.0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${name}',
          style: textStyle,
        ),
        SizedBox(
          width: 16.0,
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String content;

  const _Content({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 12.0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${content}',
          style: textStyle,
        ),
        SizedBox(
          width: 16.0,
        ),
      ],
    );
  }
}
