import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  final String txt;
  const StatefulPage(this.txt, {super.key});

  @override
  State<StatefulPage> createState()=>_StateStatefulPage();
}

class _StateStatefulPage extends State<StatefulPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hoowa"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 42),
          child: Center(
            child: Text(widget.txt),
          )),
    );
  }
}
