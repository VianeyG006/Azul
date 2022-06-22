import 'package:flutter/material.dart';
import 'package:frame_conf/tecnicas/meditacionlista.dart';
import 'package:lottie/lottie.dart';

class Listatecnicas extends StatefulWidget {
  Listatecnicas({Key? key}) : super(key: key);

  @override
  State<Listatecnicas> createState() => _ListatecnicasState();
}

class _ListatecnicasState extends State<Listatecnicas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(190),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 137, 166, 245),
                  Color.fromARGB(255, 137, 139, 245),
                ],
              ),
            ),
            child: Lottie.asset("assets/images/meditation.json"),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            Meditacion meditacion = movieList[index];
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              color: Color.fromARGB(255, 196, 208, 245),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  meditacion.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Spicy Pumpkin',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  meditacion.descripcion,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                leading: Image.asset(meditacion.imagen),
              ),
            );
          }),
    );
  }
}
