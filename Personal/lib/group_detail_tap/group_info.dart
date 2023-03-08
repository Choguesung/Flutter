import 'package:flutter/material.dart';
import 'package:personal/database/mysql.dart';

class GroupInfo extends StatefulWidget {
  const GroupInfo({Key? key}) : super(key: key);

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  var db = new Mysql();
  var name = '';

  void _getCustomer(){
    db.getConnection().then((conn){
      String sql = 'select name from world.city where id=1;';
      conn.query(sql).then((result){
        for(var row in result){
          setState(() {
            name = row[0];
          });
        }
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    _getCustomer();
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('$name'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
