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
  int player01Score = 0, player02Score = 0, drawCount = 0;
  List<List<int>> winCoordinates = [
    [0 ,1, 2],
    [3, 4, 5],
    [6, 7, 8],
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
    resetGame();
  }

  // Reset game to play again
  void resetGame() {
    setState(() {
      imageName.clear();
      for(int i = 0; i < 9; i++) {
        imageName.add("blank.png");
      }
      player01.clear();
      player02.clear();
    });
    print("$player01");
  }

  // Display winner dialog prompt
  void showDialogBox(String playerName, {bool draw = false}) {
    showDialog(context: contexts,
        barrierColor: const Color(0xB4000000),
        barrierDismissible: false,
        builder: (BuildContext context) {
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
              Text(draw?"Match Round":playerName, style: const TextStyle(fontSize: 45, color: Color(0xFFFFAA3A)),),

              Text(draw?"<<Draw>>":"<<Wins>>", style: const TextStyle(fontSize: 45, color: Color(0xFFFFAA3A)),),

              // Players score gains
              Padding(padding: const EdgeInsets.all(10), child: Text("$player1: $player01Score \\ $player2: $player02Score", style: const TextStyle(fontSize: 20, color: Colors.white),)),

              // Button list for control the game
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Reset the game
                  IconButton(onPressed: (){
                    // Full reset the game
                    player01Score = 0;
                    player02Score = 0;
                    drawCount = 0;
                    player01Turn = true;
                    resetGame();
                    Navigator.of(context).pop();

                  }, icon: const Icon(Icons.restart_alt_sharp, color: Colors.white, size: 45,)),

                  // Continue the game
                  IconButton(onPressed: (){
                    // Changing display names X and O
                    if(player01Turn){
                      player01Turn = false;
                    } else {
                      player01Turn = true;
                    }
                    Navigator.of(context).pop();
                    resetGame();
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
    bool winStatus = false;
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
        if(count >= 3) {
          winStatus = true;
          if(player01Turn){
            player01Score++;
          }else {
            player02Score++;
          }
          showDialogBox(player01Turn?player1:player2);
          break;
        }
      }

      // Check for match draw
      if(!winStatus){
        if(player01.length + player02.length >= 9) {
          drawCount++;
          showDialogBox("", draw: true);
        }else {
          player01Turn = !player01Turn;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    contexts = context;
    double screenWidth = MediaQuery.of(context).size.width;
    double miniCon = (screenWidth-85)/3;
    return Scaffold(
      backgroundColor: const Color(0xFF0E2127),
      body: Stack(
        children: [
          // Player turn icon
          Container(
              margin: const EdgeInsets.all(50),
              alignment: Alignment.topCenter,
              child: Column(children: [

                Icon(player01Turn?Icons.close:Icons.circle_outlined, color: Colors.white, size: 60, weight: 1,),

                const Text("Turn", style: TextStyle(fontSize: 30, color: Colors.red),)
              ]
            )),

          Center(
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

          // Score Board
          Container(
          padding: const EdgeInsets.all(25),
          alignment: Alignment.bottomRight,
          height: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children:[

                Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 120,child: Text(player1, style: const TextStyle(color: Color(0xFFFFAA3A), fontSize: 22),),),
                  SizedBox(width: 120,child: Text(player2, style: const TextStyle(color: Color(0xFFFFAA3A), fontSize: 22),),),
                  const SizedBox(width: 120, child: Text("Draw", style: TextStyle(color: Colors.red, fontSize: 22),)),
                ],
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 45,child: Text(player01Score.toString(), style: const TextStyle(color: Color(0xFFFFAA3A), fontSize: 22),),),
                  SizedBox(width: 45,child: Text(player02Score.toString(), style: const TextStyle(color: Color(0xFFFFAA3A), fontSize: 22),),),
                  SizedBox(width: 45, child: Text(drawCount.toString(), style: const TextStyle(color: Colors.red, fontSize: 22),)),
                ],
              ),

          ]
          ),
        ),


        ]
      ),
    );
  }
}
