import 'package:flutter/material.dart';

class LoginAdminPage extends StatefulWidget {
  static const String ROUTE = "/admin";

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final _formKey = GlobalKey<FormState>();

  final usuarioController = TextEditingController();

  final contrasenaController = TextEditingController();
  String usuario = 'admin';
  String contrasena = '12345678';

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Iniciar Sesión"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
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
                  labelText: "Contrasena",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            RaisedButton(
                child: Text("Inicia Sesion"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (usuarioController.text == usuario &&
                        contrasenaController.text == contrasena) {
                      print("Ingresa");
                      Navigator.of(context).pushNamed("/list");
                    } else {
                      _onWillPopScore();
                      print("usuario o contraseña incorrecta");
                    }
                  }
                })
          ]),
        ));
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("usuario o contraseña incorrecta"),
              content: Text("intenta nuevamente"),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("OK"),
                ),
              ],
            ),
        context: context);
  }
}
