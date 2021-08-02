import 'package:flutter/material.dart';

class LoginAdminPage extends StatefulWidget {
  static const String ROUTE = "/admin";

  String usuario;
  String contrasena;

  LoginAdminPage(this.usuario, this.contrasena);

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final contrasenaController = TextEditingController();

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Iniciar Sesión",
              style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Image.asset('assets/Login.jpg'),
                height: 150,
                width: 120,
              ),
              Container(
                child: _buildForm(),
              ),
            ],
          )),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            TextFormField(
              key: Key('nombreAdmin'),
              controller: usuarioController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Usuario",
                  icon: Icon(Icons.person, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            SizedBox(height: 30),
            TextFormField(
              key: Key('contraAdmin'),
              controller: contrasenaController,
              enableInteractiveSelection: false,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Contraseña",
                  icon: Icon(Icons.enhanced_encryption_outlined,
                      color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            SizedBox(height: 40),
            new SizedBox(
              width: 170,
              height: 45,
              child: RaisedButton(
                  key: Key('EntrarBoton'),
                  child: Text("Entrar",
                      style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (usuarioController.text == widget.usuario &&
                          contrasenaController.text == widget.contrasena) {
                        Navigator.of(context).pushNamed("/choose");
                      } else {
                        _onWillPopScore();
                      }
                    }
                  }),
            ),
            SizedBox(height: 10),
            new SizedBox(
              width: 250,
              height: 20,
              child: RaisedButton(
                  key: Key('OlvidarBoton'),
                  child: Text("¿Has olvidado tu contraseña?",
                      style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                  color: Colors.white,
                  splashColor: Colors.grey[900],
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/choosePassword");
                  }),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("Acceso Denegado"),
              content:
                  Text("Usuario o Contraseña incorrecta. Intente nuevamente."),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Aceptar"),
                ),
              ],
            ),
        context: context);
  }
}
