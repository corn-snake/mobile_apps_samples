import 'package:flutter/material.dart';

final List<String> aeiou = ["https://i.redd.it/ys9w74vi2k6b1.jpg", "https://i.redd.it/yv5a8q9pwjgd1.png", "https://i.redd.it/2ean6s4q9ay71.png"],
  uoiea = ("aeiou").split("");

class CList extends StatelessWidget {
  const CList({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 45, vertical: 25), child: Column(children: [
    Expanded(child: ListView.builder(itemBuilder: (context, index) => Card(child: ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(aeiou[(3 + index) % 3]),),
      title: Text("n° ${index + 1}: ${uoiea[(5+ index) % 5]}"),
    )), itemCount: 30,))
  ],)));
}