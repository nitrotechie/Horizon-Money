import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/pie_chart_income.dart';
import 'package:horizon_money_app/Screens/pie_chart_expense.dart';
import 'package:horizon_money_app/Screens/transactions.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:horizon_money_app/Widgets/profile_widget.dart';
import 'package:horizon_money_app/Widgets/trasaction_card.dart';
import 'package:horizon_money_app/Widgets/widgets.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  Widgets w = Widgets();
  List<Widget> widgets = [const IncomeWidget(), const ExpensesWidget()];
  List<Widget> pieChart = [const PieChartIncome(), const PieChartExpenses()];
  List<String> labels = ["Income", "Expense"];
  int counter = 0;
  moveToTransactions(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Transactions(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: AppColors.canvasColor,
          leading: Builder(builder: (context) {
            return Container(
              margin: const EdgeInsets.only(left: 20),
              child: IconButton(
                color: Colors.black,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                iconSize: 35,
              ),
            );
          }),
          actions: const [
            ProfileWidget(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  left: 30,
                  top: 10,
                  bottom: 20,
                ),
                child: const Text(
                  "Analytics",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      w.atmCard(
                        "SBI Bank",
                        "2145-4578-1245-1245",
                        "Aditya",
                        "28/2020",
                        context,
                        const Color(0xFF3764B8),
                        const Color(0xFF47D3E7),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      w.atmCard(
                        "Bank of Baroda",
                        "2145-4578-1245-1245",
                        "Aditya",
                        "28/2020",
                        context,
                        const Color(0xFFF0A038),
                        const Color(0xFFDF271A),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 17,
                  left: 30,
                  right: 30,
                  bottom: 17,
                ),
                height: 62,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: AppColors.neumorpShadow,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          AppColors.gradientColor1,
                          AppColors.gradientColor2,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    tabs: const [
                      Tab(
                        text: "Income",
                      ),
                      Tab(
                        text: "Expenses",
                      )
                    ],
                    onTap: (index) {
                      setState(() {
                        counter = index;
                      });
                    },
                  ),
                ),
              ),
              widgets[counter],
              Container(
                width: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(
                  top: 40,
                  right: 30,
                  left: 30,
                ),
                child: Column(
                  children: [
                    pieChart[counter],
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Recent Transaction",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                moveToTransactions(context);
                              },
                              child: const Text(
                                "See all",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const TransactionCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
