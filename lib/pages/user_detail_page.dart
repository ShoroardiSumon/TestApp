import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class UserDetailPage extends StatefulWidget {
  UserDetailPage(
      {this.name,
      this.email,
      this.phone,
      this.addressCity,
      this.companyName,
      this.website});

  final String addressCity;
  final String companyName;
  final String email;
  final String name;
  final String phone;
  final String website;

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                color: Colors.transparent,
                padding: const EdgeInsets.only(top: 20),
                height: _height * 0.33,
                width: _width * 1,
                child: Hero(
                  tag: 'avatar' + widget.name,
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child: Text(
                      widget.name[0],
                      style: TextStyle(fontSize: 100, color: Colors.white),
                    ),
                  ),
                )),
            buildBottomProfileDetail(context),
          ],
        ));
  }

  Widget buildBottomProfileDetail(context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 200),
      slidingBeginOffset: const Offset(0, 1),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.greenAccent,
            ),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Name:',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Email:',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  widget.email,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Phone:',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  widget.phone,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Website:',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  widget.website,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Company:',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  widget.companyName,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Address:',
                  style: TextStyle(fontSize: 22),
                ),
                Text(
                  widget.addressCity,
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
