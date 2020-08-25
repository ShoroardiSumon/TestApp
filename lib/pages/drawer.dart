import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:test_app/animation/animation.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/pages/hobby.dart';
import 'package:test_app/pages/login_page.dart';
import 'package:test_app/pages/toDoPage.dart';
import 'package:test_app/pages/vegitables.dart';
import 'package:test_app/utils/add_shared_preferences.dart';

AddSharedPreferences addSharedPreferences;

class DrawerView extends StatelessWidget {
  final String userName;
  final String userEmail;
  DrawerView(
    this.userName,
    this.userEmail,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        ResponsiveContainer(
          heightPercent: 23,
          widthPercent: 100,
          child: UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(),
          ),
        ),
        ResponsiveContainer(
          heightPercent: 77,
          widthPercent: 100,
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.account_box,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'My Account',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.subject,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Subjects',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.favorite_border,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Favourite',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AnimationHome()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.format_align_center,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Animation',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyHobby()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.local_florist,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Hobby',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.school,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Educational Background',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Vegitables()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.filter_vintage,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Vagitables',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ToDoPage()));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.accessible,
                    color: ColorCode.PrimaryColor,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'ToDo',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Setings',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showAlertDialog(context);
                },
                child: ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.black,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        child: CupertinoAlertDialog(
          title: Text("Log out?"),
          content: Text("Are you sure you want to log out?"),
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel")),
            CupertinoDialogAction(
                textStyle: TextStyle(color: Colors.red),
                isDefaultAction: true,
                onPressed: () async {
                  AddSharedPreferences addSharedPreferences =
                      new AddSharedPreferences();
                  addSharedPreferences.setisLoggedIn(false);

                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Log out")),
          ],
        ));
  }
}
