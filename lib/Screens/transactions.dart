import 'package:flutter/material.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:horizon_money_app/Widgets/profile_widget.dart';
import 'package:horizon_money_app/Widgets/transaction_card_full.dart';
import 'package:horizon_money_app/Widgets/widgets.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  Widgets w = Widgets();
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
          ProfileWidget()
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 30,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: const Text(
                  "Transactions",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SingleChildScrollView(
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
              Container(
                margin: const EdgeInsets.only(
                  right: 30,
                  top: 30,
                ),
                child: const TransactionCardFull(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
