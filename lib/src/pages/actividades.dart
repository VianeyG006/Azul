import 'package:frame_conf/memorama/memorama.dart';
import 'package:frame_conf/src/pages/home.dart';
import 'package:frame_conf/sudoku/SudokuWidget.dart';
import 'package:frame_conf/tecnicas/conteo.dart';
import 'package:frame_conf/tecnicas/listatecnicas.dart';
import 'package:frame_conf/tecnicas/musica.dart';
import 'package:frame_conf/tecnicas/relajacionp.dart';
import 'package:frame_conf/tecnicas/relajacionv.dart';
import 'package:frame_conf/tecnicas/respiracionp.dart';
import 'package:lottie/lottie.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Actividades extends StatefulWidget {
  @override
  State<Actividades> createState() => _Actividades();
}

class _Actividades extends State<Actividades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 137, 150, 245),
        //----------------Texto de Bienvenidos-------------------------
        title: const Center(
          child: Text(
            "Actividades",
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,

              //fontWeight: FontWeight.bold,
              fontFamily: "Spicy Pumpkin",
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(1)),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
              items: [
                //------------------Primer container
                InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/memorama.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Memorama()),
                    );
                  },
                ),

                //------------------Segundo container
                InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/sodoku.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SudokuWidget()),
                    );
                  },
                ),

                //------------------Tercer container
                InkWell(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            spreadRadius: 2.0,
                          )
                        ],
                        image: DecorationImage(
                          image: AssetImage("assets/images/gato.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                )
              ],
              options: CarouselOptions(
                height: 105.0,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(
                  seconds: 3,
                ),
                scrollDirection: Axis.horizontal,
              )),
          SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 800,
                child: ListView(
                  //scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 137, 150, 245),
                            width: 1),
                      ),
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          "Respiración profunda",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("meditacion"),

                        leading: Lottie.asset("assets/images/t1.json"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Respiracionp1()),
                            );
                          },
                        ),
                      ),
                    ),

                    Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 137, 150, 245),
                            width: 1),
                      ),
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          "Relajación con  visualización",
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("meditacion"),

                        leading: Lottie.asset("assets/images/t2.json"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RelajacionV1()),
                            );
                          },
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 137, 150, 245),
                            width: 1),
                      ),
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          "Conteo regresivo",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("meditacion"),

                        leading: Lottie.asset("assets/images/t3.json"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConteoR1()),
                            );
                          },
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 137, 150, 245),
                            width: 1),
                      ),
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          "Relajación progresiva",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("meditacion"),

                        leading: Lottie.asset("assets/images/t4.json"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RelajacionP1()),
                            );
                          },
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 137, 150, 245),
                            width: 1),
                      ),
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          "Escuchar música",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("meditacion"),

                        leading: Lottie.asset("assets/images/t5.json"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Musica1()),
                            );
                          },
                        ),
                      ),
                    ),
                    Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 137, 150, 245),
                            width: 1),
                      ),
                      margin: EdgeInsets.all(15),
                      child: ListTile(
                        title: Text(
                          "Meditación",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        // subtitle: Text("meditacion"),

                        leading: Lottie.asset("assets/images/t6.json"),
                        trailing: IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Listatecnicas()),
                            );
                          },
                        ),
                      ),
                    )

                    // tabs[_currentIndex]
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
