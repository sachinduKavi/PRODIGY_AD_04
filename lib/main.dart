import 'package:flutter/material.dart';
import 'Game.dart';
import 'SelectPlayer.dart';


main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectPlayer(),
      theme: ThemeData(
        fontFamily: 'AngryBirds'
      ),
    );
  }
}
