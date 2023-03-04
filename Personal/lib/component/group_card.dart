import 'package:flutter/material.dart';
import 'package:personal/component/group_detail.dart';
import 'package:personal/screen/home_screen.dart';

class GroupCard extends StatelessWidget {
  final String img;
  final String name;

  const GroupCard({
    required this.img,
    required this.name,
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupDetail()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _Image(
                    img: img,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  _Name(
                    name: name,
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
    return Image.asset(img);
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
      color: Colors.blue,
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
