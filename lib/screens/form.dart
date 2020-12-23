import 'package:flutter/material.dart';
import 'package:flutter_app/screens/grafico.dart';
import 'package:validators/validators.dart' as validator;
import 'model.dart';
import 'result.dart';

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();

  String dropdownValue = 'PIB';


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
                      return null;
                    },
                    onSaved: (String value) {
                      model.paisuno = value;
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
                      return null;
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
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down, size: 22),
            underline: SizedBox(),
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
                      return null;
                    },
                    onSaved: (String value) {
                      model.annoinicio = value;
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
                      return null;
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
            color: Colors.blueAccent,
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.push(context, MaterialPageRoute(
                        builder: (context) => rest(model: this.model)));}},
            child: Text('Graficar', style: TextStyle(color: Colors.white,),
            ),
          )
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

