import 'package:flutter/material.dart';
import 'package:horizon_money_app/Widgets/line_chart_widget.dart';

class LineChartPage extends StatelessWidget {
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 246.9, width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: LineChartWidget(),
    ),
  );
}
