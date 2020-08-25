import 'package:flutter/material.dart';

class VegitableDetail extends StatefulWidget {
  final String name;
  final String photo;

  VegitableDetail({this.name, this.photo});

  @override
  _VegitableDetailState createState() => _VegitableDetailState();
}

class _VegitableDetailState extends State<VegitableDetail> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(children: <Widget>[
        Container(
          height: _height*.30,
          width: _width/1,
          child: Hero(
              tag: 'photo' + widget.photo,
              child: Image(
                image: AssetImage(widget.photo),
                fit: BoxFit.cover,
              )),
        ),
      ]),
    ));
  }
}
