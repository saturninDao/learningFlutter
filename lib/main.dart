import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  int _counter = 10;
  String _phrase = "Clic avant explosion";
  TextStyle _tS = TextStyle(
    color: Colors.green,
    fontSize: 15,
  );
  Color _couleur = Colors.white;
  Icon _coeur = Icon(Icons.favorite_border, color: Colors.white,);
  bool _likeBool = false;
  int _indexSelectionne = 0;
  String _affichage = "0: Accueil";

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      if(_counter>0){
        _counter--;
      }

      if(_counter == 0) {
        _phrase = "BOUM";
        _tS = TextStyle(
          color: Colors.red,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        );
        _couleur = Colors.amber;
      }

    });
  }
  void _likeThis() {
    setState(() {
      if (_likeBool) {
        _coeur = Icon(Icons.favorite_border, color: Colors.white,);
        _likeBool = false;
      } else {
        _coeur = Icon(Icons.favorite, color: Colors.white,);
        _likeBool = true;
      }
    });
  }
  void _itemClique(int index) {
    setState(() {
      _indexSelectionne = index;
      switch (_indexSelectionne) {
        case 0:
          {
            _affichage = '$_indexSelectionne: Accueil';
          }
          break;
        case 1:
          {
            _affichage = '$_indexSelectionne: Mon compte';
      }
      break;
      case 2:
      {
      _affichage = '$_indexSelectionne: Statistiques';
      }
      break;
    }
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
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
              icon: _coeur,
              onPressed: _likeThis
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
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
            Text(
              '${_affichage}',
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ],
        ),
      ),
      backgroundColor: _couleur,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
      icon: Icon(
      Icons.home,
        color: Colors.white,
      ),
      title: Text(
      'Accueil',
      style: TextStyle(color: Colors.white),
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.supervised_user_circle,
    color: Colors.white,
    ),
    title: Text(
    'Mon compte',
    style: TextStyle(color: Colors.white),
    )),
    BottomNavigationBarItem(
    icon: Icon(
    Icons.assessment,
    color: Colors.white,
    ),
    title: Text(
    'Statistiques',
    style: TextStyle(color: Colors.white),
    )),
    ],
    backgroundColor: Colors.red,
    onTap: _itemClique,
    currentIndex: _indexSelectionne,
    ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
        DrawerHeader(
        child: Text(
          'Menu de navigation',
          style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
      ),
      Text('Lien 1'),
      Text('Lien 2'),
      Text('Lien 3'),
      ],
    ),
    ),
    );
  }
}
