import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
class BarGraphWidget extends StatelessWidget {
  final List<Map<String, String>> historyData;

  const BarGraphWidget(  {Key? key, required this.historyData}) : super(key: key);

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
        domainFn: (OrdinalSales sales, _) => sales.date,
        measureFn: (OrdinalSales sales, _) => sales.weight,
      )
    ];
    

    return SizedBox(
      height: 200,
      child: charts.BarChart(
        seriesList,
        animate: true,
        domainAxis: const charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 60,
          ),
        ),
      ),
    );
  }
}


class OrdinalSales {
  final String date;
  final double weight;

  OrdinalSales(this.date, this.weight);
}
