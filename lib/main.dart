import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacityLevel = 1;
  static final Color _colorBkgDefault = Colors.yellow;
  static final BoxShape _shapeDefault = BoxShape.rectangle;
  static final double _borderDefault = 4.0;
  static final double _posContainerXDefault = 200;
  static final double _posContainerYDefault = 200;
  static final Curve _curveDefault = Curves.decelerate;
  Color _colorBkg;
  BoxShape _shape;
  double _border;
  double _posContainerX, _posContainerY;
  Curve _curve;

  _MyHomePageState() {
    _initialize();
    print("inizializzo");
  }

  _initialize() {
    _colorBkg = _colorBkgDefault;
    _shape = _shapeDefault;
    _border = _borderDefault;
    _posContainerX = _posContainerXDefault;
    _posContainerY = _posContainerYDefault;
    _curve = _curveDefault;
  }

  void _changeOpacity() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _opacityLevel = (_opacityLevel + 1) % 2;
      if (_colorBkg == Colors.green) {
        _colorBkg = Colors.lightBlue;
        _border = 1.0;

        _posContainerX = 30;
        _posContainerY = 30;
      } else {
        _colorBkg = Colors.green;
        _border = 4.0;

        _posContainerX = _posContainerXDefault;
        _posContainerY = _posContainerYDefault;
      }
    });
  }

  Widget buildButtons() {
    return Column(
      children: <Widget>[
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          RaisedButton(
            child: Text("Reset"),
            onPressed: () {
              print("Reset dei parametri!!!");
              setState(() {
                _initialize();
              });
            },
          ),
          RaisedButton(
            child: Text("Allunga"),
            onPressed: () {
              print("Allungalo!!!");
              setState(() {
                _posContainerY = 400;
              });
            },
          ),
          RaisedButton(
            child: Text("Easy in"),
            onPressed: () {
              print("beccati questo!!!!");
              setState(() {
                _curve = Curves.easeInOut;
                _posContainerX = 250.0;
                _posContainerY = 250.0;
                _colorBkg = Colors.greenAccent;
                _border = 10.0;
              });
            },
          ),
        ]),
        ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
          RaisedButton(
            child: Text("BounceIO"),
            onPressed: () {
              print("beccati questo!!!!");
              setState(() {
                _curve = Curves.bounceInOut;

                _posContainerX = 250.0;
                _posContainerY = 250.0;
                _colorBkg = Colors.greenAccent;
                _border = 10.0;
              });
            },
          ),
          RaisedButton(
            child: Text("ElasticIO"),
            onPressed: () {
              print("Allungalo!!!");
              setState(() {
                _posContainerY = 400;
                _curve = Curves.elasticInOut;
              });
            },
          ),
          RaisedButton(
            child: Text("Cerchio"),
            onPressed: () {
              print("beccati questo!!!!");
              setState(() {
                _shape = BoxShape.circle;
              });
            },
          ),
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(height: 20.0),
            GestureDetector(
              onTap: _changeOpacity,
              child: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: AnimatedContainer(
                  curve: _curve,
                  // opacity: 1,//_opacityLevel,
                  duration: Duration(seconds: 1),
                  width: _posContainerX,
                  height: _posContainerY,
                  decoration: BoxDecoration(
                    color: _colorBkg,
                    shape: _shape,
                    border: Border.all(width: _border),
                  ),
                  child: Container(
                    child: Center(
                      child: Text("Mother Fucker"),
                    ),
                  ),
                ),
              ),
            ),
            buildButtons()
          ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _changeOpacity,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.flip),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
