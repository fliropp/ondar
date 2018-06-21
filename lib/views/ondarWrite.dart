import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class OndarWrite extends StatefulWidget {


  @override
  OndarWriteState createState() {
    return OndarWriteState();
  }
}

class OndarWriteState extends State<OndarWrite> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _username;
  String _post;
  String _heading;
  String _location;
  String _region;

  _submitPost() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    Firestore.instance.collection('posts').document().setData({
      'heading': _heading,
      'content': _post,
      'user' : _username,
      'location' : _location,
      'region': _region,
      'geo_loc': new GeoPoint(51.7, 94.4),
      'timestamp': new DateTime.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Scaffold(
        backgroundColor: Colors.grey,
        floatingActionButton: new FloatingActionButton(
            onPressed: () => _submitPost(),
            child: new Icon(Icons.check)),

        body:Form(
          key: _formKey,
            child: Container(
              margin: new EdgeInsets.all(16.0),
              child:ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    child: new TextFormField(
                      decoration: InputDecoration(
                        labelText: "username",
                        border: InputBorder.none,
                      ),
                      validator: (val) => val.isNotEmpty ? null : "who are you?",
                      onSaved: (val) => _username = val
                    ),
                  ),
                  Container(
                      child: Divider(
                        color: Colors.black,
                      )
                  ),
                  Container(
                    child: new TextFormField(
                        decoration: InputDecoration(
                          labelText: "heading",
                          border: InputBorder.none,
                        ),
                        validator: (val) => val.isNotEmpty ? null : "give us a header already!",
                        onSaved: (val) => _heading = val
                    ),
                  ),
                  Container(
                      child: Divider(
                        color: Colors.black,
                      )
                  ),
                  Container(
                    child: new TextFormField(
                        decoration: InputDecoration(
                          labelText: "location",
                          border: InputBorder.none,
                        ),
                        validator: (val) => val.isNotEmpty ? null : "where are you?",
                        onSaved: (val) => _location = val
                    ),
                  ),
                  Container(
                      child: Divider(
                        color: Colors.black,
                      )
                  ),
                  Container(
                    child: new TextFormField(
                        decoration: InputDecoration(
                          labelText: "region",
                          border: InputBorder.none,
                        ),
                        validator: (val) => val.isNotEmpty ? null : "...and exactly where is that?",
                        onSaved: (val) => _region = val
                    ),
                  ),
                  Container(
                    child:TextFormField(
                      decoration: InputDecoration(
                        labelText: "post",
                        border: InputBorder.none,
                      ),
                      validator: (val) => val.isNotEmpty ? null : "spill yer beans...",
                      onSaved: (val) => _post = val,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                    ),
                  ),





                  /*Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, we want to show a Snackbar
                          Scaffold
                              .of(context)
                              .showSnackBar(SnackBar(content: Text('Processing Data')));
                          Firestore.instance.collection('posts').document().setData({
                            'heading': 'another msg from Ondar',
                            'content': 'please download my Ondar appp',
                            'user' : 'Ondar',
                            'location' : 'Tuva',
                            'region':'Asia',
                            'geo_loc': new GeoPoint(51.7, 94.4),
                            'timestamp': new DateTime.now(),
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),*/
                ],
              ),
            ),
        ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(
          title: new Text('ONDAR WRITE'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: new SingleChildScrollView(
          child: new Column(

            children: [
              new Container(
                  child: new Form(
                    // The validator receives the text the user has typed in
                    key: _formKey,
                    child: new Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'enter username';
                            }
                          },
                        ),
                      ]

                    ),
                  ),
              ),
              new Container(
                child: new FloatingActionButton(
                  backgroundColor: Colors.orangeAccent, onPressed: () {
                    Firestore.instance.collection('posts').document().setData({
                      'heading': 'another msg from Ondar',
                      'content': 'please download my Ondar appp',
                      'user' : 'Ondar',
                      'location' : 'Tuva',
                      'region':'Asia',
                      'geo_loc': new GeoPoint(51.7, 94.4),
                      'timestamp': new DateTime.now(),
                  });
                }
                ),
                color: Colors.grey,
                alignment: FractionalOffset.bottomCenter,
                padding: const EdgeInsets.all(15.0),
              ),
              new Container(
                child: new Form(child: null)
              )

          ]
        ),
    )
    );
  }*/
}