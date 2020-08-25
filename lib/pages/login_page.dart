import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/model/userModel.dart';
import 'package:test_app/pages/home_page.dart';
import 'package:test_app/pages/signup_page.dart';
import 'package:test_app/pages/vegitables.dart';
import 'package:test_app/utils/add_shared_preferences.dart';
import 'package:test_app/utils/rest_data_source.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  RestDataSource restDataSource = new RestDataSource();
  AddSharedPreferences addSharedPreferences;
  UserModel _user;

  Future<bool> _oneWillPop() async {
    return false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _oneWillPop,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  'Please enter your Email and Password',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: passcontroller,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: ColorCode.PrimaryColor,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 15, 8, 15),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  onPressed: () async {
                    String email = emailcontroller.text;
                    String password = passcontroller.text;

                    var userModel = await restDataSource.login(email, password);
                    _user = new UserModel.fromJson(userModel);

                    AddSharedPreferences addSharedPreferences =
                        new AddSharedPreferences();
                    addSharedPreferences.setName(_user.user.name);
                    addSharedPreferences.setEmail(_user.user.email);
                    addSharedPreferences.setisLoggedIn(true);
                    bool isLoggedIn =
                        await addSharedPreferences.getisLoggedIn();

                    isLoggedIn == true
                        ? Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage()))
                        : LoginPage();
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have Account?   ",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  InkWell(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 20, color: ColorCode.PrimaryColor),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                  color: ColorCode.PrimaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Vegitables',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Vegitables()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
