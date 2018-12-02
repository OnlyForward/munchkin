import 'package:flutter/material.dart';
import 'package:munchkin/Information.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      appBar: AppBar(
        title: Text('Правила'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/allcards');
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
            image: AssetImage('assets//munchkin_rules.jpg'),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: getRules(),
              )),
        ),
      ),
    );
  }

  List<Widget> getRules() {
    Information information = new Information();
    List<Widget> widgets = [];
    List<String> rules = information.getList;
    for (int i = 0; i < rules.length; i += 2) {
      widgets.add(setTitle(i));
      widgets.add(addDescription(i + 1));
    }
    return widgets;
  }

  Widget setTitle(int i) {
    return Text(
      new Information().getList[i],
      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
    );
  }

  Widget addDescription(int i) {
    return Text(new Information().getList[i], style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w700),);
  }
}
