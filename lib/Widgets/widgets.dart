import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/analytics.dart';
import 'package:horizon_money_app/Screens/home_screen.dart';
import 'package:horizon_money_app/Screens/line_chart_page.dart';
import 'package:horizon_money_app/Screens/profile.dart';
import 'package:horizon_money_app/Screens/transactions.dart';
import 'package:horizon_money_app/Utils/colors.dart';

class Widgets {
  Widget menu() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        alignment: Alignment.topLeft,
        width: 225,
        height: 435,
        color: Colors.white,
      ),
    );
  }

  Widget profileMenu() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        alignment: Alignment.topLeft,
        width: 225,
        height: 435,
        color: Colors.white,
      ),
    );
  }

  Widget customSwitch(String text, bool val, Function onChangedMethod) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 5, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: CupertinoSwitch(
                trackColor: Colors.grey,
                activeColor: AppColors.gradientColor1,
                value: val,
                onChanged: (newValue) {
                  onChangedMethod(newValue);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget atmCard(
    String bankName,
    String cardNumber,
    String name,
    String expiryDate,
    BuildContext context,
    Color color1,
    Color color2,
  ) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                color1,
                color2,
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 60,
              sigmaY: 60,
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              height: 190,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Image(
                      image: AssetImage(
                        "assets/images/mastercard.png",
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      top: 22,
                      bottom: 10,
                    ),
                    child: Text(
                      bankName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      bottom: 65,
                    ),
                    child: Text(
                      cardNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "CARD HOLDER",
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Expiry Date",
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            Text(
                              expiryDate,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        "assets/images/wifi.png",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget weekChart() {
    return const SizedBox(
      height: 249,
      width: 433,
      child: LineChartPage(),
    );
  }

  static Widget monthChart() {
    return const SizedBox(
      height: 249,
      width: 433,
      child: LineChartPage(),
    );
  }

  static Widget yearChart() {
    return const SizedBox(
      height: 249,
      width: 433,
      child: LineChartPage(),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  moveToHome(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
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

  moveToAnalytics(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Analytics(),
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

  moveToProfile(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ProfilePage(),
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

  moveToWelcome(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: 225,
            height: 435,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 55,
                bottom: 52,
                left: 20,
                right: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      iconSize: 35,
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          child: const Text(
                            "Home",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            moveToHome(context);
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Analytics",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            moveToAnalytics(context);
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Transactions",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            moveToTransactions(context);
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            moveToProfile(context);
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class IncomeWidget extends StatefulWidget {
  const IncomeWidget({Key? key}) : super(key: key);

  @override
  _IncomeWidgetState createState() => _IncomeWidgetState();
}

class _IncomeWidgetState extends State<IncomeWidget> {
  List<Widget> widgets = [
    Widgets.weekChart(),
    Widgets.monthChart(),
    Widgets.yearChart()
  ];
  List<String> labels = ["Income", "Expense"];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: AppColors.gradientColor1,
                labelStyle: const TextStyle(
                  fontSize: 14,
                ),
                indicatorColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: "Week",
                  ),
                  Tab(
                    text: "Month",
                  ),
                  Tab(
                    text: "Year",
                  ),
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
        ],
      ),
    );
  }
}

class ExpensesWidget extends StatefulWidget {
  const ExpensesWidget({Key? key}) : super(key: key);

  @override
  _ExpensesWidgetState createState() => _ExpensesWidgetState();
}

class _ExpensesWidgetState extends State<ExpensesWidget> {
  Widgets w = Widgets();
  List<Widget> widgets = [
    Widgets.weekChart(),
    Widgets.monthChart(),
    Widgets.yearChart()
  ];
  List<String> labels = ["Income", "Expense"];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width / 1.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: AppColors.gradientColor1,
                labelStyle: const TextStyle(
                  fontSize: 14,
                ),
                indicatorColor: Colors.transparent,
                tabs: const [
                  Tab(
                    text: "Week",
                  ),
                  Tab(
                    text: "Month",
                  ),
                  Tab(
                    text: "Year",
                  ),
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
        ],
      ),
    );
  }
}
