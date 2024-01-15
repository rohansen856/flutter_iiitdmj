import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartComponent extends StatefulWidget {
  const ChartComponent({super.key});

  @override
  State<ChartComponent> createState() => _ChartComponentState();
}

class _ChartComponentState extends State<ChartComponent> {
  final List<_PieData> pieData = [
    _PieData('Maths', 10, 'Label 1'),
    _PieData('Mech', 45, 'Label 2'),
    _PieData('Design', 25, 'Label 3'),
  ];
  @override
  Widget  build(BuildContext context) {
 return Center(
   child: SfCircularChart(
   title: const ChartTitle(text: 'Semester Credits'),
   legend: const Legend(isVisible: true),
   series: <DoughnutSeries<_PieData, String>>[
     DoughnutSeries<_PieData, String>(
       explode: false,
       explodeIndex: 0,
       dataSource: pieData,
       xValueMapper: (_PieData data, _) => data.xData,
       yValueMapper: (_PieData data, _) => data.yData,
       dataLabelMapper: (_PieData data, _) => data.text,
       dataLabelSettings: const DataLabelSettings(isVisible: true)),
   ]
  )
 );
}
}

class _PieData {
 _PieData(this.xData, this.yData, [this.text]);
 final String xData;
 final num yData;
 String? text;
}
