import 'package:flutter/material.dart';

class RegistroPage1 extends StatefulWidget {
  RegistroPage1({Key? key}) : super(key: key);

  @override
  State<RegistroPage1> createState() => _RegistroPage1State();
}

class _RegistroPage1State extends State<RegistroPage1> {
  String _fecha = '';
  TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.0,
              ),
              _nombreTextField(),
              SizedBox(
                height: 10,
              ),
              _fechaTextField(context),
              SizedBox(
                height: 15,
              ),
              _generoTextField(),
              SizedBox(
                height: 20,
              ),
              _correoTextField(),
              SizedBox(
                height: 25,
              ),
              _contrasenaTextField(),
              SizedBox(
                height: 30.0,
              ),
              _confcontrasenaTextField(),
              SizedBox(
                height: 35.0,
              ),
              _buttonLogin(),
              SizedBox(
                height: 40.0,
              ),
              _buttonRegistrar(),
              SizedBox(
                height: 45.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nombreTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: 'Jazmin Nicolas',
            labelText: 'Nombre',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _fechaTextField(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          enableInteractiveSelection: false,
          controller: _textController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.perm_contact_calendar),
            hintText: '12/12/2022',
            labelText: 'Fecha de nacimiento',
          ),
          onChanged: (value) {},
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selecFecha(context);
          },
        ),
      );
    });
  }

  _selecFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2003),
      lastDate: DateTime(2022),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();

        _textController.text = _fecha;
      });
    }
  }

  Widget _generoTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.supervised_user_circle),
            hintText: 'Hombre o Mujer',
            labelText: 'Genero',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _correoTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electronico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _contrasenaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _confcontrasenaTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Confirmar Contraseña',
            labelText: 'Confirmar Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Iniciar Sesión',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Color.fromARGB(255, 137, 166, 245),
          onPressed: () {});
    });
  }

  Widget _buttonRegistrar() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text(
              'Registrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10.0,
          color: Color.fromARGB(255, 137, 166, 245),
          onPressed: () {});
    });
  }
}
