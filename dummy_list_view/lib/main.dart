import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> titles = <String>[];

  TextEditingController titlesController = TextEditingController();

  void _addItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New row"),
          content: TextField(
            controller: titlesController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Add"),
              onPressed: () {
                _updateList();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void _updateList() {
    setState(() {
      if (titlesController.text.isEmpty == false) {
        titles.add(titlesController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text("List View",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Futura",
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            Spacer(),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _addItem,
            )
          ])),
      Expanded(
          child: ListView.builder(
              itemCount: titles.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.all(20.0),
                    child: Text("${titles[index]}",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Futura",
                        )));
              }))
    ]);
  }
}
