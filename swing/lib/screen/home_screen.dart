import 'package:flutter/material.dart';
import 'package:swing/component/InfiniteImageSlider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InfiniteImageSlider(imageUrls: ['assets/img/core.png'],),
      ),
    );
  }
}
