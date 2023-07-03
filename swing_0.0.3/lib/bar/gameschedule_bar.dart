import 'package:flutter/material.dart';

class GameScheduleBar extends StatefulWidget {
  final List<Widget> children;

  const GameScheduleBar({required this.children});

  @override
  _GameScheduleBarState createState() => _GameScheduleBarState();
}

class _GameScheduleBarState extends State<GameScheduleBar> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  double? currentPageValue = 1.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                animation: _pageController,
                builder: (context, child) {
                  double value = 1.0;
                  if (_pageController.position.haveDimensions) {
                    value = _pageController.page! - index;
                    value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                  }
                  return Center(
                    child: SizedBox(
                      height: Curves.easeInOut.transform(value) * 150,
                      width: Curves.easeInOut.transform(value) * 300,
                      child: child,
                    ),
                  );
                },
                child: widget.children[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
