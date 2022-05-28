import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frame_conf/models/nota.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  Future<List<Nota>> getNotas(String uid) async {
    List<Nota> misNotas = [];
    FirebaseFirestore.instance
        .collection("notas")
        .doc(uid)
        .get()
        .then((DocumentSnapshot document) {
      print("Hola mundo:$document");

      Nota nuevaNota = Nota(
        contenido: document['body'],
        key: document['uid'],
        titulo: document['title'],
      );
      misNotas.add(nuevaNota);
    });
    return misNotas;
    /*try {
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      DataSnapshot snap = await ref.child('notas').get();

      if (snap.value != null) {
        print(snap.value);
        snap.value;
        ((key, value) {
          Map mapa = {'key': key, ...value};
          Nota nuevaNota = Nota(
            contenido: mapa['body'],
            key: mapa['key'],
            titulo: mapa['title'],
          );
          misNotas.add(nuevaNota);
        });
      }
      return misNotas;
    } catch (e) {
      return misNotas;
    }*/
  }

  Future<bool> saveNotas(
      String titulo, String contenido, User firebaseUser) async {
    try {
      FirebaseFirestore.instance.collection('notas').doc().set({
        'uid': firebaseUser.uid,
        'title': titulo,
        'body': contenido,
      });
      /*await FirebaseDatabase.instance
          .reference()
          .child('notas')
          .push()
          .set({'title': titulo, 'body': contenido});*/
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> eliminarNota(String key) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child('notas')
          .child(key)
          .remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
