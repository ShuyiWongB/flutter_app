import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Graphic.dart';
import 'package:validators/validators.dart' as validator;
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'respuesta.dart';
import 'Graphic.dart';
import 'ModelGraphic.dart';

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  String dropdownValue = 'PIB';
  List<String> paises = ['AF','AL','DZ','AS','AD','AO','AG','AR','AM','AW','AU','AT','AZ','BS','BH','BD','BB','BY','BE','BZ','BJ','BM',
    'BT','BO','BA','BW','BR','VG','BN','BG','BF','BI','CV','KH','CM','CA','KY','CF','TD','CL','CN','CO','KM','CD','CG',
    'CR','CI','HR','CU','CW','CY','CZ','DK','DJ','DM','DO','EC','AE','SV','GQ','ER','EE','SZ','ET','FO','FJ','FI','FR','PF','GA','GM',
    'GE','DE','GH','GI','GR','GL','GD','GU','GT','GN','GW','GY','HT','HN','HK','HU','IS','IN','ID','IR','IQ','IE','IM','IL','IT','JM',
    'JP','JO','KZ','KE','KI','KP','KR','KW','KG','LA','LV','LB','LS','LR','LY','LI','LT','LU','MO','MG','MW','MY','MV',
    'ML','MT','MH','MQ','MU','MX','FM','MD','MC','MN','ME','MA','MZ','MM','NA','NR','NP','NL','NC','NZ','NI','NE','NG','MK','MP','NO',
    'OM','PK','PW','PA','PG','PY','PE','PH','PL','PT','PR','QA','RO','RU','RW','WS','SM','ST','SA','SN','RS','SC','SL','SG','MF','SK',
    'SI','SB','SO','ZA','SS','ES','LK','KN','LC','MF','VC','SD','SR','SE','CH','SY','TJ','TZ','TH','TL','TG','TO','TT','TN','TR','TM',
    'TC','TV','UG','UA','AE','GB','US','UY','UZ','VU','VE','VN','VI','YE','ZM','ZW'];
  List<String> fechas = ['1971','1972','1973','1974','1975','1976','1977','1978','1979','1980','1981','1982','1983','1984','1985','1986',
    '1987','1988','1989','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005',
    '2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019','2020'];
  String primerpais = '';
  String fechainicio = '';

  Respuesta _respuesta;

  static var name;
  static var valor;
  static var year;


  Future<Respuesta> createRespuesta(String paisuno,
      String indicador, String annoinicio, String annotermino, String paisdos) async {
    http.Response response = await http.post('http://127.0.0.1:8080/api/indicators/info', headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "indicatorCode": indicador,
        "endYear": annotermino,
        "countryCode": paisuno,
        "startYear": annoinicio
      }),);
    http.Response response2 = await http.post('http://127.0.0.1:8080/api/indicators/info', headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "indicatorCode": indicador,
        "endYear": annotermino,
        "countryCode": paisdos,
        "startYear": annoinicio
      }),);
    if (response.statusCode == 200 && response2.statusCode == 200) {
      // Si la llamada al servidor fue exitosa, analiza el JSON
      print ("Conectado");
    } else {
      // Si la llamada no fue exitosa, lanza un error.
      print ("No se conecta");
    }
  }

  final List<ModelGraphic> data = [
  ModelGraphic(
  year: year,
  name: name,
  value: valor,
  color: charts.ColorUtil.fromDartColor(Color(0xFF47505F)),
  ),];

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0, width: 10.0,),
          Text('Formulario', style: TextStyle(fontSize: 30)),
          SizedBox(height: 10.0),
          Text('Paises'),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Pais Uno',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese el pais uno';
                      }
                      if (paises.contains(value)) {
                        return null;
                      }
                      return 'Pais incorrecto';
                    },
                    onSaved: (String value) {
                      primerpais = value;
                      model.paisuno = primerpais;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Pais Dos',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese el pais dos';
                      }
                      if (value != primerpais && paises.contains(value)) {
                        return null;
                      }
                      return 'Pais incorrecto';
                    },
                    onSaved: (String value) {
                      model.paisdos = value;
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text('Indicador'),
          SizedBox(height: 10.0),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.keyboard_arrow_down, size: 22),
            style: TextStyle(color: Colors.deepPurple),
            hint: Text("Indicadores"),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            items: <String>['PIB', 'IVA', 'SMI', 'TDA', 'IFL', 'PRF', 'TSC', 'DBI'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            onChanged: (value) {

              setState(() {
                dropdownValue = value;
                model.indicador = dropdownValue;
              });
            },
          ),
          SizedBox(height: 10.0),
          Text('Fechas'),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Año Inicio',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese el año de Inicio';
                      }
                      if (fechas.contains(value)) {
                        return null;
                      }
                      return 'Fecha Incorrecta';
                    },
                    onSaved: (String value) {
                      fechainicio = value;
                      model.annoinicio = fechainicio;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Año Termino',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Ingrese el año de Termino';
                      }
                      if (value != fechainicio && fechas.contains(value)) {
                        return null;
                      }
                      return 'Fecha Incorrecta';
                    },
                    onSaved: (String value) {
                      model.annotermino = value;
                    },
                  ),
                )
              ],
            ),
          ),

          RaisedButton(
            color: Colors.deepPurple,
            onPressed: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                final String paisuno = model.paisuno;
                final String indicador = model.indicador;
                final String annotermino = model.annotermino;
                final String annoinicio = model.annoinicio;
                final String paisdos = model.paisdos;

                final Respuesta respuesta = await createRespuesta(
                    paisuno, indicador, annoinicio, annotermino, paisdos);
                setState(() {
                  _respuesta = respuesta;
                  name = _respuesta.name;
                  year = _respuesta.year;
                  valor = _respuesta.value;
                });
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => GraficoDeBarras(data: [],)));
              }},
              child:
              Text('Graficar', style: TextStyle(color: Colors.white,),
              ),

          ),
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}