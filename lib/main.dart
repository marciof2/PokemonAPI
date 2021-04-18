import 'package:flutter/material.dart';
import 'package:pokemon/poke_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poke API',
      home: PokeView(),
    );
  }
}
