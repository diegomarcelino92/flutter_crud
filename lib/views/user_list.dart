import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USER};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ctx, i) => UserTail(users.values.elementAt(i)),
      ),
    );
  }
}
