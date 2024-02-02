import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class BarGraph extends StatefulWidget {
  @override
  State<BarGraph> createState() => _BarGraphState();
}

class _BarGraphState extends State<BarGraph> {
  @override
  Widget build(BuildContext context) {
    final data = [
      new LinearSales("Jan", 100),
      new LinearSales("Feb", 75),
      new LinearSales("Mar", 50),
      new LinearSales("Apr", 25),
    ];
    final chart =  charts.BarChart(
      [
        new charts.Series<LinearSales, String>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.month,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: data,
        ),
      ],
      animate: true,
    );
    return  Center(
          child: Container(
            height: 200,
            child: chart,
          ),
       
    );
  }

 
}
class LinearSales {
  final String month;
  final int sales;
  LinearSales(this.month, this.sales);
}