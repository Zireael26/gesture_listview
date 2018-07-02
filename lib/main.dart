import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(30, (i) => "Item ${i+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to dismiss"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, int index) {
          return Dismissible(
            key: Key(items[index]),
            child: ListTile(
              title: Text(items[index]),
            ),
            onDismissed: (direction) {
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(items[index] + " dismissed"),
                  ));
            },
            background: Container(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
