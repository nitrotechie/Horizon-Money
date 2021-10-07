// ignore_for_file: unused_field

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/analytics.dart';
import 'package:horizon_money_app/Screens/transactions.dart';
import 'package:horizon_money_app/Services/pie_data.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:horizon_money_app/Widgets/profile_widget.dart';
import 'package:horizon_money_app/Widgets/trasaction_card.dart';
import 'package:horizon_money_app/Widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentBalance =
      Services.finalData["account"]["summary"]["currentBalance"];
  String credit = PieData.totalCr.toStringAsFixed(2);
  String debit = PieData.totalDr.toStringAsFixed(2);
  Widgets w = Widgets();
  Services s = Services();
  // static List holderInformation =
  //     Services.finalData["account"]["profile"]["holder"];
  // String name = holderInformation[0]["name"];

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
    return Scaffold(
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
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "Welcome back,",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Text(
                  Services.name,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const Analytics()));
                },
                child: Stack(
                  children: [
                    Container(
                      height: 227,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            AppColors.gradientColor1,
                            AppColors.gradientColor2,
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 227,
                          width: 170,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 50,
                                ),
                                child: const Text(
                                  "Current Balance",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  bottom: 4,
                                  left: 15,
                                ),
                                child: Text(
                                  "₹ $currentBalance",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 4,
                                ),
                                child: const Text(
                                  "Total Credit ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  bottom: 4,
                                  left: 15,
                                ),
                                child: Text(
                                  "₹ $credit",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  left: 15,
                                  top: 4,
                                ),
                                child: const Text(
                                  "Total Debit ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                  bottom: 4,
                                  left: 15,
                                ),
                                child: Text(
                                  "₹ $debit",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 31,
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 100,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 149,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            color:
                                                Colors.white.withOpacity(0.3),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 130,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 149,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            color:
                                                Colors.white.withOpacity(0.2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 160,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 149,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            color:
                                                Colors.white.withOpacity(0.1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
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
              // Column(
              //   children: [
              //     w.transacationCard("assets/images/bag.png", "Salary",
              //         "Xyz Int Pvt", "285,681", true, context),
              //     w.transacationCard("assets/images/down.png", "To Harsh",
              //         "Money Sent", "821", false, context),
              //     w.transacationCard("assets/images/up.png", "From Anand",
              //         "Money Recieved", "1221", true, context),
              //     w.transacationCard("assets/images/netflix.png", "Netflix",
              //         "Money Sent", "800", false, context),
              //     w.transacationCard("assets/images/bag.png", "Salary",
              //         "Xyz Int Pvt", "285,681", true, context),
              //     w.transacationCard("assets/images/down.png", "To Harsh",
              //         "Money Sent", "821", false, context),
              //     w.transacationCard("assets/images/up.png", "From Anand",
              //         "Money Receieved", "1221", true, context),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
