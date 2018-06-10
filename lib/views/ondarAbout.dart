import 'package:flutter/material.dart';

class OndarAbout extends StatelessWidget {



  OndarAbout();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(
          title: new Text('ONDAR ABOUT'),
          backgroundColor: Colors.red,
        ),
        body: new SingleChildScrollView(
            child:new Container(
              child: new Text('ONDAR ABOUT'),
              color: Colors.grey,
              alignment: FractionalOffset.bottomCenter,
              padding: const EdgeInsets.all(15.0),
            )
        )
    );
  }
}