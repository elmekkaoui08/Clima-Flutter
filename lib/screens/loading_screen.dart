import 'package:clima/blocs/login_bloc.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final bloc = LoginBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    //getData();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called !');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/login_2.jpg'),
                      fit: BoxFit.fill,
                    )),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 40,
                            ),
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.red[300],
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 40,
                                  color: Colors.red[200],
                                  child: Center(
                                    child: Text('Log In'),
                                  ),
                                ),
                                StreamBuilder(
                                  builder: (context, snapshot) =>
                                      costumTextField('Email Address', false),
                                  stream: bloc.email,
                                ),
                                StreamBuilder(
                                  builder: (context, snapshot) =>
                                      costumTextField('Password', true),
                                  stream: bloc.password,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Log In',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget costumTextField(String label, bool isObscure) => Container(
      width: 300,
      child: TextField(
        obscureText: isObscure,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade300),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            labelStyle: TextStyle(
              color: Colors.grey[500],
            ),
            labelText: label),
      ),
    );
