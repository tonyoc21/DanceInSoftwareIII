
import 'package:crud/models/academia.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  Widget build(BuildContext context) {
    Academia academia = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: _onWillPopScore,
      child: Scaffold(
        appBar: AppBar(
          title: Text(academia.nombre,  style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _buildForm(academia),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(Academia academia) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Text("Estilo de Baile:  " + academia.estilo,  style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Ciudad:  " + academia.ciudad, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Celular:  " + academia.celular, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Correo Electrónico:  " + academia.email, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Teléfono:  " + academia.telefono, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
            Text("Descripción:  " + academia.descripcion, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            SizedBox(height: 15),
          ]),
        ));
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("¿Seguro que quieres regresar a la página anterior?",  style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No",  style: TextStyle(fontFamily: 'CrimsonText', fontSize: 20)),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Si",  style: TextStyle(fontFamily: 'CrimsonText', fontSize: 20)),
                )
              ],
            ),
        context: context);
  }
}
