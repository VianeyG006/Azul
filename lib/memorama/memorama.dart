import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frame_conf/memorama/gamelogic.dart';
import 'package:frame_conf/memorama/points.dart';

class Memorama extends StatefulWidget {
  Memorama({Key? key}) : super(key: key);

  @override
  State<Memorama> createState() => _MemoramaState();
}

class _MemoramaState extends State<Memorama> {
  Game _game = Game();
  int tries = 0;
  int score = 0;
  @override
  void initState() {
    _game.initGame();
    super.initState();
  }

  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 137, 166, 245),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "MEMORAMA",
              style: TextStyle(
                  fontSize: 48.0,
                  color: Colors.black,
                  fontFamily: 'Spicy Pumpkin'),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreBoard("Intentos", "${tries}"),
              scoreBoard("Puntuacion", "${score}")
            ],
          ),
          SizedBox(
            height: screen_width,
            width: screen_width,
            child: GridView.builder(
                itemCount: _game.gameIng!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                padding: EdgeInsets.all(16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(_game.cards_list[index]);
                      setState(() {
                        tries++;
                        _game.gameIng![index] = _game.cards_list[index];
                        _game.matchCheck.add({index: _game.cards_list[index]});
                      });
                      if (_game.matchCheck.length == 2) {
                        if (_game.matchCheck[0].values.first ==
                            _game.matchCheck[1].values.first) {
                          print("true");
                          score += 100;
                          _game.matchCheck.clear();
                        } else {
                          print(false);
                          Future.delayed(Duration(milliseconds: 500), () {
                            print(_game.gameIng);
                            setState(() {
                              _game.gameIng![_game.matchCheck[0].keys.first] =
                                  _game.hiddenCardpath;
                              _game.gameIng![_game.matchCheck[1].keys.first] =
                                  _game.hiddenCardpath;
                              _game.matchCheck.clear();
                            });
                          });
                        }
                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(_game.gameIng![index]),
                              fit: BoxFit.cover,
                            ))),
                  );
                }),
          )
        ],
      ),
    );
  }
}
