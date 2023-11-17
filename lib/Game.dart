import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tak_toe/SelectPlayer.dart';

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
  // Player 01 and Player 02 score
  int player01Score = 0, player02Score = 0;
  List<List<int>> winCoordinates = [
    [0 ,1, 2],
    [3, 4, 5],
    [6, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  late BuildContext contexts;

  // Clicked containers
  List<int> player01 = [];
  List<int> player02 = [];


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

  // Display winner dialog prompt
  void showWinnerDialog(String playerName) {
    showDialog(context: contexts, builder: (BuildContext context) {
      return AlertDialog(
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          side: BorderSide(color: Colors.white, width: 4)
        ),
        backgroundColor: Colors.black,
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(playerName, style: const TextStyle(fontSize: 45, color: Color(0xFFFFAA3A)),),

              const Text("<<Wins>>", style: TextStyle(fontSize: 45, color: Color(0xFFFFAA3A)),),

              // Players score gains
              Padding(padding: const EdgeInsets.all(10), child: Text("$player1: 3 \\ $player2: 5", style: const TextStyle(fontSize: 20, color: Colors.white),)),

              // Button list for control the game
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Reset the game
                  IconButton(onPressed: (){

                  }, icon: const Icon(Icons.restart_alt_sharp, color: Colors.white, size: 45,)),

                  // Continue the game
                  IconButton(onPressed: (){

                  }, icon: const Icon(Icons.play_circle_outline_rounded, color: Colors.white, size: 45,)),

                  // Exit the game
                  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return SelectPlayer();
                    }));
                  }, icon: const Icon(Icons.exit_to_app, color: Colors.white, size: 45,)),
                ],
              )
            ],
          ),
        ),
      );
    });
  }

  void clickOnSq(int num) {
    int count;
    if(!player01.contains(num) && !player02.contains(num)){
      setState(() {
        if(player01Turn) {
          player01.add(num);
          imageName[num] = 'cancel.png';
        } else {
          player02.add(num);
          imageName[num] = 'o.png';
        }
      });

      // Checking for game winner
      for(List miniCoordinates in winCoordinates) {
        count = 0;
        for(int num in miniCoordinates) {
          if((player01Turn?player01:player02).contains(num)) {
            count++;
          } else {
            break;
          }
        }
        print('count $count');
        if(count >= 3) {
          showWinnerDialog("Sachindu");
          break;
        }
      }

      // Check for match draw
      if(player01.length + player02.length >= 9) {
        print("Draw Match");
      }else {
        player01Turn = !player01Turn;
      }
      // if(player01.)
    }
  }

  @override
  Widget build(BuildContext context) {
    contexts = context;
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
                              showWinnerDialog("Sachindu");
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
