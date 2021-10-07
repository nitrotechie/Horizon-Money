import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/login_screen.dart';
import 'package:horizon_money_app/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Open Sans",
          iconTheme: const IconThemeData(color: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/login': (BuildContext context) => const LoginScreen(),
      },
    );
  }
}
