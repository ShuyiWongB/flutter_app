/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'Graphic.dart';

class Resulta extends StatelessWidget {
  Model model;
  Result({this.model});

  Future<Post> fetchPost() async {
    final http.Response response = await http.post(
      'http://127.0.0.1:8080/api/indicators/info',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "countryCode": model.paisuno,
        "indicatorCode": id,
        "startYear": Yearinitial,
        "endYear": YearFinal
      }),
    );
    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      return Post.fromJson(json.decode(response.body));
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      throw Exception('Error de abrir servidor');
    }
  }


  class Post {
  final String countryCode;
  final String indicadorCode;
  final int startYear;
  final int endYear;

  Post({this.countryCode, this.indicadorCode, this.startYear, this.endYear});

  factory Post.fromJson(Map<String, dynamic> json) {
  return Post(
  countryCode: json['countryCode'],
  indicadorCode: json['indicadorCode'],
  startYear: json['startYear'],
  endYear: json['endYear'],
  );
  }
  }

  class rest extends StatelessWidget {
  final Future<Post> post;

  rest({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: 'Fetch Data Example',
  theme: ThemeData(
  primarySwatch: Colors.blue,
  ),
  home: Scaffold(
  appBar: AppBar(
  title: Text('Fetch Data Example'),
  ),
  body: Center(
  child: FutureBuilder<Post>(
  future: post,
  builder: (context, snapshot) {
  if (snapshot.hasData) {
  return Text(snapshot.data.countryCode);
  } else if (snapshot.hasError) {
  return Text("${snapshot.error}");
  }
  // Por defecto, muestra un loading spinner
  return CircularProgressIndicator();
  },
  ),
  ),
  ),
  );
  }
  }*/