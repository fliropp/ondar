import 'package:flutter/material.dart';
import '../views/ondarAbout.dart';
import '../views/ondarMap.dart';
import '../views/ondarWrite.dart';

Widget ondarButtonsRouter(String route){
  switch(route) {
    case('ondarAbout'):
      return new OndarAbout();
    case('ondarMap'):
      return new OndarMap();
    case('ondarWrite'):
      return new OndarWrite();
    default:
      return null;
  }
}