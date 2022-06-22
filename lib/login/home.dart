import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frame_conf/models/nota.dart';
import 'package:frame_conf/src/widgets/notas_w.dart';
import 'package:frame_conf/values/tema.dart';
import 'package:flutter/material.dart';
import 'package:frame_conf/login/userservices.dart';
import 'package:intl/intl.dart';

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
  late String id;
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
              MaterialPageRoute(
                  builder: (context) => ModalNota(
                        ID: "",
                      )),
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
                    return GestureDetector(
                      child: NotaW(
                        title: (data as dynamic)["title"],
                        description: (data as dynamic)["body"],
                        fecha: (data as dynamic)["fecha"],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ModalNota(
                                      ID: docs[i].id,
                                    )));
                      },
                      onLongPress: () {
                        id = docs[i].id;
                        this._borrarPersona(context);
                      },
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

  _borrarPersona(context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Nota"),
              content: Text("¿Esta seguro de que quiere eliminar esta nota"),
              actions: [
                TextButton(onPressed: _dismissDialog, child: Text("Cancelar")),
                TextButton(
                    onPressed: () async {
                      print("ID de la nota" + id);
                      this.setState(() {});
                      bool respuesta = await UserServices().eliminarNota(id);

                      if (respuesta) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nota correctamente eliminada'),
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
                    },
                    child: Text(
                      "Borrar",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ));
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
}

class ModalNota extends StatefulWidget {
  final String ID;
  ModalNota({required this.ID});
  @override
  State<ModalNota> createState() => _ModalNotaState(ID: ID);
}

class _ModalNotaState extends State<ModalNota> {
  final String ID;
  _ModalNotaState({
    required this.ID,
  });
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late String formatted = formatter.format(now);
  @override
  void initState() {
    super.initState();
    if (ID != "") {
      FirebaseFirestore.instance
          .collection("notas")
          .doc(ID)
          .get()
          .then((DocumentSnapshot document) {
        print("Hola mundo:$document");
        setState(() {
          _tituloController.text = document["title"];
          _contenidoController.text = document["body"];
          formatted = document["fecha"];
        });
      });
    }
  }

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
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Fecha: " + formatted,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontFamily: 'Noticia',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Titulo de la Nota',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontFamily: 'Noticia',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white70)),
                  child: TextFormField(
                      controller: _tituloController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es requerido';
                        }
                      }),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Contenido',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                    fontFamily: 'Noticia',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white70)),
                  child: TextFormField(
                      controller: _contenidoController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      maxLines: 20,
                      validator: (String? dato) {
                        if (dato!.isEmpty) {
                          return 'Este campo es requerido';
                        }
                      }),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          bool respuesta;
                          if (ID == "") {
                            respuesta = await UserServices().saveNotas(
                              _tituloController.text,
                              _contenidoController.text,
                              usernya,
                            );
                          } else {
                            respuesta = await UserServices().updateNotas(
                                ID,
                                _tituloController.text,
                                _contenidoController.text,
                                usernya);
                          }

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
