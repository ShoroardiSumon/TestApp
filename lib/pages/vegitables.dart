import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/constants.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:test_app/model/vegModelEx.dart';
// import 'package:test_app/model/veg_model.dart';
import 'package:test_app/pages/pro_data_EX.dart';
import 'package:test_app/pages/veg_detail.dart';

class Vegitables extends StatefulWidget {
  @override
  _VegitablesState createState() => _VegitablesState();
}

class _VegitablesState extends State<Vegitables> {
  // List<VegModel> _veglist;

  // Future<String> loadJsonData() async {
  //   var response = await rootBundle.loadString('assets/data.json');
  //   _veglist = vegModelFromJson(response);

  //   print(_veglist.length);
  //   return 'success';
  // }

  @override
  void initState() {
    super.initState();
    //this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    final _providerdata = Provider.of<ProData>(context);
    _providerdata.fetchData();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
              ),
            ],
            expandedHeight: 200,
            pinned: true,
            floating: false,
            automaticallyImplyLeading: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _providerdata.value,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              centerTitle: true,

              //background: Image.asset(ImageStore.broccoli, fit: BoxFit.cover,),
            ),
          ),
          SliverFillRemaining(
              child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.grey.shade200,
            child: FutureBuilder(
              future: _providerdata.fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: _providerdata.vegModelEx.data.vagitables.length,
                    itemBuilder: (context, index) => Container(
                      height: index.isEven ? 250 : 350,
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            fullscreenDialog: true,
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                    Animation<double> animation,
                                    Animation<double> secondaryanimation) =>
                                VegitableDetail(
                              // name: _veglist[index].name,
                              // photo: _veglist[index].photo,
                              name: _providerdata
                                  .vegModelEx.data.vagitables[index].name,
                              photo: _providerdata
                                  .vegModelEx.data.vagitables[index].photo,
                            ),
                            transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) =>
                                FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Hero(
                                // tag: 'photo' + _veglist[index].photo,
                                tag: 'photo' +
                                    _providerdata.vegModelEx.data
                                        .vagitables[index].photo,
                                child: Container(
                                  height: index.isEven ? 200 : 300,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        // _veglist[index].photo,
                                        _providerdata.vegModelEx.data
                                            .vagitables[index].photo,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                      // _veglist[index].name,
                                      _providerdata.vegModelEx.data
                                          .vagitables[index].name,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: ColorCode.PrimaryColor,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(1),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
          )),
        ],
      ),
    );
  }

  // void _vegCard(String name, String photo){

  // }

}
