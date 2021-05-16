import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StatisticPage extends StatefulWidget {
  final Widget child;

  StatisticPage({Key key, this.child}) : super(key: key);

  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List<charts.Series<Diagramm, String>> _seriesData;

  _generateData() {
    
var data1 = [
      new Diagramm('Ighor', 100),
      new Diagramm('Ruslan', 360),
      new Diagramm('Artur', 500),
      new Diagramm('Nazar', 100),
      new Diagramm('Ramen', 1354),
      new Diagramm('Anastasia', 700),
      new Diagramm('Katya', 140),
      new Diagramm('Andre', 402),
      new Diagramm('Milka', 1000),
    ];

_seriesData.add(
      charts.Series(
        domainFn: (Diagramm id, _) => id.name,
        measureFn: (Diagramm id, _) => id.value,
        id: 'test',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Diagramm id, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ), 
    );

  }
  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    _seriesData = List<charts.Series<Diagramm, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistic"),
        backgroundColor: Colors.redAccent[400],
      ),
          body: 
          Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                            'Diagram',style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold),),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            vertical: false,
                            barGroupingType: charts.BarGroupingType.grouped,
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
        );
   }
}

class Diagramm {
  String name;
  int value;

  Diagramm(this.name, this.value);
}