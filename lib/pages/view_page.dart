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
          title: Text(
            academia.nombre,
            style: const TextStyle(fontSize: 35, fontFamily: 'DancingScript'),
          ),
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
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(children: <Widget>[
            const SizedBox(height: 20),
            Text('Estilo de Baile:  ${academia.estilo}',
                style:
                    const TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            const SizedBox(height: 15),
            Text('Ciudad:  ${academia.ciudad}',
                style:
                    const TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            const SizedBox(height: 15),
            Text('Celular: ${academia.celular}',
                style:
                    const TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            const SizedBox(height: 15),
            Text('Correo Electrónico:  ${academia.email}',
                style:
                    const TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            const SizedBox(height: 15),
            Text('Teléfono:  ${academia.telefono}',
                style:
                    const TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            const SizedBox(height: 15),
            Text('Descripción:  ${academia.descripcion}',
                style:
                    const TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
            const SizedBox(height: 15),
          ]),
        ));
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: const Text(
                  '¿Seguro que quieres regresar a la página anterior?',
                  style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25)),
              actions: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No',
                      style:
                          TextStyle(fontFamily: 'CrimsonText', fontSize: 20)),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Si',
                      style:
                          TextStyle(fontFamily: 'CrimsonText', fontSize: 20)),
                )
              ],
            ),
        context: context);
  }
}
