import 'package:flutter/material.dart';
import 'package:personal/screen/advertise.dart';
import 'package:personal/screen/group.dart';
import 'package:personal/screen/myinfo.dart';
import 'package:personal/screen/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _NavigationBar();
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar({Key? key}) : super(key: key);

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
            ),
            body: const TabBarView(
              children: [
                _HomeScreenDetail(),
                advertise(),
                group(),
                search(),
                MyInformation(),
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

class _HomeScreenDetail extends StatelessWidget {
  const _HomeScreenDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _SearchBar(),

        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ;
  }
}
