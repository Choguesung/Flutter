import 'package:cbnu_ari/const/colors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../component/image_slide.dart';
import '../response/response.dart';

// 동아리 정보 페이지
class GroupDetail extends StatelessWidget {
  final int group_id;

  const GroupDetail({
    required this.group_id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupDetailTapView(
      group_id: group_id,
    );
  }
}

class GroupDetailTapView extends StatelessWidget {
  final int group_id;

  const GroupDetailTapView({
    required this.group_id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.category,
                  ),
                  text: '동아리 정보',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: '게시판',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: '회비 내역',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: '관리',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _GroupInfo(
                group_id: group_id,
              ),
              _GroupNotice(),
              _GroupAccount(),
              _GroupManage(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GroupInfo extends StatelessWidget {
  final int group_id;

  const _GroupInfo({
    required this.group_id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: fetchDatas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _GroupInfoDetail(
              title: snapshot.data![group_id]['title'],
              content: snapshot.data![group_id]['content'],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

// 여기에 동아리 정보 그리면 됨
class _GroupInfoDetail extends StatelessWidget {
  final String title;
  final String content;

  const _GroupInfoDetail({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // 이미지 슬라이더 나중에 사용 할 코드
          //AutoSlider(imageUrls: ['assets/img/core.png'],),
          //_GroupImage(img: 'assets/img/core.png',),
          Text(title),
          Text(content),
        ],
      ),
    );
  }
}

class _GroupImage extends StatelessWidget {
  final String img;

  const _GroupImage({
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            img,
          ),
        ],
      ),
    );
  }
}

// 게시판 구현 공간
class _GroupNotice extends StatelessWidget {
  const _GroupNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// 회비 내역 구현 공간
class _GroupAccount extends StatelessWidget {
  const _GroupAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// 관리 구현 공간
class _GroupManage extends StatelessWidget {
  const _GroupManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
