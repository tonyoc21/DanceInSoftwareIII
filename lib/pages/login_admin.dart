import 'package:flutter/material.dart';

class LoginAdminPage extends StatefulWidget {
  static const String ROUTE = '/admin';

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
          title: const Text(
            'Iniciar Sesión',
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
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 150),
            TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'No ha ingresado dato';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Usuario',
                  icon: Icon(Icons.person, color: Colors.red[900]),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: contrasenaController,
              enableInteractiveSelection: false,
              obscureText: true,
              validator: (value) {
                if (value.isEmpty) {
                  return 'No ha ingresado dato';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  icon: Icon(Icons.enhanced_encryption_outlined,
                      color: Colors.red[900]),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
            ),
            const SizedBox(height: 40),
            // ignore: unnecessary_new
            new SizedBox(
              width: 170,
              height: 45,
              // ignore: deprecated_member_use
              child: RaisedButton(
                  // ignore: sort_child_properties_last
                  child: const Text('Entrar',
                      style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (usuarioController.text == usuario &&
                          contrasenaController.text == contrasena) {
                        Navigator.of(context).pushNamed('/list');
                      } else {
                        _onWillPopScore();
                      }
                    }
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
              title: const Text('Acceso Denegado'),
              content: const Text(
                  'Usuario o Contraseña incorrecta. Intente nuevamente.'),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Aceptar'),
                ),
              ],
            ),
        context: context);
  }
}
