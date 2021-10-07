import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:horizon_money_app/Services/pie_data.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:horizon_money_app/Widgets/indicator.dart';

class PieChartExpenses extends StatefulWidget {
  const PieChartExpenses({Key? key}) : super(key: key);

  @override
  _PieChartExpensesState createState() => _PieChartExpensesState();
}

class _PieChartExpensesState extends State<PieChartExpenses> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Sectors",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Indicator(
                    color: AppColors.pieColors[0],
                    text: 'UPI',
                    value: PieData.upiAmountDrPer,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.pieColors[1],
                    text: 'FT',
                    value: PieData.ftAmountDrPer,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: AppColors.pieColors[2],
                    text: 'Others',
                    value: PieData.othersAmountDrPer,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                width: 80,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: PieChart(
                    PieChartData(
                        pieTouchData: PieTouchData(touchCallback:
                            (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 53,
                        sections: showingSections()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 20.0 : 15.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
              showTitle: false,
              color: AppColors.pieColors[0],
              value: PieData.upiAmountDrPer,
              // title: '40%',
              radius: radius,
              badgePositionPercentageOffset: -2.5,
              badgeWidget: isTouched
                  ? Container(
                      height: 34,
                      width: 130,
                      decoration: BoxDecoration(
                        boxShadow: AppColors.neumorpShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pieColors[0],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const Text(
                                      "  + ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      PieData.upiAmountDr.toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container());
        case 1:
          return PieChartSectionData(
              showTitle: false,
              color: AppColors.pieColors[1],
              value: PieData.ftAmountDrPer,
              // title: '30%',
              radius: radius,
              badgePositionPercentageOffset: -2.5,
              badgeWidget: isTouched
                  ? Container(
                      height: 34,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: AppColors.neumorpShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pieColors[1],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const Text(
                                      "  + ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      PieData.ftAmountDr.toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container());
        case 2:
          return PieChartSectionData(
              showTitle: false,
              color: AppColors.pieColors[2],
              value: PieData.othersAmountDrPer,
              // title: '15%',
              radius: radius,
              badgePositionPercentageOffset: -2.5,
              badgeWidget: isTouched
                  ? Container(
                      height: 34,
                      width: 150,
                      decoration: BoxDecoration(
                        boxShadow: AppColors.neumorpShadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pieColors[2],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const Text(
                                      "  + ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      PieData.othersAmountDr.toStringAsFixed(2),
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container());
        default:
          throw Error();
      }
    });
  }
}
