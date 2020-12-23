import 'package:flutter/material.dart';

class UserListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Integrantes'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: UserList(),
          ),
        ),
    );
  }
}

class User {
  String nombre;
  User(this.nombre);
}

class UserList extends  StatefulWidget {
  @override
  _UserListState createState() => new _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users;

  void initState(){
    users = [
      User('Shuyi Wong'),
      User('Javier Lopez'),
      User('Alex Bidart')
    ];
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          return ListTile(
              title: Text(users[index].nombre), leading: Icon(Icons.person),);
    },
    itemCount: 3,
    );
  }
}
