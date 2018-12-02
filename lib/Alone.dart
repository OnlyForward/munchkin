import 'package:flutter/material.dart';

class OnePerson extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnePersonState();
  }
}


showMyDialog(BuildContext context) {
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
                Navigator.pop(context);
              },
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Container(
            width: 190.0,
            height: 300.0,
            child: PageView(
              children: listPages(),
              controller: PageController(),
            ),
          ),
        );
      });
}

Widget _itemPage(String path) {
  return Container(
    width: 190.0,
    height: 300.0,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fitHeight,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(1.0), BlendMode.dstATop),
        image: AssetImage(path),
      ),
    ),
  );
}

List<Widget> listPages() {
  List<String> listImages = [
    'assets/races/card54.png',
    'assets/races/card55.png',
    'assets/races/card56.png',
    'assets/races/card57.png',
    'assets/races/card58.png',
    'assets/races/card59.png',
    'assets/races/card60.png',
    'assets/races/card61.png',
    'assets/races/card62.png',
    'assets/races/card63.png',
    'assets/card57.png',
    'assets/others2.png'
  ];
  List<Widget> list =
      List.generate(listImages.length, (i) => _itemPage(listImages[i]));
  return list;
}


void _showDialogForNext(BuildContext context, List<Color> list) {
  double targetDeviceWidth = MediaQuery.of(context).size.width;
  double targetDeviceHeight = MediaQuery.of(context).size.height;
  double dialogHeight = targetDeviceHeight * 0.3;
  final int firstPage = 9;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        title: Text('Выберите цвет'),
//        content: SizedBox(height: dialogHeight, child: anotherGrid(list)),
        actions: <Widget>[
          FlatButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Continue'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, true);
            },
          )
        ],
      );
    },
  );
}

class OnePersonState extends State<OnePerson> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Самоволк'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(1.0), BlendMode.dstATop),
            image: AssetImage('assets/card57.png'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    onChanged: (String s) {
                      showMyDialog(context);
                    },
                    decoration: InputDecoration(
                        hintText: 'Имя',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
