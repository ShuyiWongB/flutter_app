import 'package:flutter/material.dart';
import './screens/Integrantes.dart';
import './screens/form.dart';

class Wid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Widgettate();
  }
}

class _Widgettate extends State<Wid> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    TestForm(),
    UserListApp(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.file_copy),
            title: new Text('Formulario'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Integrantes')
          )
        ],
      ),
    );
  }
}
