import 'package:flutter/material.dart';

class NotaW extends StatelessWidget {
  final String title;
  final String description;
  final String fecha;
  NotaW(
      {Key? key,
      required this.title,
      required this.description,
      required this.fecha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 249, 249, 250), //Color(0xffDCDCDC)

          //Color(0xffb6ffff),
        ),
        child: Column(
          children: [
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 8,
                right: 10,
                top: 5,
              ),
              height: 30,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "noticia",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              height: 110,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "noticia",
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.bottomEnd,
              width: double.infinity,
              margin: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              child: Text(
                fecha,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: "noticia",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
