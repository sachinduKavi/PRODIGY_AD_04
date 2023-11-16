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


  List imageName = [];
  // Initializing image list with empty list items
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    for(int i = 0; i < 9; i++) {
      imageName.add("blank.png");
    }
  }

  void clickOnSq(int num) {
    setState(() {
      if(player01Turn) {
        imageName[num] = 'cancel.png';
      } else {
        imageName[num] = 'o.png';
      }
    });
    player01Turn = !player01Turn;
  }

  @override
  Widget build(BuildContext context) {
    print('$player1  $player2');
    double screenWidth = MediaQuery.of(context).size.width;
    double miniCon = (screenWidth-85)/3;
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 4),
                      child: Row(
                        children: [

                          InkWell(
                            onTap: () {
                              clickOnSq(0);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                color: const Color(0xFF231D1D),
                                image: DecorationImage(image: AssetImage('assets/images/${imageName[0]}'),
                                    fit: BoxFit.cover)
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              clickOnSq(1);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[1]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              clickOnSq(2);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[2]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              clickOnSq(3);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[3]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              clickOnSq(4);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[4]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              clickOnSq(5);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[5]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 8),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              clickOnSq(6);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[6]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              clickOnSq(7);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[7]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              clickOnSq(8);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 8, right: 4),
                              padding: const EdgeInsets.all(10),
                              width: miniCon,
                              height: miniCon,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF231D1D),
                                  image: DecorationImage(image: AssetImage('assets/images/${imageName[8]}'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
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
