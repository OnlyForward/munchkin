import 'package:flutter/material.dart';
import 'package:munchkin/AllCards.dart';
import 'package:munchkin/Alone.dart';
import 'package:munchkin/Game.dart';
import 'package:munchkin/GameMaster.dart';
import 'package:munchkin/Information.dart';
import 'package:munchkin/Rules.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple),
//      home: new MyHomePage(title: 'Flutter Demo Home Page'),

      routes: {
        '/': (context) {
          return MyHomePage(title: 'Манчкин');
        },
        '/master': (context) {
          return Master();
        },
        '/alone': (context) {
          return OnePerson();
        },
        '/game': (context) {
          return Game();
        },
        '/inf': (context) {
          return Rules(); //Rules();
        },
        '/allcards': (context) {
          return AllCards();
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(
                  title: 'Манчкин',
                ));
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double TargertWidth = MediaQuery.of(context).size.width/4;
    double TargertHeight = MediaQuery.of(context).size.height/4;

    return new Scaffold(
      backgroundColor: Colors.brown.shade700,
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushNamed(context, '/inf');
            },
            tooltip: 'Правила игры',
          ),
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              Navigator.pushNamed(context, '/allcards');
            },
          )
        ],
      ),
      body: new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          RaisedButton(
//            onPressed: () {
//              Navigator.pushNamed(context, '/alone');
//            },
//            child: Text('один'),
//          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/alone'),
            child: Container(margin: EdgeInsets.all(5.0),
              alignment: Alignment.topRight,
              width: TargertHeight,
              height: TargertHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                      image: AssetImage('assets/swords.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstOut))),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/master'),
            child: Container(margin: EdgeInsets.all(5.0),
              alignment: Alignment.topRight,
              width: TargertHeight,
              height: TargertHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/sword_alone.png'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstOut))),
            ),
          ),

//            RaisedButton(
//              onPressed: () {
//                Navigator.pushNamed(context, '/master');
//              },
//              child: Text('master'),
//            )
        ],
      ),
    );
  }
}
