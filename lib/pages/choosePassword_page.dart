import 'package:flutter/material.dart';

class ChoosePasswordPage extends StatefulWidget {
  @override
  _ChoosePasswordPageState createState() => _ChoosePasswordPageState();
}

class _ChoosePasswordPageState extends State<ChoosePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final usuarioController = TextEditingController();
  String usuario = 'admin';

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Recupera contraseña",
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
            Text("Ingresa usuario para recuperar contraseña?",
                style: TextStyle(
                    fontFamily: 'CrimsonText',
                    fontSize: 26,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 45),
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
            SizedBox(height: 40),
            new SizedBox(
              width: 170,
              height: 45,
              // ignore: deprecated_member_use
              child: RaisedButton(
                  key: Key('Boton'),
                  child: Text("Verifica",
                      style: TextStyle(
                          fontFamily: 'CrimsonText',
                          fontSize: 22.5,
                          fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (usuarioController.text == usuario) {
                        Navigator.of(context).pushNamed("/password");
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
