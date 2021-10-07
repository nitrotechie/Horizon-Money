import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:number_to_words/number_to_words.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({Key? key}) : super(key: key);

  @override
  _TransactionDetailState createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  String image = Services.transactions[Services.index]["mode"];
  String mode = Services.transactions[Services.index]["mode"];
  String txnId = Services.transactions[Services.index]["txnId"];
  String refId = Services.transactions[Services.index]["reference"];
  String type = Services.transactions[Services.index]["type"];
  var amount = Services.transactions[Services.index]["amount"];
  var balance = Services.transactions[Services.index]["currentBalance"];
  String time = Services.transactions[Services.index]["transactionTimestamp"];
  String accNo = Services.finalData["account"]["maskedAccNumber"];
  var ifscCode = Services.finalData["account"]["summary"]["ifscCode"];
  String amountWords = NumberToWord().convert(
    'en-in',
    double.parse(
      Services.transactions[Services.index]["amount"],
    ).round(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaction Details",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.canvasColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      backgroundColor: AppColors.canvasColor,
      body: Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: AppColors.neumorpShadow,
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: type == "DEBIT" ? Colors.red : Colors.green,
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  boxShadow: AppColors.neumorpShadow,
                ),
                child: Text(
                  type == "DEBIT" ? "Debited" : "Credited",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 10, bottom: 10, right: 15),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "₹ $amount",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: 48,
                            width: 48,
                            child: Image.asset("assets/images/$image.png"),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      amountWords.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 10, bottom: 10, right: 15),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    type == "DEBIT"
                        ? const Text(
                            "From Your",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            "To Your",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Text(
                        ifscCode,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          "Account Number : ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          accNo,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Transaction ID : ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          txnId,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Reference ID : ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          refId,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Mode : ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          mode,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          type == "DEBIT" ? "Debited at : " : "Credited at : ",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Closing Balance : ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          balance,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
