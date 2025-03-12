import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:soundpool/soundpool.dart';
import 'package:flutter/material.dart';

SoundpoolOptions opts = SoundpoolOptions(streamType: StreamType.notification);
Soundpool barkpool = Soundpool.fromOptions(options: opts);

const Map<String, String> barks = {
  "bark": "./../assets/bark.wav",
  "whoorf": "./../assets/whoorf.wav",
  "yawaouu": "./../assets/yawaouu.wav",
  "waf": "./../assets/waf.wav",
  "yalp": "./../assets/yalp.wav",
  "waooo": "./../assets/waooo.wav"
};
final List<String> barkKeys = barks.keys.toList();
const List<String> flyingDogs = [
  "https://png.pngtree.com/png-clipart/20230412/original/pngtree-flying-eagle-feather-white-background-transparent-png-image_9048176.png",
  "https://1.bp.blogspot.com/-RI8E4t7TIIg/UL3Jh6xcuRI/AAAAAAAARwI/sBxk0WTjwKM/s1600/Funny-Eagle-Photos-01.jpg"
];
const List<String> flyingBarks = [
  "https://cdn.pixabay.com/download/audio/2024/12/27/audio_2a1705ca5c.mp3?filename=eagle-281163.mp3",
  "https://cdn.pixabay.com/download/audio/2024/08/28/audio_aae8b63415.mp3?filename=eagle-squawking-type-4-235978.mp3"
];

Future<int> _loadWoof(type) async {
  return await barkpool.loadUri(type!);
}

class PetDetector extends StatefulWidget {
  final String type;
  final String dog;
  const PetDetector({super.key, required this.type, required this.dog});

  @override
  State<StatefulWidget> createState() => _PetDetector();
}

class _PetDetector extends State<PetDetector> {
  late Future<int> _soundId;
  int? _barkStreamId;
  Soundpool get _soundpool => barkpool;
  void loadWoof() => _soundId = _loadWoof(widget.type);
  Future<void> _playBark() async {
    var _bark = await _soundId;
    _barkStreamId = await _soundpool.play(_bark);
  }

  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {

    loadWoof();
    return GestureDetector(
      onTap: (){setState(() {
          _color == Colors.yellow
              ? _color = Colors.white
              : _color = Colors.yellow;
        });
        _playBark();
      },
      behavior: HitTestBehavior.opaque,
      child: Card(
          shadowColor: _color,
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.dog), fit: BoxFit.cover),
                border: Border.all(color: _color, width: 3)
              ),
              child:  Center(child: RatingBar.builder(itemBuilder: (context,_)=>Icon(Icons.thumb_up_alt_rounded), onRatingUpdate: (r){}, initialRating: 2.5, glowColor: Colors.amberAccent[800],allowHalfRating: true,unratedColor: Colors.amber[100], updateOnDrag: true, )),
              )),
    );
  }
}

/*{
        print("clicked! ${widget.type}");
        ;
      } */