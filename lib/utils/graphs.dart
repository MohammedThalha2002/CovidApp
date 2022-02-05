import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class graphs extends StatelessWidget {
  final points;
  const graphs({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 5,
      child: LineChart(
        LineChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: points,
                isCurved: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                colors: [Colors.black],
                barWidth: 2,
              ),
            ]),
      ),
    );
  }
}

