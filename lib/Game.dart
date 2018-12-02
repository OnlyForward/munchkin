import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GameState();
  }
}

_showAskingDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Вы уверены ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Отмена"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("Ок"),
            )
          ],
          content: Text('ВЫ потеряете все !'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
        );
      });
}

void setName(String s) {
  //_getRow(s);
}

class GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        _showAskingDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Бой'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                showAlertPerson(context);
              },
            )
          ],
        ),
        body: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
      ),
    );
  }

  Widget _getRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: RaisedButton(
            onPressed: () {},
            shape: CircleBorder(),
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 3,
          child: TextField(
            onChanged: (String s){

            },
          ),
        )
      ],
    );
  }

  showAlertPerson(BuildContext context) {
    String name;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Введите имя игрока'),
            actions: <Widget>[
              FlatButton(
                child: Text('Отмена'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text('Подтвердить'),
                onPressed: () {
                  setName(name);
                  Navigator.pop(context);
                },
              )
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: TextField(
              decoration: InputDecoration(
                  hintText: 'опоздавший',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              onChanged: (String s) {
                setState(() {
                  name = s;
                });
              },
            ),
            titlePadding: EdgeInsets.all(10.0),
          );
        });
  }
}
