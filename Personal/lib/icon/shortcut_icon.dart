import 'package:flutter/material.dart';
import 'package:personal/screen/event_page1.dart';

class ShortCutIcon extends StatelessWidget {
  final int id;
  final String img;
  final String text;

  const ShortCutIcon({
    required this.id,
    required this.img,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 누를시 다른 페이지로 이동
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventPage1()),
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
            SizedBox(height: 4.0,),
            Text(text),
          ],
        ),
      ),
    );
  }
}
