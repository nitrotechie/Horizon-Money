import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/transaction_details.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({Key? key}) : super(key: key);
  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        String image = Services.transactions[index]["mode"];
        String transactionType = Services.transactions[index]["mode"];
        String transactionId = Services.transactions[index]["txnId"];
        String type = Services.transactions[index]["type"];
        var amount = Services.transactions[index]["amount"];
        // if (Services.transactions[index]["type"] == "CREDIT") {
        //   if (Services.transactions[index]["mode"] == "UPI") {
        //     double amt = double.parse(Services.transactions[index]["amount"]);
        //     PieData.upiAmountCr = PieData.upiAmountCr + amt;
        //     // print(PieData.upiAmountCr);
        //   } else if (Services.transactions[index]["mode"] == "FT") {
        //     double amt = double.parse(Services.transactions[index]["amount"]);
        //     PieData.ftAmountCr = PieData.ftAmountCr + amt;
        //     // print(PieData.ftAmountCr);
        //   } else if (Services.transactions[index]["mode"] == "OTHERS") {
        //     double amt = double.parse(Services.transactions[index]["amount"]);
        //     PieData.othersAmountCr = PieData.othersAmountCr + amt;
        //     // print(PieData.othersAmountCr);
        //   }
        // } else if (Services.transactions[index]["type"] == "CREDIT") {
        //   if (Services.transactions[index]["mode"] == "UPI") {
        //     double amt = double.parse(Services.transactions[index]["amount"]);
        //     PieData.upiAmountDr = PieData.upiAmountDr + amt;
        //   } else if (Services.transactions[index]["mode"] == "FT") {
        //     double amt = double.parse(Services.transactions[index]["amount"]);
        //     PieData.ftAmountDr = PieData.ftAmountDr + amt;
        //   } else if (Services.transactions[index]["mode"] == "OTHERS") {
        //     double amt = double.parse(Services.transactions[index]["amount"]);
        //     PieData.othersAmountDr = PieData.othersAmountDr + amt;
        //   }
        // }
        return GestureDetector(
          child: Container(
            height: 98,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: AppColors.neumorpShadow,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 16),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    // gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     AppColors.gradientColor1,
                    //     AppColors.gradientColor2,
                    //   ],
                    // ),
                  ),
                  child: Image.asset("assets/images/$image.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactionType,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transactionId,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 5,
                      ),
                      alignment: Alignment.centerRight,
                      child: type == "DEBIT"
                          ? const Text(
                              "-",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text(
                              "+",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 15,
                  ),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "₹ $amount",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Services.index = index;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TransactionDetail()));
          },
        );
      },
      shrinkWrap: true,
      itemCount: Services.transactions.length,
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
    );
  }
}
