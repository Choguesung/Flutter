import 'package:flutter/material.dart';
import 'package:personal/screen/home_screen.dart';

class advertise extends StatelessWidget {
  const advertise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _TabBar();
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
