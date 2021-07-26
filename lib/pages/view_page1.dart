import 'package:crud/models/evento.dart';
import 'package:flutter/material.dart';

class ViewPage1 extends StatefulWidget {
  @override
  _ViewPage1State createState() => _ViewPage1State();
}

class _ViewPage1State extends State<ViewPage1> {
  Widget build(BuildContext context) {
    Evento evento = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: _onWillPopScore,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            evento.nombre,
            style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _buildForm(evento),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(Evento evento) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Text("Organizador Evento:  " + evento.organizador,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Estilo:  " + evento.estilo,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Ciudad:  " + evento.ciudad,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Celular:  " + evento.celular,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Fecha:  " + evento.fecha,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Correo Electrónico:  " + evento.email,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Descripción:  " + evento.descripcion,
                style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
          ]),
        ));
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("¿Seguro que quieres regresar a la página anterior?",
                  style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No",
                      style:
                          TextStyle(fontFamily: 'CrimsonText', fontSize: 20)),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Si",
                      style:
                          TextStyle(fontFamily: 'CrimsonText', fontSize: 20)),
                )
              ],
            ),
        context: context);
  }
}
