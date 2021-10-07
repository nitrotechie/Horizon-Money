import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/consent_webview.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:horizon_money_app/Widgets/widgets.dart';

class SegmentScreen extends StatefulWidget {
  const SegmentScreen({Key? key}) : super(key: key);

  @override
  _SegmentScreenState createState() => _SegmentScreenState();
}

class _SegmentScreenState extends State<SegmentScreen> {
  Widgets w = Widgets();
  Services s = Services();
  bool val1_1 = false;
  onChangedMethod1_1(bool newValue1_1) {
    setState(() {
      val1_1 = newValue1_1;
      if (val1_1) {
        Services.scopes.add("DEPOSIT");
      } else {
        Services.scopes.remove("DEPOSIT");
      }
    });
  }

  bool val1_2 = false;
  onChangedMethod1_2(bool newValue1_2) {
    setState(() {
      val1_2 = newValue1_2;
      if (val1_2) {
        Services.scopes.add("TERM_DEPOSIT");
      } else {
        Services.scopes.remove("TERM_DEPOSIT");
      }
    });
  }

  bool val1_3 = false;
  onChangedMethod1_3(bool newValue1_3) {
    setState(() {
      val1_3 = newValue1_3;
      if (val1_3) {
        Services.scopes.add("RECURRING_DEPOSIT");
      } else {
        Services.scopes.remove("RECURRING_DEPOSIT");
      }
    });
  }

  bool val1_4 = false;
  onChangedMethod1_4(bool newValue1_4) {
    setState(() {
      val1_4 = newValue1_4;
      if (val1_4) {
        Services.scopes.add("CREDIT_CARD");
      } else {
        Services.scopes.remove("CREDIT_CARD");
      }
    });
  }

  bool val1_5 = false;
  onChangedMethod1_5(bool newValue1_5) {
    setState(() {
      val1_5 = newValue1_5;
      if (val1_5) {
        Services.scopes.add("CD");
      } else {
        Services.scopes.remove("CD");
      }
    });
  }

  bool val1_6 = false;
  onChangedMethod1_6(bool newValue1_6) {
    setState(() {
      val1_6 = newValue1_6;
      if (val1_6) {
        Services.scopes.add("IDR");
      } else {
        Services.scopes.remove("IDR");
      }
    });
  }

  bool val2_1 = false;
  onChangedMethod2_1(bool newValue2_1) {
    setState(() {
      val2_1 = newValue2_1;
      if (val2_1) {
        Services.scopes.add("INSURANCE_POLICIES");
      } else {
        Services.scopes.remove("INSURANCE_POLICIES");
      }
    });
  }

  bool val2_2 = false;
  onChangedMethod2_2(bool newValue2_2) {
    setState(() {
      val2_2 = newValue2_2;
      if (val2_2) {
        Services.scopes.add("ULIP");
      } else {
        Services.scopes.remove("ULIP");
      }
    });
  }

  bool val3_1 = false;
  onChangedMethod3_1(bool newValue3_1) {
    setState(() {
      val3_1 = newValue3_1;
      if (val3_1) {
        Services.scopes.add("EPF");
      } else {
        Services.scopes.remove("EPF");
      }
    });
  }

  bool val3_2 = false;
  onChangedMethod3_2(bool newValue3_2) {
    setState(() {
      val3_2 = newValue3_2;
      if (val3_2) {
        Services.scopes.add("PPF");
      } else {
        Services.scopes.remove("PPF");
      }
    });
  }

  bool val4_1 = false;
  onChangedMethod4_1(bool newValue4_1) {
    setState(() {
      val4_1 = newValue4_1;
      if (val4_1) {
        Services.scopes.add("MUTUAL_FUNDS");
      } else {
        Services.scopes.remove("MUTUAL_FUNDS");
      }
    });
  }

  bool val4_2 = false;
  onChangedMethod4_2(bool newValue4_2) {
    setState(() {
      val4_2 = newValue4_2;
      if (val4_2) {
        Services.scopes.add("BONDS");
      } else {
        Services.scopes.remove("BONDS");
      }
    });
  }

  bool val4_3 = false;
  onChangedMethod4_3(bool newValue4_3) {
    setState(() {
      val4_3 = newValue4_3;
      if (val4_3) {
        Services.scopes.add("DEBENTURES");
      } else {
        Services.scopes.remove("DEBENTURES");
      }
    });
  }

  bool val4_4 = false;
  onChangedMethod4_4(bool newValue4_4) {
    setState(() {
      val4_4 = newValue4_4;
      if (val4_4) {
        Services.scopes.add("ETF");
      } else {
        Services.scopes.remove("ETF");
      }
    });
  }

  bool val4_5 = false;
  onChangedMethod4_5(bool newValue4_5) {
    setState(() {
      val4_5 = newValue4_5;
      if (val4_5) {
        Services.scopes.add("NPS");
      } else {
        Services.scopes.remove("NPS");
      }
    });
  }

  bool val4_6 = false;
  onChangedMethod4_6(bool newValue4_6) {
    setState(() {
      val4_6 = newValue4_6;
      if (val4_6) {
        Services.scopes.add("GOVT_SECURITIES");
      } else {
        Services.scopes.remove("GOVT_SECURITIES");
      }
    });
  }

  bool val4_7 = false;
  onChangedMethod4_7(bool newValue4_7) {
    setState(() {
      val4_7 = newValue4_7;
      if (val4_7) {
        Services.scopes.add("CP");
      } else {
        Services.scopes.remove("CP");
      }
    });
  }

  bool val4_8 = false;
  onChangedMethod4_8(bool newValue4_8) {
    setState(() {
      val4_8 = newValue4_8;
      if (val4_8) {
        Services.scopes.add("REIT");
      } else {
        Services.scopes.remove("REIT");
      }
    });
  }

  bool val4_9 = false;
  onChangedMethod4_9(bool newValue4_9) {
    setState(() {
      val4_9 = newValue4_9;
      if (val4_9) {
        Services.scopes.add("INVIT");
      } else {
        Services.scopes.remove("INVIT");
      }
    });
  }

  bool val4_10 = false;
  onChangedMethod4_10(bool newValue4_10) {
    setState(() {
      val4_10 = newValue4_10;
      if (val4_10) {
        Services.scopes.add("AIF");
      } else {
        Services.scopes.remove("AIF");
      }
    });
  }

  bool val4_11 = false;
  onChangedMethod4_11(bool newValue4_11) {
    setState(() {
      val4_11 = newValue4_11;
      if (val4_11) {
        Services.scopes.add("SIP");
      } else {
        Services.scopes.remove("SIP");
      }
    });
  }

  bool val4_12 = false;
  onChangedMethod4_12(bool newValue4_12) {
    setState(() {
      val4_12 = newValue4_12;
      if (val4_12) {
        Services.scopes.add("EQUITIES");
      } else {
        Services.scopes.remove("EQUITIES");
      }
    });
  }

  bool val4_13 = false;
  onChangedMethod4_13(bool newValue4_13) {
    setState(() {
      val4_13 = newValue4_13;
      if (val4_13) {
        Services.scopes.add("CIS");
      } else {
        Services.scopes.remove("CIS");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    final snackBar = SnackBar(
                      content: const Text(
                        "Please Select atleast one segment.",
                      ),
                      action: SnackBarAction(
                        label: "Ok",
                        textColor: Theme.of(context).canvasColor,
                        onPressed: () {},
                      ),
                    );

                    Services.scopes.isEmpty == false
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ConsentWebview()))
                        : ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.gradientColor1,
                          AppColors.gradientColor2,
                        ],
                      ),
                      boxShadow: AppColors.neumorpShadow,
                    ),
                    height: 40,
                    width: 150,
                    child: const Center(
                        child: Text(
                      "Proceed",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select Segments ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientColor1,
                      AppColors.gradientColor2,
                    ],
                  ),
                  boxShadow: AppColors.neumorpShadow,
                ),
                child: ExpansionTile(
                  title: const Text(
                    "Banks",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    w.customSwitch("Deposits", val1_1, onChangedMethod1_1),
                    w.customSwitch("Term Deposits", val1_2, onChangedMethod1_2),
                    w.customSwitch(
                        "Recurring Deposits", val1_3, onChangedMethod1_3),
                    w.customSwitch("Credit Card", val1_4, onChangedMethod1_4),
                    w.customSwitch(
                        "Certificates of Deposit", val1_5, onChangedMethod1_5),
                    w.customSwitch("Indian Depository Receipts", val1_6,
                        onChangedMethod1_6),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientColor1,
                      AppColors.gradientColor2,
                    ],
                  ),
                  boxShadow: AppColors.neumorpShadow,
                ),
                child: ExpansionTile(
                  title: const Text(
                    "Insurance",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    w.customSwitch(
                        "Insurance Policies", val2_1, onChangedMethod2_1),
                    w.customSwitch("Unit Linked Insurance Plan", val2_2,
                        onChangedMethod2_2),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientColor1,
                      AppColors.gradientColor2,
                    ],
                  ),
                  boxShadow: AppColors.neumorpShadow,
                ),
                child: ExpansionTile(
                  title: const Text(
                    "Pension",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    w.customSwitch(
                        "Eployee Provident Fund", val3_1, onChangedMethod3_1),
                    w.customSwitch(
                        "Public Provident Fund", val3_2, onChangedMethod3_2),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.gradientColor1,
                      AppColors.gradientColor2,
                    ],
                  ),
                  boxShadow: AppColors.neumorpShadow,
                ),
                child: ExpansionTile(
                  title: const Text(
                    "Investments",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    w.customSwitch("Mutual Funds", val4_1, onChangedMethod4_1),
                    w.customSwitch("Bonds", val4_2, onChangedMethod4_2),
                    w.customSwitch("Debentures", val4_3, onChangedMethod4_3),
                    w.customSwitch(
                        "Exchange Traded Funds", val4_4, onChangedMethod4_4),
                    w.customSwitch(
                        "National Pension System", val4_5, onChangedMethod4_5),
                    w.customSwitch(
                        "Government Securities", val4_6, onChangedMethod4_6),
                    w.customSwitch(
                        "Commercial Paper", val4_7, onChangedMethod4_7),
                    w.customSwitch("Real Estate Investment Trust", val4_8,
                        onChangedMethod4_8),
                    w.customSwitch("Infrastructure Investment Trust", val4_9,
                        onChangedMethod4_9),
                    w.customSwitch("Alternative Investment Funds", val4_10,
                        onChangedMethod4_10),
                    w.customSwitch("Systematic Investment Plan", val4_11,
                        onChangedMethod4_11),
                    w.customSwitch(
                        "Equity Shares", val4_12, onChangedMethod4_12),
                    w.customSwitch("Collective Investment Schemes", val4_13,
                        onChangedMethod4_13),
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
