import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './router.dart';

void main() => runApp(new Ondar());

class Ondar extends StatelessWidget {
  // root
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ondar#1',
      theme: new ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.orange,
      ),
      home: new OndarFront(title: 'the magnficient Ondar app'),
    );
  }
}

class OndarFront extends StatefulWidget {
  OndarFront({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OndarState createState() => new _OndarState();
}

class _OndarState extends State<OndarFront> {
  String _currentPostId = null;

  void _setCurrentPost(String cpid) {
    setState(() {
      _currentPostId = cpid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ondarTop(),
            ondarBottom(),
          ],
        ),
      ),
    );
  }

  Widget ondarTop(){
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("assets/ondar.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Center(
        child: new Column(
            children: [
              ondarHeader(),
              ondarButtons(),
            ]
        ),
      ),
    );
  }

  Widget ondarBottom() {
    if(_currentPostId == 'post') {
      return new Container(
        decoration: new BoxDecoration(color: Colors.white70),
        child:new Column(
            children: [
              ondarFrontPostFull('route #1 - full post'),

            ]
        ),
      );
    } else {
        //return new Container(
        //    decoration: new BoxDecoration(color: Colors.white70),
        //    child:multiplePosts(),
        //);
      return multiplePosts();
    }
  }

  Widget multiplePosts() {
    return new StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return new Container(
              decoration: new BoxDecoration(color: Colors.white70),
              child:new Column(
                  children: [
                    ondarFrontPost(snapshot.data.documents[0]['heading']),
                    ondarFrontPost(snapshot.data.documents[1]['heading']),
                    ondarFrontPost(snapshot.data.documents[2]['heading']),

                  ]
              ),
            );
          }
      );
  }

  Widget ondarHeader() {
    return new Container(
      margin: new EdgeInsets.only(top: 25.0),
      child: new Text("ONDAR",style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 42.0,
        color: Colors.orangeAccent,
      )),
    );
  }

  Widget ondarButtons() {
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
              _button('ondarMap'),
              _button('ondarMap1'),
              _button('ondarMap2'),
              _button('ondarMap3'),
              _button('ondarAbout'),
            ]
        ),
      ),
    );
  }

  Widget _button(String route) {
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

  Widget ondarFrontPost(String txt) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
    child: new GestureDetector(
      onTap: (){_setCurrentPost('post');},
      child: new Container(
        padding: new EdgeInsets.only(top: 5.0),
        decoration: new BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
        height: MediaQuery
            .of(context)
            .size
            .height * 0.08,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.8,
        child: new Row(
            children: [
              new Container(
                margin: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 10.0),
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
                    margin: new EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 10.0),
                    child: new Text(txt, style: new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18.0,
                      color: Colors.black45,
                    ),)
                ),

            ]
          ),
        ),
      ),
    );
  }

  Widget ondarFrontPostFull(String txt) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new GestureDetector(
        onTap: (){_setCurrentPost('list');},
        child: new Container(
          padding: new EdgeInsets.only(top: 10.0),
          decoration: new BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
          height: MediaQuery
              .of(context)
              .size
              .height * 0.3,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          child: new Row(
              children: [
                new Container(
                  margin: new EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 10.0),
                  child: new IconTheme(
                    data: new IconThemeData(
                      color: null,
                    ), //IconThemeData
                    child: new ImageIcon(
                        new AssetImage("assets/logo-mount.png"),
                        color: null,
                        size: 35.0), //Logo

                  ),
                ),
                new Container(
                  margin: new EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 10.0),
                  child: new Text(txt, style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.blueGrey,
                  ),)
                ),
              ]
          ),
        ),
      ),
    );
  }

  }

