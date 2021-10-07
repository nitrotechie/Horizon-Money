import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_titles.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff47D3E7),
    const Color(0xffffffff),
  ];
  final List<Color> color = [
    const Color(0xff47D3E7),
  ];

  LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: -0.15,
          maxX: 15,
          minY: 0,
          maxY: 8,
          axisTitleData: FlAxisTitleData(
            show: false,
          ),
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 0,
              );
            },
          ),
          borderData: FlBorderData(
            show: false,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 0),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 2.5),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
                FlSpot(15, 4),
              ],
              isCurved: true,
              colors: color,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
