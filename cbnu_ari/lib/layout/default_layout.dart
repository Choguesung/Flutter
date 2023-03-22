import 'package:cbnu_ari/screen/advertise_screen.dart';
import 'package:cbnu_ari/screen/group_screen.dart';
import 'package:cbnu_ari/screen/main_screen.dart';
import 'package:flutter/material.dart';

import '../screen/test_screen.dart';

class DefaultLayout extends StatelessWidget {

  const DefaultLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBNU',
      theme: ThemeData(primaryColor: Colors.white),
      home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              title: Text('충북대학교 동아리 앱'),
              backgroundColor: Colors.purple,
            ),
            body: const TabBarView(
              children: [
                MainScreen(),
                AdvertisementScreen(),
                GroupScreen(),
                TestScreen(),
                TestScreen(),
              ],
            ),
            bottomNavigationBar: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: '홈 스크린',
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: '홍보 게시판',
              ),
              Tab(
                icon: Icon(Icons.people),
                text: '동아리',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: '통합검색',
              ),
              Tab(
                icon: Icon(Icons.manage_accounts),
                text: '내 정보',
              ),
            ]),
          )),
    );
  }
}
