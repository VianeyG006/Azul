import 'package:flutter/material.dart';
import 'package:frame_conf/tecnicas/meditacionlista.dart';
import 'package:lottie/lottie.dart';

class RelajacionV1 extends StatefulWidget {
  RelajacionV1({Key? key}) : super(key: key);

  @override
  State<RelajacionV1> createState() => _RelajacionV1State();
}

class _RelajacionV1State extends State<RelajacionV1> {
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
            child: Lottie.asset("assets/images/23659-love.json"),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: relajacionvList.length,
          itemBuilder: (context, index) {
            RelajacionV relajacionv = relajacionvList[index];
            return Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              color: Color.fromARGB(255, 196, 208, 245),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  relajacionv.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Spicy Pumpkin',
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  relajacionv.descripcion,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                leading: Image.asset(relajacionv.imagen),
              ),
            );
          }),
    );
  }
}
