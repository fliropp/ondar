import 'package:flutter/material.dart';
import '../navigation/router.dart';


Widget _button(String route, BuildContext context) {
  return new FloatingActionButton(
      heroTag: route,
      backgroundColor: Colors.orangeAccent, onPressed: () {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => ondarButtonsRouter(route)),
    );
  }
  );
}

Widget ondarButtons(BuildContext context) {
  return new Container(
    margin: const EdgeInsets.only(top:270.0, bottom:30.0),
    decoration: new BoxDecoration(color: Color(0xFFFFFF)),
    width: MediaQuery.of(context).size.width * 0.7,
    height: MediaQuery.of(context).size.height * 0.05,
    child:Center(
      child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button('ondarMap', context),
            _button('ondarMap1', context),
            _button('ondarMap2', context),
            _button('ondarMap3', context),
            _button('ondarAbout', context),
          ]
      ),
    ),
  );
}