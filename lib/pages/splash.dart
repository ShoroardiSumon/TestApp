import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/pages/home_page.dart';
import 'package:test_app/utils/add_shared_preferences.dart';
import 'package:test_app/pages/login_page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  AddSharedPreferences addSharedPreferences;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            color: Colors.white,
            child: Text(
              'Getting Started',
              style: TextStyle(color: Colors.green, fontSize: 40),
            ),
            onPressed: () {
              //checkIsLoggedIn();
            }),
      ),
    );
  }

  // void checkIsLoggedIn() async {
  //   AddSharedPreferences addSharedPreferences = new AddSharedPreferences();
  //   bool isLoggedIn = await addSharedPreferences.getisLoggedIn();

  //   if (isLoggedIn == true) {
      
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => LoginPage()));
  //   }
  // }
}
