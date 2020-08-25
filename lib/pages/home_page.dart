import 'package:flutter/material.dart';
import 'package:test_app/model/getUser.dart';
import 'package:test_app/pages/drawer.dart';
import 'package:test_app/pages/user_detail_page.dart';
import 'package:test_app/utils/add_shared_preferences.dart';
import 'package:test_app/utils/rest_data_source.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestDataSource restDataSource;
  AddSharedPreferences addSharedPreferences;
  String _userName = '';
  String _userEmail = '';

  static final GET_URL = "https://jsonplaceholder.typicode.com/users";
  List<GetUser> _listGetUser;
  List<GetUser> getUserFromJson(String str) =>
      List<GetUser>.from(json.decode(str).map((x) => GetUser.fromJson(x)));

  Future<String> getData() async {
    var response = await http
        .get(Uri.encodeFull(GET_URL), headers: {"Accept": "application/json"});

    _listGetUser = getUserFromJson(response.body.toString());

    print(_listGetUser.length);
    return "Success!";
  }

  Future<bool> _oneWillPop() async {
    return false;
  }

  @override
  void initState() {
    super.initState();
    AddSharedPreferences addSharedPreferences = new AddSharedPreferences();
    addSharedPreferences.getName().then(updateName);
    addSharedPreferences.getEmail().then(updateEmail);

    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _oneWillPop,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
            centerTitle: true,
          ),
          drawer: DrawerView(_userName, _userEmail),
          body: Center(
            child: FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: _listGetUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Hero(
                          tag: 'avatar' + _listGetUser[index].name,
                          child: CircleAvatar(
                            child: Text(_listGetUser[index].name[0]),
                          ),
                        ),
                        title: Text(_listGetUser[index].name),
                        subtitle: Text(_listGetUser[index].email),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              fullscreenDialog: true,
                              transitionDuration: Duration(milliseconds: 700),
                              pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) =>
                                  UserDetailPage(
                                name: _listGetUser[index].name,
                                email: _listGetUser[index].email,
                                phone: _listGetUser[index].phone,
                                addressCity: _listGetUser[index].address.city,
                                companyName: _listGetUser[index].company.name,
                                website: _listGetUser[index].website,
                              ),
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          )),
    );
  }

  void updateName(String userName) {
    setState(() {
      this._userName = userName;
    });
  }

  void updateEmail(String userEmail) {
    setState(() {
      this._userEmail = userEmail;
    });
  }
}
