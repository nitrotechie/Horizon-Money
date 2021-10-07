import 'dart:async';
import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/home_screen.dart';
import 'package:horizon_money_app/Screens/login_screen.dart';
import 'package:horizon_money_app/Screens/register_screen.dart';
import 'package:horizon_money_app/Services/pie_data.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Services s = Services();
  PieData p = PieData();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      checkFirstSeen();
      s.getData();
      s.initDynamicLinks(context);
    });
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    bool _logIn = (prefs.getBool('ISLOGGEDIN') ?? true);
    await p.getPieData();
    await s.getReturnUrl();

    if (_seen) {
      if (_logIn) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const RegisterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.canvasColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            const Center(
              child: Text(
                "horizon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
