import 'package:flutter/material.dart';
import 'package:frame_conf/tecnicas/meditacionlista.dart';
import 'package:lottie/lottie.dart';

class Respiracionp1 extends StatefulWidget {
  Respiracionp1({Key? key}) : super(key: key);

  @override
  State<Respiracionp1> createState() => _Respiracionp1State();
}

class _Respiracionp1State extends State<Respiracionp1> {
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
            child: Lottie.asset("assets/images/breathing.json"),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: respiracionpList.length,
          itemBuilder: (context, index) {
            RespiracionP respiracionp = respiracionpList[index];
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              color: Color.fromARGB(255, 196, 208, 245),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  respiracionp.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Spicy Pumpkin',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  respiracionp.descripcion,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                leading: Image.asset(respiracionp.imagen),
              ),
            );
          }),
    );
  }
}
