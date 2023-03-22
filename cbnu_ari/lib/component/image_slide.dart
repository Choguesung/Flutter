import 'dart:async';

import 'package:flutter/material.dart';

class AutoSlider extends StatefulWidget {
  final List<String> imageUrls;

  AutoSlider({required this.imageUrls});

  @override
  _AutoSliderState createState() => _AutoSliderState();
}

class _AutoSliderState extends State<AutoSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // 3초마다 페이지 자동 슬라이드
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // 타이머 종료
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: widget.imageUrls.map((url) {
        return Image.network(url);
      }).toList(),
    );
  }
}