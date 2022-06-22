import 'package:flutter/material.dart';
import 'package:frame_conf/tecnicas/meditacionlista.dart';
import 'package:lottie/lottie.dart';

class ConteoR1 extends StatefulWidget {
  ConteoR1({Key? key}) : super(key: key);

  @override
  State<ConteoR1> createState() => _ConteoR1State();
}

class _ConteoR1State extends State<ConteoR1> {
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
            child: Lottie.asset(
                "assets/images/96524-counting-to-number-three.json"),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: conteorList.length,
          itemBuilder: (context, index) {
            ConteoR conteor = conteorList[index];
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              color: Color.fromARGB(255, 196, 208, 245),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  conteor.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Spicy Pumpkin',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  conteor.descripcion,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                leading: Image.asset(conteor.imagen),
              ),
            );
          }),
    );
  }
}
