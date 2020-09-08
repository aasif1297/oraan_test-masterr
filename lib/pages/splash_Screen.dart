import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oraan_project/pages/login_Screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              height: 280,
              width: 280,
              child: Image.asset(
                'assets/images/splash_logo.png',
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Save money and money will save you",
                style: TextStyle(
                    fontSize: 20.0, fontFamily: 'achri', letterSpacing: 4, color: Colors.white),
              ),
            )
          ],
        ),
      )),
    );
  }
}
