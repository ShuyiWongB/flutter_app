// To parse this JSON data, do
//
//     final respuesta = respuestaFromJson(jsonString);

import 'dart:convert';

Respuesta respuestaFromJson(String str) => Respuesta.fromJson(json.decode(str));

String respuestaToJson(Respuesta data) => json.encode(data.toJson());

class Respuesta {
  Respuesta({
    this.code,
    this.country,
    this.name,
    this.unit,
    this.value,
    this.year,
  });

  String code;
  Country country;
  String name;
  String unit;
  String value;
  String year;

  factory Respuesta.fromJson(Map<String, dynamic> json) => Respuesta(
    code: json["code"],
    country: Country.fromJson(json["country"]),
    name: json["name"],
    unit: json["unit"],
    value: json["value"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "country": country.toJson(),
    "name": name,
    "unit": unit,
    "value": value,
    "year": year,
  };
}

class Country {
  Country({
    this.abbr,
    this.code,
    this.currencyCode,
    this.currencyName,
    this.lang,
    this.name,
  });

  String abbr;
  String code;
  String currencyCode;
  String currencyName;
  String lang;
  String name;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    abbr: json["abbr"],
    code: json["code"],
    currencyCode: json["currencyCode"],
    currencyName: json["currencyName"],
    lang: json["lang"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "abbr": abbr,
    "code": code,
    "currencyCode": currencyCode,
    "currencyName": currencyName,
    "lang": lang,
    "name": name,
  };
}
