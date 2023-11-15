import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {

  String player1, player2;
  Game(this.player1, this.player2, {super.key});

  @override
  State<Game> createState() => _GameState(this.player1, this.player2);
}

class _GameState extends State<Game> {
  String player1, player2;
  _GameState(this.player1, this.player2);
  bool player01Turn = true;

  @override
  Widget build(BuildContext context) {
    print('$player1  $player2');
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF0E2127),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Player 01 name
            Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              child: AnimatedDefaultTextStyle(style: player01Turn? const TextStyle(
                color: Color(0xFFFFAA3A),
                fontSize: 56,
                fontFamily: 'AngryBirds'
              ):
              const TextStyle(color: Color(0xFFB7B7B7), fontSize: 35, fontFamily: 'AngryBirds'),
              duration: const Duration(milliseconds: 500),
                child: Text(player1),),
            ),

            // Game board
            SizedBox(
              width: double.infinity,
              height: screenWidth,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF584D4D),
                  border: Border.all(color: Colors.white, width: 4)
                ),
              ),
            ),

            // Player 02 name
            Container(
              alignment: Alignment.topCenter,
              height: 100,
              child: AnimatedDefaultTextStyle(style: !player01Turn? const TextStyle(
                    color: Color(0xFFFFAA3A),
                    fontSize: 56,
                    fontFamily: 'AngryBirds'
                ):
                const TextStyle(color: Color(0xFFB7B7B7), fontSize: 35, fontFamily: 'AngryBirds'),
                duration: const Duration(milliseconds: 500),
                child: Text(player2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
