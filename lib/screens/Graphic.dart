import 'package:flutter/material.dart';
import 'package:flutter_app/screens/respuesta.dart';
import 'ModelGraphic.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'model.dart';

class GraficoDeBarras extends StatefulWidget {
  final List<ModelGraphic> data;

  const GraficoDeBarras({Key key, this.data}) : super(key: key);

  @override
  _GraficoDeBarrasState createState() => _GraficoDeBarrasState();
}

class _GraficoDeBarrasState extends State<GraficoDeBarras> {
  List<ModelGraphic> _barChartList;
  Model model = Model();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _barChartList = [
      ModelGraphic(name: model.paisuno),
      ModelGraphic(name: model.paisdos),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ModelGraphic, String>> series = [
      charts.Series(
          id: "Datos",
          data: widget.data,
          domainFn: (ModelGraphic series, _) => series.year,
          measureFn: (ModelGraphic series, _) => series.value,
          colorFn: (ModelGraphic series, _) => series.color),
    ];
    return _buildFinancialList(series);

  }

  Widget _buildFinancialList(series) {
    return _barChartList != null
        ? ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: Colors.white,
        height: 5,
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _barChartList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: MediaQuery.of(context).size.height/ 2.3,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_barChartList[index].name,
                      style: TextStyle(
                          color: Colors.black, fontSize: 22,
                          fontWeight: FontWeight.bold)
                  ),
                ],
              ),
              Expanded( child: charts.BarChart(series, animate: true)),
            ],
          ),
        );
      },
    )
        : SizedBox();
  }
}