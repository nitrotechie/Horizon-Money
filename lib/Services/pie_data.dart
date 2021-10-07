import 'package:horizon_money_app/Services/services.dart';

class PieData {
  static double upiAmountCr = 0;
  static double ftAmountCr = 0;
  static double othersAmountCr = 0;
  static double upiAmountDr = 0;
  static double ftAmountDr = 0;
  static double othersAmountDr = 0;
  static double upiAmountCrPer = 0;
  static double ftAmountCrPer = 0;
  static double othersAmountCrPer = 0;
  static double upiAmountDrPer = 0;
  static double ftAmountDrPer = 0;
  static double othersAmountDrPer = 0;
  static double totalCr = 0;
  static double totalDr = 0;
  getPieData() {
    var i = 0;
    for (i = 0; i < Services.transactions.length; i++) {
      if (Services.transactions[i]["type"] == "CREDIT") {
        if (Services.transactions[i]["mode"] == "UPI") {
          double amt = double.parse(Services.transactions[i]["amount"]);
          upiAmountCr = upiAmountCr + amt;
        } else if (Services.transactions[i]["mode"] == "FT") {
          double amt1 = double.parse(Services.transactions[i]["amount"]);
          ftAmountCr = ftAmountCr + amt1;
        } else if (Services.transactions[i]["mode"] == "OTHERS") {
          double amt2 = double.parse(Services.transactions[i]["amount"]);
          othersAmountCr = othersAmountCr + amt2;
        }
      } else if (Services.transactions[i]["type"] == "DEBIT") {
        if (Services.transactions[i]["mode"] == "UPI") {
          double amt = double.parse(Services.transactions[i]["amount"]);
          upiAmountDr = upiAmountDr + amt;
        } else if (Services.transactions[i]["mode"] == "FT") {
          double amt3 = double.parse(Services.transactions[i]["amount"]);
          ftAmountDr = ftAmountDr + amt3;
        } else if (Services.transactions[i]["mode"] == "OTHERS") {
          double amt4 = double.parse(Services.transactions[i]["amount"]);
          othersAmountDr = othersAmountDr + amt4;
        }
      }
    }
    totalCr = (upiAmountCr + ftAmountCr + othersAmountCr);
    totalDr = upiAmountDr + ftAmountDr + othersAmountDr;
    upiAmountCrPer = (upiAmountCr / totalCr) * 100;
    ftAmountCrPer = (ftAmountCr / totalCr) * 100;
    othersAmountCrPer = (othersAmountCr / totalCr) * 100;
    upiAmountDrPer = (upiAmountDr / totalDr) * 100;
    ftAmountDrPer = (ftAmountDr / totalDr) * 100;
    othersAmountDrPer = (othersAmountDr / totalDr) * 100;
  }
}
