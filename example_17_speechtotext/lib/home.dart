import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  final stt.SpeechToText _sp = stt.SpeechToText();
  late String _text;
  bool isListening = false;
  @override void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _initSpeechState() async {
    bool available = await _sp.initialize();
    if (!mounted) return;
    setState(() {
      isListening = available;
    });
  }
  void _startListening() {
    _sp.listen(onResult: (result) {
      setState(() {
        _text = result.recognizedWords;
      });
    });
    setState(() {
      isListening = true;
    });
  }

  void _copyText() {
    Clipboard.setData(ClipboardData(text: _text));
    _showSnackBar("Texto Copiado");
  }

  void _clearText() {
    setState(() {
      _text = "";
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
    ));
  }

  @override
  Widget build(BuildContext context) =>  Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      );
}