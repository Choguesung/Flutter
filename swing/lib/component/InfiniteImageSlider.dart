import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InfiniteImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  InfiniteImageSlider({required this.imageUrls});

  @override
  _InfiniteImageSliderState createState() => _InfiniteImageSliderState();
}

class _InfiniteImageSliderState extends State<InfiniteImageSlider> {
  late List<String> _imageUrls;

  @override
  void initState() {
    super.initState();
    _imageUrls = [
      widget.imageUrls.last,
      ...widget.imageUrls,
      widget.imageUrls.first,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        initialPage: 1,
        aspectRatio: 16 / 9,
        height: 240,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          if (index == 0) {
            setState(() {
              _imageUrls = [
                _imageUrls[_imageUrls.length - 2],
                ...widget.imageUrls,
                _imageUrls[1],
              ];
            });
          } else if (index == _imageUrls.length - 1) {
            setState(() {
              _imageUrls = [
                _imageUrls[_imageUrls.length - 2],
                ...widget.imageUrls,
                _imageUrls[1],
              ];
            });
          }
        },
      ),
      itemCount: _imageUrls.length,
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            _imageUrls[index],
            fit: BoxFit.cover,
            width: 1000,
          ),
        );// 11
      },
    );
  }
}
