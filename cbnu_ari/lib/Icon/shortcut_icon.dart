import 'package:cbnu_ari/screen/test_screen.dart';
import 'package:flutter/material.dart';

class ShortCutIcon extends StatelessWidget {
  final String img;
  final String text;
  //final Widget widget;

  const ShortCutIcon({
    required this.img,
    required this.text,
    //required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 누를시 다른 페이지로 이동
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TestScreen()),
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
