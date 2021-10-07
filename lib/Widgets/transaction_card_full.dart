import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/transaction_details.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';

class TransactionCardFull extends StatefulWidget {
  const TransactionCardFull({Key? key}) : super(key: key);
  @override
  _TransactionCardFullState createState() => _TransactionCardFullState();
}

class _TransactionCardFullState extends State<TransactionCardFull> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        String image = Services.transactions[index]["mode"];
        String transactionType = Services.transactions[index]["mode"];
        String transactionId = Services.transactions[index]["txnId"];
        String type = Services.transactions[index]["type"];
        var amount = Services.transactions[index]["amount"];
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
