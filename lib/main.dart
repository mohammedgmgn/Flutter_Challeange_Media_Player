import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_challeange/songs.dart';
import 'package:flutter_challeange/theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {},
          color: const Color(0xFFDDDDDD),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () {},
            color: const Color(0xFFDDDDDD),
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: new Center(
            child: new Container(
              width: 125.0,
              height: 125.0,
              child: new ClipOval(
                clipper: new CircleClipper(),
                child: new Image.network(
                  demoPlaylist.songs[0].albumArtUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),

          new Container(
            width: double.infinity,
            height: 125.0,
          ),

          // song title and artisit name ,controls
          Container(
            width: double.infinity,
            color: accentColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
              child: new Column(
                children: <Widget>[
                  new RichText(
                      text: new TextSpan(text: '', children: [
                    new TextSpan(
                        text: 'Song Title\n',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4.0,
                            height: 1.5)),
                    new TextSpan(
                        text: 'Artist Name',
                        style: new TextStyle(
                            color: Colors.white.withOpacity(0.75),
                            fontSize: 12.0,
                            letterSpacing: 3.0,
                            height: 1.5)),
                  ])),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: new Row(
                      children: <Widget>[
                        new Expanded(child: new Container()),
                        new IconButton(
                          splashColor: lightAccentColor,
                          highlightColor: Colors.transparent,
                          icon: new Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          onPressed: () {},
                        ),
                        new Expanded(child: new Container()),
                        new RawMaterialButton(
                          shape: new CircleBorder(),
                          fillColor: Colors.white,
                          splashColor: lightAccentColor,
                          highlightColor: lightAccentColor.withOpacity(0.5),
                          elevation: 10.0,
                          highlightElevation: 5.0,
                          onPressed: () {},
                          child: new Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Icon(
                              Icons.play_arrow,
                              color: darkAccentColor,
                              size: 35.0,
                            ),
                          ),
                        ),
                        new Expanded(child: new Container()),
                        new IconButton(
                          splashColor: lightAccentColor,
                          highlightColor: Colors.transparent,
                          icon: new Icon(Icons.skip_next,
                              color: Colors.white, size: 35.0),
                          onPressed: () {},
                        ),
                        new Expanded(child: new Container())
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: new Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
  }
}
