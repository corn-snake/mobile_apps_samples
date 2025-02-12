import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blueGrey[600],
      foregroundColor: Colors.white,
      title: Text("ssssssssssssssssssssssssssssssssstars"),
      leading: Icon(Icons.star_border_purple500),
      centerTitle: true,
    ),
    body: SizedBox(
      height: 400,
      width: 1200,
      child: Center(child: RatingBar.builder(itemBuilder: (context,_)=>Icon(Icons.thumb_up_alt_rounded), onRatingUpdate: (r){}, initialRating: 2.5, glowColor: Colors.blueGrey[800],allowHalfRating: true,unratedColor: Colors.blueGrey, updateOnDrag: true),
    )),
  );
}