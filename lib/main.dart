import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './components/buttons.dart';
import './components/post.dart';

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
  int _currentFBIdx = null;

  void _setViewAndIndex(String view, int idx) {
    setState(() {
      _currentPostId = view;
      _currentFBIdx = idx;
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

  /** WIDGETS **/

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
              ondarButtons(context),
            ]
        ),
      ),
    );
  }

  Widget ondarBottom() {
    if(_currentPostId == 'post') {
      return showSinglePost();
    } else {
      return showMultiplePosts();
    }
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

  Widget showSinglePost() {
    return new StreamBuilder(
        stream: Firestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return new Expanded(
            //decoration: new BoxDecoration(color: Colors.white70),
            child:new ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ondarFrontPostFull(snapshot.data.documents[_currentFBIdx]),
                ]
            ),
          );
        }
    );
  }

  Widget showMultiplePosts() {
    return new StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            //if (!snapshot.hasData) return const Text('Loading...');
            if (!snapshot.hasData) return CircularProgressIndicator();

            return new Expanded(
                child:ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.documents.length,
                  //itemExtent: 25.0,
                  itemBuilder: (context, index) {
                    return ondarFrontPostTeaser(snapshot.data.documents[index], index);
                  }
            ),
            );
          }
              //decoration: new BoxDecoration(color: Colors.white70),
              /*child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                    ondarFrontPostTeaser(snapshot.data.documents[0], 0),
                    ondarFrontPostTeaser(snapshot.data.documents[1], 1),
                    ondarFrontPostTeaser(snapshot.data.documents[2], 2),
                  ]
            ),*/

    );



  }



  Widget ondarFrontPostTeaser(DocumentSnapshot fb_entry, int idx) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new GestureDetector(
        onTap: (){
          _setViewAndIndex('post', idx);
          },
        child: frontPostTeaser(fb_entry, context)
        ),
      );
  }

  Widget ondarFrontPostFull(DocumentSnapshot post) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new GestureDetector(
        onTap: (){
          _setViewAndIndex('list', null);
        },
        child: frontPostFull(post, context)
      ),
    );
  }

  }

