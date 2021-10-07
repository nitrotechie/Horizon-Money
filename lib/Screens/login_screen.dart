import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizon_money_app/Screens/home_screen.dart';
import 'package:horizon_money_app/Screens/loading_screen.dart';
import 'package:horizon_money_app/Screens/register_screen.dart';
import 'package:horizon_money_app/Services/services.dart';
import 'package:horizon_money_app/Utils/colors.dart';
import 'package:horizon_money_app/Utils/helper_function.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Services s = Services();
  final TextEditingController emailEdittingController = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool changeButton = false;
  bool loadingScreen = false;
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

  moveToRegister(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const RegisterScreen(),
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Text(
                          "Welcome To",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          "Horizon Money",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailEdittingController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.gradientColor1,
                                  ),
                                ),
                                hintText: "Enter a username",
                                labelText: "Username",
                                icon: const Icon(
                                    CupertinoIcons.person_crop_circle),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter a username";
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: AppColors.gradientColor1,
                                  ),
                                ),
                                hintText: "Enter Password",
                                labelText: "Password",
                                icon: const Icon(CupertinoIcons.lock_circle),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Password";
                                } else if (value.length < 8) {
                                  return "Please Enter Minimum Eight Characters Password";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
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
                                    "Login",
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
                                      final username =
                                          emailEdittingController.text;
                                      final password = _pass.text;
                                      await s.login(username, password);
                                      if (Services.loginDone == true) {
                                        setState(() {
                                          HelperFunctions
                                              .saveUserLoggedInSharedPreference(
                                                  true);
                                          loadingScreen = false;
                                        });
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomeScreen()));
                                      } else if (Services.loginErorr == true) {
                                        setState(() {
                                          loadingScreen = false;
                                        });
                                        final snackBar = SnackBar(
                                          content: const Text(
                                            "Something Went Wrong!! Please Try Again",
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
                                      }
                                    }
                                  }),
                            ),
                            TextButton(
                              child: const Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                moveToRegister(context);
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
