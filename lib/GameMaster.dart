import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:munchkin/mm_widgets/DialogColor.dart';

class Master extends StatefulWidget {
  final List<String> list = [];
  final List<Color> color = Colors.primaries;
  int i = 0;

  Master({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MasterState();
  }
}

class MasterState extends State<Master> {
  List<Color> colorVarity;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.brown.shade700,
      appBar: AppBar(
        title: Text('Мастер игры'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                widget.list.add('value ${widget.i}');
                widget.i++;
              });
            }, //2
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/game');
        },
        tooltip: 'just check',
        child: IconButton(icon: Icon(Icons.check), onPressed: null),
      ),
      body: ListView.builder(
        itemBuilder: _itemList,
        itemCount: widget.list.length,
        padding: EdgeInsets.all(10.0),
      ),
    );
  }



  Widget _itemList(BuildContext context, int element) {

    String strings = "hjkhku";
    var txt = TextEditingController(text: strings);
    final item = widget.list[element];
    Color color = Colors.red;
    bool pressed = false;

    void setColor(Color colors){
      setState(() {
        pressed = true;
        color = colors;
        print('came'+color.toString());
      });

    }

    return Container(
      alignment: Alignment.center,
      child: Dismissible(
        //direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          deleteElement(item);
        },
        background: Container(
          child: Text('delete'),
          color: Colors.red,
        ),
        key: Key(item),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipOval(
                child: RaisedButton(
                  onPressed: () {
                    setState(() {


                    showDialog(
                      context: context,
                      builder: (BuildContext context)
                    {
                      return DialogColor(setColor);
                    });
                    print('came'+color.toString());
                    });
//                    SnackBar snackbar = new SnackBar(
//                      content: Text('${widget.list[element]}'),
//                      action: SnackBarAction(label: "Cancel", onPressed: () {}),
//                    );
//                    Scaffold.of(context).showSnackBar(snackbar);
                  },
                  shape: CircleBorder(),
                  color: pressed?color:Colors.red,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                controller: txt,
                key: Key(item),
                onChanged: (String s) {
                  setState(() {
                    txt.text = s;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Имя игрока ${element + 1}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteElement(String item) {
    if (widget.list.contains(item)) {
      setState(() {
        widget.list.remove(item);
      });
    }
  }

  PageController pageController = new PageController();
  bool change = true;

  void _showWarningDialog(BuildContext context) {
    double targetDeviceWidth = MediaQuery.of(context).size.width;
    double targetDeviceHeight = MediaQuery.of(context).size.height;
    double dialogHeight = targetDeviceHeight * 0.3;
    final int firstPage = widget.color.length ~/ 2;
    final int secondPage = firstPage + widget.color.length % 2;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          title: Text('Выберите цвет'),
          content: SizedBox(
            height: dialogHeight,
            child: PageView(
              controller: pageController,
              children: takeListWidget(),
            ),
          ),
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

  void _showDialogForNext(BuildContext context, List<Color> list) {
    double targetDeviceWidth = MediaQuery.of(context).size.width;
    double targetDeviceHeight = MediaQuery.of(context).size.height;
    double dialogHeight = targetDeviceHeight * 0.3;
    final int firstPage = widget.color.length ~/ 2;
    final int secondPage = firstPage + widget.color.length % 2;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          title: Text('Выберите цвет'),
          content: SizedBox(height: dialogHeight, child: anotherGrid(list)),
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

  Widget anotherGrid(List<Color> list) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(list.length, (index) {
        return Padding(
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: RaisedButton(
                onPressed: () {},
                shape: CircleBorder(),
                color: widget.color[index],
              ),
            ));
      }),
    );
  }

  Widget gridViewContent(int elements, int startArg) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(elements, (index) {
        return Padding(
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    colorVarity.clear();
                    colorVarity = List<Color>.generate(9, (i) {
                      int step = 10;
                      Color color = new Color(widget.color[0].value + step);
                      step += 10;
                      change = false;
                      return color;
                    });
                    //pageController.dispose();
                    _showDialogForNext(context, colorVarity);
                  });
                },
                shape: CircleBorder(),
                color: widget.color[startArg + index],
              ),
            ));
      }),
    );
  }

  List<Widget> takeListWidget() {
    List<Widget> list;
    if (change) {
      list = [gridViewContent(9, 0), gridViewContent(9, 9)];
    } else {
      list = [gridViewContent(9, 0)];
    }
    return list;
  }
}
