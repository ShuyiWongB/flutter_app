import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'respuesta.dart';

class rest extends StatefulWidget {
  Model model;
  rest({this.model});

  @override
  _restState createState() => _restState();
}

class _restState extends State<rest> {
  Respuesta _respuesta;

  Future<Respuesta> createRespuesta(String paisuno,
      String indicador, String annoinicio, String annotermino) async {
    http.Response response = await http.post('http://127.0.0.1:8080/api/indicators/info', headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "indicatorCode": indicador,
          "endYear": annotermino,
          "countryCode": paisuno,
          "startYear": annoinicio
        }),);
    if (response.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      print ("Conectado");
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      print ("No se conecta");
    }
  }

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
        body: Container(
          padding: EdgeInsets.all(32),
          child:
          _respuesta == null ? Container():
          Text('Los datos son ${_respuesta.value}'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final String paisuno = "CL";
              final String indicador = "PIB";
              final String annotermino = "2018";
              final String annoinicio = "2018";

              final Respuesta respuesta = await createRespuesta(
                  paisuno, indicador, annoinicio, annotermino);
              setState(()
              {
                _respuesta = respuesta;
              });
            }
        ),
      ),
    );
  }
}