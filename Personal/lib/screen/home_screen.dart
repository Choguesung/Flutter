import 'package:flutter/material.dart';
import 'package:personal/screen/advertise_screen.dart';
import 'package:personal/screen/group_screen.dart';
import 'package:personal/screen/myinfo_screen.dart';
import 'package:personal/screen/search_screen.dart';
import 'package:personal/view/grouptap_view.dart';
import '../icon/shortcut_icon.dart';

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
                AdvertiseScreen(),
                GroupScreen(),
                SearchScreen(),
                MyInformationScreen(),
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
          SizedBox(height: 8.0),
          _Schedule(),
          SizedBox(height: 8.0),
          _ShortCut(),
          _GroupTapBar(),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: TextField(),
            ),
            SizedBox(
              width: 2.0,
            ),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}

class _Schedule extends StatelessWidget {
  const _Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('나의 일정'),
      ],
    );
  }
}

class _ShortCut extends StatelessWidget {
  const _ShortCut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.separated(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return SizedBox(height: 8.0);
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ShortCutIcon(
              id: index,
              img: 'assets/img/core2.png',
              text: '총동연',
            ),
          );
        },
      ),
    );
  }
}

class _GroupTapBar extends StatelessWidget {
  const _GroupTapBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.category,
                  ),
                  text: '직무 동아리',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: '중앙 동아리',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              GroupTapView(type: true),
              GroupTapView(type: false),
            ],
          ),
        ),
      ),
    );
  }
}
