import 'package:flutter/material.dart';

class Graphic {
  final int id;
  final String title;

  Graphic({this.id, this.title});

  factory Graphic.fromJson(Map<String, dynamic> json) {
    return Graphic(
      id: json['id'],
      title: json['title'],
    );
  }
}
