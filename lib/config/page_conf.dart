import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frame_conf/config/conf_controler.dart';
import 'package:frame_conf/simpleDialog/error_dialog.dart';
import 'package:frame_conf/untils/mycolors.dart';
import 'package:frame_conf/untils/wid_diseno.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../simpleDialog/loadingDialog.dart';

class PageConfig extends StatefulWidget {
  const PageConfig({Key? key}) : super(key: key);

  @override
  State<PageConfig> createState() => _PageConfigState();
}

class _PageConfigState extends State<PageConfig> {
  ConfControler conf = new ConfControler();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController naciController = TextEditingController();
  TextEditingController generoController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  String urlima = "";
  late String uid;
  User? usernya;
  @override
  void initState() {
    super.initState();
    usernya = _auth.currentUser;
    uid = usernya!.uid;
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot document) {
      print("Hola mundo:$document");
      setState(() {
        nameController.text = document["name"];
        emailController.text = document["email"];
        naciController.text = document["fechana"];
        generoController.text = document["genero"];
        passwordController.text = document["contraseña"];
        urlima = document["url"];
        print("Holi:$urlima");
      });
    });
    conf.init(context);
  }

  String userImageUri = '';
  File? imagen;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        WidDiseno(),
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _image(),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.all(0),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _selectImage(1);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color:
                                                      MyColors.primaryColor))),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            'Tomar foto',
                                            style: TextStyle(fontSize: 16),
                                          )),
                                          Icon(
                                            Icons.camera_alt,
                                            color: MyColors.azulColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _selectImage(2);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            'Seleccionar foto',
                                            style: TextStyle(fontSize: 16),
                                          )),
                                          Icon(
                                            Icons.photo_album,
                                            color: MyColors.azulColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: MyColors.primaryColor),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            'Cancelar',
                                            style: TextStyle(fontSize: 16),
                                            textAlign: TextAlign.center,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text('Cambiar foto de perfil',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ]),
              const SizedBox(
                height: 20.0,
              ),
              _textName(),
              const SizedBox(
                height: 20.0,
              ),
              _textEmail(),
              const SizedBox(
                height: 20.0,
              ),
              _textEdad(),
              const SizedBox(
                height: 20.0,
              ),
              _cambiarPassword(),
              const SizedBox(
                height: 100.0,
              ),
              _guardarCambios(),
              const SizedBox(
                height: 20.0,
              ),
              _closeSesion()
            ],
          ),
        )
      ],
    ));
  }

  Widget _image() {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return CircleAvatar(
      radius: _screenWidth * 0.10,
      backgroundColor: Colors.white12,
      backgroundImage: imagen == null ? null : FileImage(imagen!),
      child: imagen == null
          ? CircleAvatar(
              backgroundImage: NetworkImage(urlima),
              radius: 50,
              backgroundColor: Colors.grey[200],
            )
          : CircleAvatar(
              backgroundImage: FileImage(imagen!),
              radius: 50,
              backgroundColor: Colors.grey[200],
            ),
    );
  }

  /*Abrir galeria local y seleccionar imagen de usuario*/
  Future _selectImage(op) async {
    var pickedFile;
    if (op == 1) {
      pickedFile = await picker.getImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        showDialog(
            context: context,
            builder: (c) {
              return const ErrorAlertDialog(
                message: "Selecciona una imagen de perfil",
              );
            });
      }
    });
    Navigator.of(context).pop();
  }

  Widget _closeSesion() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.login_outlined,
              color: Color.fromARGB(255, 137, 166, 245),
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () => {
                _auth.signOut(),
                Navigator.pushNamedAndRemoveUntil(
                    context, 'login', (route) => false)
              },
              child: const Text('Cerrar sesión',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
  }

  Widget _guardarCambios() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Color.fromARGB(255, 137, 166, 245),
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                verificarDatos();
              },
              child: const Text('Guardar Cambios',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ));
  }

  void uploadStatusImage() async {
    String imageFileName = DateTime.now().microsecondsSinceEpoch.toString();

    Reference storageReference =
        FirebaseStorage.instance.ref().child("Usuarios");
    //UploadTask uploadTask = storageReference.child(imageFileName.toString()+".jpg").putFile(imagen!);

    TaskSnapshot taskSnapshot = await storageReference
        .child(imageFileName.toString() + ".jpg")
        .putFile(imagen!);

    var ImageUri = await taskSnapshot.ref.getDownloadURL();
    userImageUri = await ImageUri.toString();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({'url': userImageUri})
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
    print("Subir " + userImageUri);
  }

  Future<void> verificarDatos() async {
    if (imagen != null) {
      uploadStatusImage();
    }
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        naciController.text.isNotEmpty &&
        generoController.text.isNotEmpty) {
      uploadTo();
    } else {
      displayDialog("Debes llenar todos los campos!");
    }
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }

  late FirebaseFirestore db;

  uploadTo() async {
    showDialog(
        context: context,
        builder: (c) {
          return LoadingAlertDialog(
            message: "Guardando Datos...",
          );
        });
    print("uid " + uid);
    User? user = _auth.currentUser;

    user!.updatePassword(passwordController.text.trim());
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .update({
          'name': nameController.text.trim(),
          'fechana': naciController.text.trim(),
          'url': urlima,
          'contraseña': passwordController.text.trim()
        })
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
    Navigator.pop(context);
  }

  Widget _textName() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: nameController,
            decoration: InputDecoration(
              enabled: false,
              hintText: 'Nombre',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.person,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialognName();
          },
        ));
  }

  void _dialogEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese nuevo email'),
            content: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Correo Electronico',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.blueGrey,
                  )),
              keyboardType: TextInputType.emailAddress,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.emailEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  void _dialognName() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Nombre'),
            content: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: 'Nombre',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.nameEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  void _dialognPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Nueva contraseña'),
            content: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blueGrey,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  passwordController;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  void _dialognDate() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Ingrese Fecha de Nacimiento'),
            content: TextField(
              controller: naciController,
              decoration: const InputDecoration(
                  hintText: 'Fecha',
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blueGrey,
                  )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
              TextButton(
                onPressed: () {
                  conf.dateEditing;
                  _dismissDialog();
                },
                child: Text('Hecho'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  Widget _textEdad() {
    return Container(
        height: 40,
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: GestureDetector(
          child: TextField(
            style: TextStyle(color: Colors.white),
            controller: naciController,
            decoration: InputDecoration(
              enabled: false,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.person,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialognDate();
          },
        ));
  }

  Widget _textEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: emailController,
        decoration: InputDecoration(
          enabled: false,
          hintText: 'Correo electronico',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _cambiarPassword() {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: GestureDetector(
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white),
            controller: passwordController,
            decoration: InputDecoration(
              enabled: false,
              hintText: 'Contraseña',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.lock,
                color: MyColors.primaryColor,
              ),
            ),
          ),
          onTap: () {
            _dialognPassword();
          },
        ));
  }
}
