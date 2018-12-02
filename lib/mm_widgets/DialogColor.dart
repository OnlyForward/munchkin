import 'package:flutter/material.dart';

class DialogColor extends StatefulWidget {
  Function setColor;

  DialogColor(this.setColor);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DialogColorState();
  }
}

class DialogColorState extends State<DialogColor> {
  List<Color> list_colors = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    double targetDeviceHeight = MediaQuery.of(context).size.height;
    double dialogHeight = targetDeviceHeight * 0.3;
    int length = list_colors.length ~/ 2;
    PageController controller = PageController();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      title: Text('Выберите цвет'),
      content: SizedBox(
          height: dialogHeight,
          child: PageView(
            controller: controller,
            children: <Widget>[
              anotherGrid(list_colors, length, 0),
              anotherGrid(list_colors, length, length)
            ],
          )),
    );
  }

  Widget anotherGrid(List<Color> list, int length, int start) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(length, (index) {
        return Padding(
            padding: EdgeInsets.all(10.0),
            child: ClipOval(
              child: RaisedButton(
                onPressed: () {
                  widget.setColor(list[start+index]);
                  Navigator.pop(context);
                },
                shape: CircleBorder(),
                color: list[start + index],
              ),
            ));
      }),
    );
  }
}
