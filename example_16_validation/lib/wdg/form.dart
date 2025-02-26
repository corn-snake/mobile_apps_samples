import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<StatefulWidget> createState() => _Formulario();
}

bool valiDate(String str) {
  List<String> ff = str.split("-");
  if(!RegExp(r'^(19|20)([0-9]{2})').hasMatch(str)) return false;
  if(!RegExp(r'\-(1[0-2]|0?[1-9])\-').hasMatch(str)) return false;
  int yr = int.parse(ff[0]), mn = int.parse(ff[1]), dy = int.parse(ff[2]);
  if(!(yr % 4 == 0 && yr % 100 > 1 || yr%400 == 0) && mn == 2 && dy>28) return false;
  if((mn < 8 && mn % 2 == 0 || mn > 7 && (mn + 1) % 2 == 0) && dy > 30 || mn == 2 && dy > 29) return false;
  if(dy > 31) return false;
  return true;
}

class _Formulario extends State<Formulario> {
  final GlobalKey<FormState> _state_form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Container(padding: EdgeInsets.all(20),
    child: Form(key: _state_form, child: Column(children: [
      Container(padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.deepPurple[400]!)),
        child: TextFormField(
          validator: (value) => !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value!) ? "Invalid E-Mail address" : null,
          decoration: InputDecoration(icon: Icon(Icons.mail_rounded), hintText: "E-Mail", border: InputBorder.none),
        )
      ),
      Container(padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.deepPurple[400]!)),
        child: TextFormField(
          validator: (value) => !RegExp(r'^(?=(.*[a-z]){1,})(?=(.*[A-Z]){1,})(?=(.*[0-9]){1,})(?=(.*[!@#$%^&*()\-__+.]){1,}).{8,}$').hasMatch(value!) ? "Password should be 8+ chars long, have one upper & one lower-case letter, one symbol, & a number" : null,
          decoration: InputDecoration(icon: Icon(Icons.mail_rounded), hintText: "Password", border: InputBorder.none),
          obscureText: true,
          autocorrect: false,
        )
      ),
      Container(padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.deepPurple[400]!)),
        child: TextFormField(
          validator: (value) => !valiDate(value!) ? "Invalid Date (yyyy-mm-dd)" : null,
          decoration: InputDecoration(icon: Icon(Icons.mail_rounded), hintText: "Date (yyyy-mm-dd)", border: InputBorder.none),
        )
      ),
      Expanded(child: Container()),
      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>_state_form.currentState!.validate() ? print("ok"):print("ungood"), child: Text("Validate")),)
    ],)),
  );
}