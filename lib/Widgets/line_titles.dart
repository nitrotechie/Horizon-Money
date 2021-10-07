import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 34,
          getTextStyles: (context, value) => const TextStyle(
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'Mon';
              case 3:
                return 'Tue';
              case 5:
                return 'Wed';
              case 7:
                return 'Thu';
              case 9:
                return 'Fri';
              case 11:
                return 'Sat';
              case 13:
                return 'Sun';
            }
            return '';
          },
          margin: 5,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 2:
                return '30k';
              case 3:
                return '50k';
              case 4:
                return '70k';
              case 5:
                return '80k';
            }
            return '';
          },
          reservedSize: 4,
          margin: 1,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );
}
