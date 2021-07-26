import 'package:flutter/material.dart';
import 'package:crud/pages/login_admin.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final contrasena1Controller = TextEditingController();
  final contrasena2Controller = TextEditingController();
  String usuario = 'admin';

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cambiar contraseña",
            style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),
          ),
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
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text("Crea una contraseña segura",
                style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            TextFormField(
              key: Key('contranueva1'),
              controller: contrasena1Controller,
              enableInteractiveSelection: false,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Nueva Contraseña",
                  icon: Icon(Icons.enhanced_encryption_outlined,
                      color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            SizedBox(height: 30),
            TextFormField(
              key: Key('contranueva2'),
              controller: contrasena2Controller,
              enableInteractiveSelection: false,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Repite Contraseña",
                  icon: Icon(Icons.enhanced_encryption_outlined,
                      color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            SizedBox(height: 40),
            new SizedBox(
              width: 170,
              height: 45,
              // ignore: deprecated_member_use
              child: RaisedButton(
                  key: Key('Boton'),
                  child: Text("Guardar Contraseña",
                      style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(contrasena1Controller.text);
                      if (contrasena1Controller.text ==
                          contrasena2Controller.text) {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return new LoginAdminPage(
                              'admin', contrasena2Controller.text);
                        }));
                      } else {
                        _onWillPopScore();
                      }
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("Acceso Denegado"),
              content: Text("Usuario Incorrecto, intenta nuevamente."),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Aceptar"),
                ),
              ],
            ),
        context: context);
  }
}
