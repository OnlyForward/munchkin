import 'package:flutter/material.dart';

class AllCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Все карты'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/inf');
            },
            tooltip: 'Правила игры',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/orig.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstOut)),
        ),
        child: GridView.count(
          padding: EdgeInsets.all(10.0),
          crossAxisCount: 3,
          children: List.generate(64, (i) => _buildItem(context, i)),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    double widthTarget = (MediaQuery.of(context).size.width - 20) / 3;
    double heightTarger = MediaQuery.of(context).size.height / 2 + 40;
    return GestureDetector(
      onTap: () {
        showDialogForDetails(context, index);
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: widthTarget,
        height: heightTarger,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(1.0), BlendMode.dstATop),
            image: AssetImage('assets/allcards/card$index.png'),
          ),
        ),
      ),
    );
  }

  showDialogForDetails(BuildContext context, int index) {
    double dialogHeight = MediaQuery.of(context).size.height * 0.5;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('djasl'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Container(
            height: dialogHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(1.0), BlendMode.dstATop),
                image: AssetImage('assets/allcards/card$index.png'),
              ),
            ),
          ),
        );
      },
    );
  }
}
