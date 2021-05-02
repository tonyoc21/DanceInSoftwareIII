import 'package:crud/db/operation.dart';
import 'package:crud/models/academia.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    Academia academia = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
      onWillPop: _onWillPopScore,
      child: Scaffold(
        appBar: AppBar(
          title: Text(academia.nombre),
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
          key: _formKey,
          child: Column(children: <Widget>[
            Text(academia.descripcion),
            SizedBox(height: 15),
            Text(academia.estilo),
            SizedBox(height: 15),
            Text(academia.ciudad),
            SizedBox(height: 15),
            Text(academia.celular),
            SizedBox(height: 15),
            Text(academia.email),
            SizedBox(height: 15),
          ]),
        ));
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("¿Seguro que quieres regresar a la página anterior?"),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("Si"),
                )
              ],
            ),
        context: context);
  }
}
