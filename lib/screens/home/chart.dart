import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:intl/intl.dart';

class BarGraphWidget extends StatelessWidget {
  final List<Map<String, String>> historyData;

  const BarGraphWidget({Key? key, required this.historyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<OrdinalSales, String>> seriesList = [
      charts.Series<OrdinalSales, String>(
        id: 'Weights',
        data: historyData
            .map((data) => OrdinalSales(
                  data['date']!,
                  double.parse(data['weight']!),
                ))
            .toList(),
        domainFn: (OrdinalSales sales, _) =>
            DateFormat.yMMMd().format(DateTime.parse(sales.date)),
        measureFn: (OrdinalSales sales, _) => sales.weight,
      )
    ];

    return Container(
      height: 200, // Add a fixed height to prevent bottom overflow
      child: charts.BarChart(
        seriesList,
        animate: true,
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 60,
          ),
        ),
      ),
    );
  }
}

// Model class for data points
class OrdinalSales {
  final String date;
  final double weight;

  OrdinalSales(this.date, this.weight);
}
