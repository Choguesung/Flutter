import 'package:flutter/material.dart';
import 'package:personal/group_detail_tap/group_account.dart';
import 'package:personal/group_detail_tap/group_info.dart';
import 'package:personal/group_detail_tap/group_manage.dart';
import 'package:personal/group_detail_tap/group_notice.dart';

class GroupDetail extends StatelessWidget {
  const GroupDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupDetailTapView();
  }
}

class GroupDetailTapView extends StatelessWidget {
  const GroupDetailTapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
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
              GroupInfo(),
              GroupNotice(),
              GroupAccount(),
              GroupManage(),
            ],
          ),
        ),
      ),
    );
  }
}
