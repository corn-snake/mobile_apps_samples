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
      appBar: AppBar(
        title: Text("carousel view"),
        centerTitle: true,
        leading: Icon(Icons.account_tree_outlined),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:80,child: cvh()),
            SizedBox(width: 5, height: 25,),
            SizedBox(height:160,child: cvv()),
          ],
        ),
      ),
    );
  }
}

CarouselView cvh() => CarouselView(
  scrollDirection: Axis.horizontal,
  itemExtent: 250, // Or any positive integers as long as the length of the array is 1.
  children: List<Widget>.generate(10, (int index) {
    return Center(child: Text('texto #$index'));
  }),
);

CarouselView cvv() => CarouselView(
  scrollDirection: Axis.vertical,
  itemExtent: 80,
  children: List<Widget>.generate(10, (int index) {
    return Center(child: Text('$index° texto'));
  }),
);
