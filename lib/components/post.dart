import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/utils.dart';
import '../utils/style.dart';


Widget frontPostTeaser(DocumentSnapshot post, BuildContext context) {
  return new Container(
        padding: new EdgeInsets.only(top: 10.0),
        decoration: new BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
        child: new Column(
          children:[
            new Row(
              children: [
                new Container(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width * 0.15,
                  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: new IconTheme(
                    data: new IconThemeData(
                      color: null,
                    ), //IconThemeData
                    child: new ImageIcon(
                        new AssetImage("assets/logo-mount.png"),
                        color: null,
                        size: 25.0), //Logo
                  ),
                ),
                new Container(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width * 0.65,
                  margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: new Center(
                    child: new Text(getTextTeaserHeading(post['heading']), style: getPostHeaderText(),
                  ),
                  ),
                ),
              ]
          ),
          new Row(
            children: [
              new Container(
                width:MediaQuery
                    .of(context)
                    .size
                    .width * 0.8,
                margin: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: new Center(
                        child:new Text(getTextTeaserContent(post['content']), style: getPostBasicText(),
                ),
                ),
              ),
            ]

          ),
          new Row(
              children: [
                new Container(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  margin: new EdgeInsets.fromLTRB(50.0, 5.0, 0.0, 20.0),
                  child:new Text(getTextTeaserContent(post['user']), style: getUserText(),
                  ),
                ),
              ]

          ),

          new Row(
            children: [
              new Container(
                decoration: new BoxDecoration(
                    color: Colors.black54,
                    borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
                /*width:MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,*/
                margin: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 15.0),
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                child: new Text(post['location'], style: getLocationText(),
                ),
              ),
              new Container(
                width:MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,
                margin: new EdgeInsets.fromLTRB(60.0, 0.0, 0.0, 15.0),
                child: new Text(formatFBDate(post['timestamp']), style: getPostTimeStampText(),
                ),
              )
            ]
          ),
          ]
        ),
      );

}

Widget frontPostFull(DocumentSnapshot post, BuildContext context) {
  return new Container(
        padding: new EdgeInsets.only(top: 10.0),
        decoration: new BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
        /*width: MediaQuery
            .of(context)
            .size
            .width * 0.8,*/
        child: new Column(
        children: [
          new Row(
            children: [
              new Container(
                width:MediaQuery
                    .of(context)
                    .size
                    .width * 0.15,
                margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: new IconTheme(
                  data: new IconThemeData(
                    color: null,
                  ), //IconThemeData
                  child: new ImageIcon(
                      new AssetImage("assets/logo-mount.png"),
                      color: null,
                      size: 25.0), //Logo
                ),
              ),
              new Container(
                width:MediaQuery
                    .of(context)
                    .size
                    .width * 0.65,
                margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: new Center(
                      child: new Text(post['heading'], style: getPostHeaderText(),),
                ),
              ),
            ]
        ),
          new Row(
            children: [
              new Container(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width * 0.8,
                  margin: new EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: new Text(post['content'], style: getPostBasicText(),)
              )
            ]
          ),

          new Row(
              children: [
                new Container(
                    width:MediaQuery
                        .of(context)
                        .size
                        .width * 0.4,
                    margin: new EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 10.0),
                    child: new Text(post['user'], style: getUserText(),)
                ),
                new Container(
                    width:MediaQuery
                        .of(context)
                        .size
                        .width * 0.4,
                    margin: new EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                    child: new Text(formatFBDate(post['timestamp']), style: getPostTimeStampText(),)
                ),
              ]
          ),
          new Row(
              children: [
                new Container(
                  decoration: new BoxDecoration(
                      color: Colors.black54,
                      borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
                  /*width:MediaQuery
                    .of(context)
                    .size
                    .width * 0.4,*/
                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 15.0),
                  padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  child: new Text(post['location'], style: getLocationText(),
                  ),
                ),
                new Container(
                  width:MediaQuery
                      .of(context)
                      .size
                      .width * 0.5,
                  margin: new EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 15.0),
                  child: new Text('geo location: ' + post['geo_loc'].latitude.toString() +
                      'N /' + post['geo_loc'].longitude.toString() + ' E', style: getGeoLocText(),
                  ),
                )
              ]
          ),

              ]
  ),
      );
}