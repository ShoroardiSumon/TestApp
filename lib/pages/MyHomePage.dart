import 'package:flutter/material.dart';
//import 'dart:async';
import 'package:http/http.dart';
import 'package:test_app/model/userModel.dart';
//import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  UserModel _user;

  // Future<UserModel> makePostRequest() async {
  //   String url = "http://172.104.35.221:8088/api/login/examiner";

  //   Map<String, String> headers = {"Content-type": "application/json"};
  //   String json = '{"email":' + '"'+email+'"' +','+'"password":' + '"'+password+'"'+'}';

  //   Response response = await post(url, headers: headers, body: json);

  //   int statusCode = response.statusCode;
  //   print(statusCode);
  //   String res = response.body;
  //   print(res);
  //   return userModelFromJson(res);
  // }

   _makePostRequest(String email, String password) async {
    String url = "http://172.104.35.221:8088/api/login/examiner";

    Map<String, String> headers = {"Content-type": "application/json"};
    //String json = '{"email":"13050","password":"123456"}';
    String json = '{"email":' + '"'+email+'"' +','+'"password":' + '"'+password+'"'+'}';
    print(json);

    Response response = await post(url, headers: headers, body: json);

    int statusCode = response.statusCode;
    print(statusCode);
    String res = response.body;
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    //_makePostRequest();
    return Scaffold(
      appBar: AppBar(
        title: Text('POST JSON'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailcontroller,
            ),
            TextField(
              controller: passcontroller,
            ),
            const SizedBox(
              height: 30,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                   String email = emailcontroller.text;
                   String password = passcontroller.text;

                   var user = await _makePostRequest(email, password);
                  // print(user);
                  // setState(() {
                  //   _user = user;
                  // });
                }),
            const SizedBox(
              height: 30,
            ),

           // _user == null? Container(): Text('Your Name is ${_user.user.name}'),

          ],
        ),
      ),
    );
  }
}
