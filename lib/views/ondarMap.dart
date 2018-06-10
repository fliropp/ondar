import 'package:flutter/material.dart';

class OndarMap extends StatelessWidget {



  OndarMap();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(
          title: new Text('ONDAR MAP'),
          backgroundColor: Colors.red,
        ),
        body: new SingleChildScrollView(
            child:new Container(
              child: new Text('ONDAR MAP'),
              color: Colors.grey,
              alignment: FractionalOffset.bottomCenter,
              padding: const EdgeInsets.all(15.0),
            )
        )
    );
  }
}