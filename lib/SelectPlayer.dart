import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Game.dart';

class SelectPlayer extends StatelessWidget {
  TextEditingController player01Controller = TextEditingController();
  TextEditingController player02Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main Game layer
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tic tak toe heading
            const Center(child: Text("Tic Tak Toe", style: TextStyle(color: Color(0xFFFFAA3A), fontSize: 71))),

            // Container to get name of two players
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white, width: 5),
                color: const Color(0xFF5D5555)
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(style: const TextStyle(color: Colors.white, fontSize: 22),
                      cursorColor: Colors.white,
                      maxLength: 10,
                      controller: player01Controller,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(hintText: "Player 01",
                        filled: true,
                        counter: Offstage(),
                        fillColor: Colors.black,
                        hintStyle: TextStyle(color: Color(0xFFBFBFBF)),
                        prefixIcon: Icon(Icons.close, color: Colors.white, size: 35,),
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),

                      ),
                        ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(style: const TextStyle(color: Colors.white, fontSize: 22),
                        maxLength: 10,
                        controller: player02Controller,
                        cursorColor: Colors.white,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(hintText: "Player 02",
                            filled: true,
                            counter: Offstage(),
                            fillColor: Colors.black,
                            hintStyle: TextStyle(color: Color(0xFFBFBFBF)),
                            prefixIcon: Icon(Icons.circle_outlined, color: Colors.white, size: 35,),
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2, color: Colors.white),
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            )
                        ),
                      ),
                    ),
                    // Forwarding to the game on tap play ...
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                          return Game(player01Controller.text.toString(), player02Controller.text.toString())  ;
                        }));
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: Text("<<Play>>", style: TextStyle(color: Colors.white, fontSize: 45),)),
                    )
                  ],
                ),



              ),
          ],
        ),

          Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(20),
              height: double.infinity,
              child: InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse("https://www.linkedin.com/in/sachindukavishka7070/");
                    await launchUrl(url);
                  },
                  child: const Text("Developed by Sachindu Kavishka", style: TextStyle(color: Colors.white, fontSize: 15),)))
      ]
      ),
      backgroundColor: const Color(0xFF0E2127),
    );
  }
}
