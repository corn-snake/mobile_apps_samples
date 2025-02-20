import 'package:example_15_lists/list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

///

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}
class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: Padding(padding: EdgeInsets.only(left: 10, top: 10, bottom: 10), child:CircleAvatar(backgroundImage: NetworkImage("https://forums.sufficientvelocity.com/data/avatar/1615481558/49225-l.webp"))),
      title: Text("lista"),
    ),
    body: CList(),
  );
  
}