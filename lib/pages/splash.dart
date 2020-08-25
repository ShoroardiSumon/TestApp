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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            color: ColorCode.PrimaryColor,
            child: Text(
              'Get Started',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            onPressed: () {
              checkIsLoggedIn();
            }),
      ),
    );
  }

  void checkIsLoggedIn()async{
    AddSharedPreferences addSharedPreferences = new AddSharedPreferences();
    bool isLoggedIn = await addSharedPreferences.getisLoggedIn();

    if(isLoggedIn == true){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }
    else{
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
