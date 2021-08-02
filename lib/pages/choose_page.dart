import 'package:flutter/material.dart';

class ChoosePagee extends StatefulWidget {
  @override
  _ChoosePageeState createState() => _ChoosePageeState();
}

class _ChoosePageeState extends State<ChoosePagee> {
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScore,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Gestión de Servicios",
              style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: Image.asset('assets/LogoBlanco.png'),
                height: 250,
                width: 420,
              ),
              Container(
                child: _buildForm(),
              ),
            ],
          ),),
    );
  }

  Widget _buildForm() {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 50),
        Text("¿Qué servicio desea gestionar?",
            style: TextStyle(
                fontFamily: 'CrimsonText',
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 30),
        new SizedBox(
          width: 170,
          height: 45,
          // ignore: deprecated_member_use
          child: RaisedButton(
              key: Key('EntrarAcademiasButon'),
              child: Text("Academias",
                  style: TextStyle(
                      fontFamily: 'CrimsonText',
                      fontSize: 21.5,
                      fontWeight: FontWeight.bold)),
              color: Colors.red[900],
              splashColor: Colors.grey[900],
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, "/list");
              }),
        ),
        SizedBox(height: 20),
        new SizedBox(
            width: 170,
            height: 45,
            // ignore: deprecated_member_use
            child: RaisedButton(
              key: Key('EntrarEventosButon'),
                child: Text("Eventos",
                    style: TextStyle(
                        fontFamily: 'CrimsonText',
                        fontSize: 21.5,
                        fontWeight: FontWeight.bold)),
                color: Colors.red[900],
                splashColor: Colors.grey[900],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, "/list1");
                }))
      ]),
    );
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("¿Seguro que quieres regresar a la página anterior?"),
              content: Text("Podría tener cambios sin guardar"),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Si"),
                )
              ],
            ),
        context: context);
  }
}
