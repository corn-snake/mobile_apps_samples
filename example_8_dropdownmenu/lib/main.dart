import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}

AppBar Bar() => AppBar(
  title: DropdownMenu(dropdownMenuEntries: [
    DropdownMenuEntry(value: 1, label: "dropdown"),
    DropdownMenuEntry(value: 2, label: "menu"),
  ]),
);