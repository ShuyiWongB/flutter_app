import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Widget.dart';
import './screens/home.dart';
import './screens/Integrantes.dart';
import './screens/formulario.dart';
import './screens/grafico.dart';
import './screens/form.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import './screens/formulario33.dart';


void main() {
  runApp(new MaterialApp(
    title: 'Flutter App',
    routes: <String, WidgetBuilder>{
      '/Home': (BuildContext context) => new rest(),
      '/Integrantes': (BuildContext context) => new UserListApp(),
      '/formulario' : (BuildContext context) => new TestForm(),
    },
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wid()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: new Column(children: <Widget>[
          Divider(
            height: 240.0,
            color: Colors.white,
          ),
          new Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/4/43/Logo_UTEM.png',
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
            width: 170.0,
          ),
          Divider(
            height: 105.2,
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
