import 'package:flutter/material.dart';
import 'package:frame_conf/src/pages/tabs_page.dart';
import 'package:lottie/lottie.dart';
import 'package:frame_conf/home_page2.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, left: 15, right: 15),
                child: Text(
                  "Puntuación Media: Tristeza moderada.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 137, 166, 245),
                      Color.fromARGB(255, 137, 139, 245),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Text(
                  "A pesar de que no parece que presentes depresión, compartes algunos síntomas con este trastorno del estado de ánimo. Quizás tan solo es un momento puntual de tristeza, sin embargo, es importante que prestes atención a tus sentimientos e intentes desarrollar tus fortalezas interiores. La terapia puede ser muy positiva para prevenir la depresión, recuerda consultar con un profesional.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                child: Lottie.asset(
                    "assets/images/99213-mental-wellbeing-seek-help.json"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TabsPage(),
                      ));
                },
                shape: StadiumBorder(),
                color: Color.fromARGB(255, 137, 166, 245),
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Salir",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
