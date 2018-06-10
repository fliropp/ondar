import 'package:flutter/material.dart';
import './router.dart';
import './views/ondarMap.dart';

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _OndarState createState() => new _OndarState();
}

class _OndarState extends State<OndarFront> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*appBar: new AppBar(
      ),*/
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
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
            ),
            new Container(
                decoration: new BoxDecoration(color: Colors.white70),
                child:new Column(
                    children: [
                       ondarFrontPost('route #1'),
                       ondarFrontPost('route #2'),
                       ondarFrontPost('route #3'),

                    ]
                ),

            ),

          ],
        ),
      ),
      /*floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
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
      child: new Container(
        padding: new EdgeInsets.only(top: 10.0),
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
              )
            ]
        ),
      ),
    );
  }

  }

