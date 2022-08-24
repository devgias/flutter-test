import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testi/viewmodel/user_view_model.dart';

import '../model/user.dart';
import 'add.dart';
import 'edit.dart';

class UsersScreen extends StatefulWidget {
  static const route = '/users';
  const UsersScreen({ Key? key }) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final textController = TextEditingController();
  final UserViewModel _userViewModel = UserViewModel();
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: FutureBuilder<List<User>>(
          future: _userViewModel.getUserList(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if(snapshot.hasError){
                print(snapshot);
            }
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return snapshot.data!.isEmpty ?
            Center(
              child: Text('No users'),
            ) :
            ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                var item = snapshot.data![index];
                return ListTile(
                  leading: Image(image: NetworkImage(item.avatarUrl)),
                  title: Text(item.login),
                  subtitle: Text(item.type),
                  onTap: (){
                    Navigator.pushNamed(
                      context, 
                      EditScreen.route,
                      arguments: item
                    );
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            Navigator.pushNamed(
              context, 
              AddScreen.route,
            );
          },
        ),
      );
  }
}