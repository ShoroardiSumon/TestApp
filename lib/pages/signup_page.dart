import 'package:flutter/material.dart';
import 'package:test_app/constants.dart';
import 'package:test_app/pages/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: <Widget>[
          NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    floating: false,
                    elevation: 0,
                    backgroundColor: Colors.grey.shade200,
                    automaticallyImplyLeading: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Please SignUp', style: TextStyle(color: Colors.black, fontSize: 25),),
                      centerTitle: true,
                    ),
                    actions: <Widget>[
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ColorCode.PrimaryColor,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Icon(Icons.card_travel,color: ColorCode.PrimaryColor,),
                          alignment: Alignment.center,
                        ),
                        onTap: (){

                        },
                      ),
                
                    ],
                  )
                ];
              },
              body: SingleChildScrollView(
                child: Container(
                  height: _height / 1,
                  width: _width / 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(55),
                        topRight: Radius.circular(55),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                color: ColorCode.PrimaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'To continue, you need to sign up',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: ColorCode.PrimaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: firstNameController,
                                  decoration: InputDecoration(
                                    labelText: 'First Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: ColorCode.PrimaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: lastNameController,
                                  decoration: InputDecoration(
                                    labelText: 'Last Name',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                color: ColorCode.PrimaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.lock_open,
                                color: ColorCode.PrimaryColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: passController,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Padding(
                            padding: EdgeInsets.all(0),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                    value: checkBoxValue,
                                    onChanged: (bool value){
                                      setState(() {
                                        checkBoxValue = value;
                                      });
                                    }
                                ),
                                Text('Remember me', style: TextStyle(color: Colors.grey, fontSize: 15,),),
                              ],
                            )
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: ColorCode.PrimaryColor,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SingleP()));
                              },
                            )),

                        const SizedBox(
                          height: 10,
                        ),

                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Already Have Account?',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    ' LOGIN',
                                    style: TextStyle(
                                        color: ColorCode.PrimaryColor, fontSize: 18),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
