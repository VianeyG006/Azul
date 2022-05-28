import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frame_conf/models/nota.dart';
import 'package:frame_conf/src/widgets/notas_w.dart';
import 'package:frame_conf/values/tema.dart';
import 'package:flutter/material.dart';
import 'package:frame_conf/login/userservices.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get child => null;
  List<Nota> dataList = [];
  late PageController _controller;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String urlima = "";
  late String uid;
  get index => null;
  @override
  void initState() {
    super.initState();
    final User? usernya = _auth.currentUser;
    uid = usernya!.uid;
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/fondo4.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 137, 150, 245),
          title: const Text(
            'Mi Diario <3',
            style: TextStyle(fontFamily: "Spicy Pumpkin", fontSize: 25),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ModalNota()),
            );
            /*showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ModalNota();
                });*/
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("notas")
              .where("uid", isEqualTo: uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            //tenemos data
            List<DocumentSnapshot> docs = snapshot.data.docs;
            return Container(
              child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (_, i) {
                    Object? data = docs[i].data();
                    print("___________");
                    print(data);
                    return NotaW(
                      title: (data as dynamic)["title"],
                      description: (data as dynamic)["body"],
                    );
                    /*ListTile(
                          title: Text((data as dynamic)["titulo"]),
                        );*/
                  }),
            );
          },
        ),
        /*FutureBuilder(
          future: UserServices().getNotas(uid),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            List misnotas = snapshot.data ?? [];
            return ListView(
              children: [
                for (Nota nota in misnotas)
                  ListTile(
                    title: Text(nota.titulo.toString()),
                    subtitle: Text(nota.contenido.toString()),
                    /* trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.blue),
                      onPressed: (){
                        estado!.deleteNota(nota.key);
                      },
                      ),*/
                  ),
              ],
            );
          },
        ),*/
      ),
    );
  }
}

class ModalNota extends StatefulWidget {
  @override
  State<ModalNota> createState() => _ModalNotaState();
}

class _ModalNotaState extends State<ModalNota> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final User? usernya = _auth.currentUser;
    String uid = usernya!.uid;
    return Container(
      color: french,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formularioKey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                    controller: _tituloController,
                    decoration:
                        const InputDecoration(labelText: 'Titulo de la nota'),
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                    }),
                TextFormField(
                    controller: _contenidoController,
                    decoration: const InputDecoration(labelText: 'Contenido'),
                    maxLines: 10,
                    validator: (String? dato) {
                      if (dato!.isEmpty) {
                        return 'Este campo es requerido';
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          bool respuesta = await UserServices().saveNotas(
                            _tituloController.text,
                            _contenidoController.text,
                            usernya,
                          );

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Nota agregada correctamente'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('algo salio mal'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                        // Navigator.pop(context);
                        //agrega
                      },
                      child: const Text('Aceptar'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                  ],
                )
              ],
            )),
          )),
    );
    @override
    void dispose() {
      _contenidoController.dispose();
      _tituloController.dispose();
      super.dispose();
    }
  }
}
