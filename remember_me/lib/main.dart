import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemModel(),
      child: MyApp(),
    ),
  );
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NavigationBar(),
      ItemsList(),
    ]);
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  TextEditingController titlesController =
                      TextEditingController();

                  return AlertDialog(
                    title: Text("New row"),
                    content: TextField(
                      controller: titlesController,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Add"),
                        onPressed: () {
                          _addItem(context, titlesController.text);
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
                }),
          )
        ]));
  }

  void _addItem(BuildContext context, String text) {
    var items = Provider.of<ItemModel>(context, listen: false);
    items.add(text);
  }
}

class ItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer<ItemModel>(builder: (context, item, child) {
      return ListView.builder(
          itemCount: item.items.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.all(20.0),
                child: Text(item.items[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Futura",
                    )));
          });
    }));
  }
}

class ItemModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }
}
