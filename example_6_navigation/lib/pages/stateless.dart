import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  final String txt;
  const StatelessPage(this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("wahoo"),
          backgroundColor: Colors.tealAccent,
        ),
        body: Padding(padding: EdgeInsets.symmetric(vertical: 42), child: Center(
          child: Text(txt),
        )),
      );
  }
}