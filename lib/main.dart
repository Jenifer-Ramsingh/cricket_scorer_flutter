import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crick Scorer',
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
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Crick Scorer'),
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
  int _score = 0;
  int _wicket = 0;
  int _overs = 0;
  int _balls = 0;
  String _team_name = "India";
  String _over_text = "Over";

  void overs() {
    _balls++;
    if (_balls > 5) {
      _overs++;
      _over_text = "Overs";
      _balls = 0;
    }
  }

  void _extras() {
    setState(() {
      _score++;
    });
  }

  void _incrementCounter(int _currentScore) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      overs();
      _score = _score + _currentScore;
    });
  }

  void _incrementWicket(int _wicketCount) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      overs();
      _wicket = _wicket + _wicketCount;
    });
  }

  void _resetMatch() {
    setState(() {
      _score = 0;
      _wicket = 0;
      _overs = 0;
      _balls = 0;
    });
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
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '$_team_name',
              style: Theme.of(context).textTheme.display3,
            ),
            new Container(
                height: 200,
                child: new Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '$_score' + '-' + '$_wicket',
                            style: Theme.of(context).textTheme.display4,
                          ),
                        ],
                      ),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$_overs' + '.' + '$_balls',
                            style: Theme.of(context).textTheme.display3,
                          ),
                          Text(
                            '$_over_text',
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            new Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                      height: 70,
                      width: 70,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementCounter(6),
                          tooltip: "6 Runs",
                          backgroundColor: Colors.deepPurpleAccent,
                          label: Text(
                            "6",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 70,
                      child: FloatingActionButton.extended(
                          onPressed: _extras,
                          backgroundColor: Colors.blueGrey,
                          tooltip: "5 Runs",
                          label: Text(
                            "5",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 200,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementCounter(0),
                          backgroundColor: Colors.grey,
                          tooltip: "No Run",
                          label: Text(
                            "Dot Ball",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                ],
              ),
            ),
            new Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                      height: 70,
                      width: 70,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementCounter(4),
                          backgroundColor: Colors.deepPurpleAccent,
                          tooltip: "4 Runs",
                          label: Text(
                            "4",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 70,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementCounter(3),
                          tooltip: "3 Runs",
                          label: Text(
                            "3",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 70,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementCounter(2),
                          tooltip: "2 Runs",
                          label: Text(
                            "2",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 70,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementCounter(1),
                          tooltip: "1 Run",
                          label: Text(
                            "1",
                            style: TextStyle(fontSize: 30.0),
                          ))),
                ],
              ),
            ),
            new Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                      height: 70,
                      width: 120,
                      child: FloatingActionButton.extended(
                          onPressed: () => _incrementWicket(1),
                          tooltip: "Wicket",
                          backgroundColor: Colors.redAccent,
                          label: Text(
                            "Out",
                            style: TextStyle(fontSize: 24.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 120,
                      child: FloatingActionButton.extended(
                          onPressed: _extras,
                          tooltip: "Extras",
                          backgroundColor: Colors.purpleAccent,
                          label: Text(
                            "No Ball",
                            style: TextStyle(fontSize: 24.0),
                          ))),
                  new Container(
                      height: 70,
                      width: 120,
                      child: FloatingActionButton.extended(
                          onPressed: _extras,
                          backgroundColor: Colors.purpleAccent,
                          tooltip: "Extras",
                          label: Text(
                            "Wide",
                            style: TextStyle(fontSize: 24.0),
                          ))),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _resetMatch,
          tooltip: 'Increment',
          child: Icon(Icons
              .undo)), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
