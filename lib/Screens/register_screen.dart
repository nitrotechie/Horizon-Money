import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/home_screen.dart';
import 'package:horizon_money_app/Screens/login_screen.dart';
import 'package:horizon_money_app/Screens/segments.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';

import 'loading_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Services s = Services();
  final TextEditingController emailid = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  bool loadingScreen = false;
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController phone = TextEditingController();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
    }
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }),
        (route) => false);
  }

  moveToHome2(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }),
        (route) => false);
  }

  moveToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            }),
        (route) => false);
  }

  checkFields() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return loadingScreen == true
        ? const LoadingScreen()
        : Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: AppColors.gradientColor1,
                                    ),
                                  ),
                                  hintText: "Enter Phone Number",
                                  labelText: "Number"),
                              validator: (value) {
                                if (value == null || value.length <= 9) {
                                  return "Please Enter valid Phone Number";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailid,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                      color: AppColors.gradientColor1,
                                    ),
                                  ),
                                  hintText: "Enter Your Email Address",
                                  labelText: "Email Address"),
                              validator: (value) {
                                if (value == null) {
                                  return "Please Enter Your Email Address";
                                } else if (!RegExp(r'\S+@\S+\.\S+')
                                    .hasMatch(value)) {
                                  return "Please Enter A Valid Email Address";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _pass,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.gradientColor1,
                                  ),
                                ),
                                hintText: "Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Please Enter Password";
                                } else if (value.length < 8) {
                                  return "Please Enter Minimum Eight Characters Password";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _confirmPass,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.gradientColor1,
                                  ),
                                ),
                                hintText: "Enter Password",
                                labelText: "Confirm Password",
                              ),
                              validator: (value) {
                                if (value != _pass.text) {
                                  return "Password Not Match";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      AppColors.gradientColor1,
                                      AppColors.gradientColor2,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextButton(
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () async {
                                  if (checkFields()) {
                                    setState(() {
                                      loadingScreen = true;
                                    });
                                    final String password = _pass.text;
                                    final String phoneNumber = phone.text;
                                    final String email = emailid.text;
                                    await s.register(
                                        phoneNumber, password, email);
                                    if (Services.registerDone == true) {
                                      setState(() {
                                        loadingScreen = false;
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SegmentScreen()));
                                      });
                                    } else if (Services.regiterError == true) {
                                      setState(() {
                                        loadingScreen = false;
                                        final snackBar = SnackBar(
                                          content: const Text(
                                            "User Already Existed",
                                          ),
                                          action: SnackBarAction(
                                            label: "Ok",
                                            textColor:
                                                Theme.of(context).canvasColor,
                                            onPressed: () {},
                                          ),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      });
                                    } else {
                                      setState(() {
                                        loadingScreen = false;
                                      });
                                    }
                                  }
                                },
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                "I already have an account ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                moveToLogin(context);
                              },
                            ),
                            Divider(
                              color: AppColors.gradientColor1,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
