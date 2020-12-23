import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:validators/validators.dart' as validators;
import 'dart:async';
import 'package:intl/intl.dart';
import './model.dart';


class formulario extends StatefulWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  formulario({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  _formularioState createState() => _formularioState();


}

class _formularioState extends State<formulario> {

  TextEditingController paisuno = new TextEditingController();
  TextEditingController paisdos = new TextEditingController();


  String dropdownValue = '';
  DateTime date = DateTime(1994) ;
  var customFormat = DateFormat('yyyy');
  String pais1 = '';
  String pais2 = '';
  String indicador = '';
  String annoinicio = '';
  String annotermino = '';

  var paises = ['','Afghanistan','Albania','Algeria','American Samoa','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Aruba','Australia','Austria','Azerbaijan','Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bermuda','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','British Virgin Islands','Brunei Darussalam','Bulgaria','Burkina Faso','Burundi','Cabo Verde','Cambodia','Cameroon','Canada','Cayman Islands','Central African Republic','Chad','Channel Islands','Chile','China','Colombia','Comoros','Congo Dem. Rep.','Congo Rep.','Costa Rica','Cote dIvoire','Croatia','Cuba','Curacao','Cyprus','Czech Republic','Denmark','Djibouti','Dominica','Dominican Republic','Ecuador','Egypt Arab Rep.','El Salvador','Equatorial Guinea','Eritrea','Estonia','Eswatini','Ethiopia','Faroe Islands','Fiji','Finland','France','French Polynesia','Gabon','Gambia','Georgia','Germany','Ghana','Gibraltar','Greece','Greenland','Grenada','Guam','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hong Kong SAR China','Hungary','Iceland','India','Indonesia','Iran Islamic Rep.','Iraq','Ireland','Isle of Man','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Korea Dem.','Korea Rep.','Kosovo','Kuwait','Kyrgyz Republic','Lao PDR','Latvia','Lebanon','Lesotho','Liberia','Libya','Liechtenstein','Lithuania','Luxembourg','Macao SAR China','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Mauritania','Mauritius','Mexico','Micronesia Fed. Sts.','Moldova','Monaco','Mongolia','Montenegro','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','New Caledonia','New Zealand','Nicaragua','Niger','Nigeria','North Macedonia','Northern Mariana Islands','Norway','Oman','Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Puerto Rico','Qatar','Romania','Russian Federation','Rwanda','Samoa','San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Serbia','Seychelles','Sierra Leone','Singapore','Sint Maarten (Dutch part)','Slovak Republic','Slovenia','Solomon Islands','Somalia','South Africa','South Sudan','Spain','Sri Lanka','St. Kitts and Nevis','St. Lucia','St. Martin (French part)','St. Vincent and the Grenadines','Sudan','Suriname','Sweden','Switzerland','Syrian Arab Republic','Tajikistan','Tanzania','Thailand','Timor-Leste','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Turks and Caicos Islands','Tuvalu','Uganda','Ukraine','United Arab Emirates','United Kingdom','United States','Uruguay','Uzbekistan','Vanuatu','Venezuela','Vietnam','Virgin Islands (U.S.)','West Bank and Gaza','Yemen Rep.','Zambia','Zimbabwe'];
  var codigos = ['','AF','AL','DZ','AS','AD','AO','AG','AR','AM','AW','AU','AT','AZ','BS','BH','BD','BB','BY','BE','BZ','BJ','BM','BT','BO','BA','BW','BR','VG','BN','BG','BF','BI','CV','KH','CM','CA','KY','CF','TD','No hay datos.','CL','CN','CO','KM','CD','CG','CR','CI','HR','CU','CW','CY','CZ','DK','DJ','DM','DO','EC','AE','SV','GQ','ER','EE','SZ','ET','FO','FJ','FI','FR','PF','GA','GM','GE','DE','GH','GI','GR','GL','GD','GU','GT','GN','GW','GY','HT','HN','HK','HU','IS','IN','ID','IR','IQ','IE','IM','IL','IT','JM','JP','JO','KZ','KE','KI','KP','KR','No hay datos.','KW','KG','LA','LV','LB','LS','LR','LY','LI','LT','LU','MO','MG','MW','MY','MV','ML','MT','MH','MQ','MU','MX','FM','MD','MC','MN','ME','MA','MZ','MM','NA','NR','NP','NL','NC','NZ','NI','NE','NG','MK','MP','NO','OM','PK','PW','PA','PG','PY','PE','PH','PL','PT','PR','QA','RO','RU','RW','WS','SM','ST','SA','SN','RS','SC','SL','SG','MF','SK','SI','SB','SO','ZA','SS','ES','LK','KN','LC','MF','VC','SD','SR','SE','CH','SY','TJ','TZ','TH','TL','TG','TO','TT','TN','TR','TM','TC','TV','UG','UA','AE','GB','US','UY','UZ','VU','VE','VN','VI','No hay datos.','YE','ZM','ZW'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulario'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                Text('Pais Uno'),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: paisuno,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty){
                      return 'Escriba el codigo del pais uno';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Indique el codigo del Pais Uno',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value) {
                    Text("El codigo ingresado es ${paisuno}");
                    //Do something with this value
                  },
                ),
                SizedBox(height: 10.0),
                Text('Pais Dos'),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: paisdos,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty){
                      return 'Escriba el codigo del pais dos';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Indique el codigo del Pais Dos',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 32.0),
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)
                      )
                  ),
                  onChanged: (value) {
                    Text("El codigo ingresado es ${paisdos}");
                    //Do something with this value
                  },
                ),
                SizedBox(height: 10.0),
                Text('Indicador'),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(3.0)
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down, size: 22),
                    underline: SizedBox(),
                    items: <String>['', 'PIB', 'IVA', 'SMI', 'TDA', 'IFL', 'PRF', 'TSC', 'DBI'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Text('Año de Inicio'),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1994),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.dark(),
                          child: child,
                        );
                      },
                    );
                    if (picked != null && picked != date)
                      setState(() {
                        date = picked;
                      });
                  },
                  child: Text('$date '),
                ),
                SizedBox(height: 10.0),
                Text('Año de Termino'),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1994),
                      lastDate: DateTime.now(),
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.dark(),
                          child: child,
                        );
                      },
                    );
                    if (picked != null && picked != date)
                      setState(() {
                        date = picked;
                      });
                  },
                  child: Text('$date '),
                ),
                SizedBox(height: 10.0),
                  RaisedButton(
                    color: Colors.purple,
                    child: Text('Graficar', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/grafico'); //Do Something
                    },
                  ),
                ])
          ),
        )
    );
  }
}