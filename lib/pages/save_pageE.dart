import 'package:crud/db/operation1.dart';
import 'package:crud/models/evento.dart';
import 'package:flutter/material.dart';

class SavePage1 extends StatefulWidget {
  @override
  _SavePage1State createState() => _SavePage1State();
}

class _SavePage1State extends State<SavePage1> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();

  final organizadorController = TextEditingController();

  final estiloController = TextEditingController();

  final ciudadController = TextEditingController();

  final celularController = TextEditingController();

  final fechaController = TextEditingController();

  final emailController = TextEditingController();

  final descripcionController = TextEditingController();

  Widget build(BuildContext context) {
    Evento evento = ModalRoute.of(context).settings.arguments;
    _init(evento);

    return WillPopScope(
      onWillPop: _onWillPopScore,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agregar Evento", style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _buildForm(evento),
          ),
        ),
      ),
    );
  }

  _init(Evento evento) {

    nombreController.text = evento.nombre;
    organizadorController.text = evento.organizador;
    estiloController.text = evento.estilo;
    ciudadController.text = evento.ciudad;
    celularController.text = evento.celular;
    fechaController.text = evento.fecha;
    emailController.text = evento.email;
    descripcionController.text = evento.descripcion;
  }

  Widget _buildForm(Evento evento) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: nombreController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Nombre Evento",
                  icon: Icon(Icons.article_outlined, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: organizadorController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Organizador Evento",
                  icon: Icon(Icons.person, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: estiloController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Estilo de Baile",
                  icon: Icon(Icons.directions_run_rounded, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: ciudadController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Ciudad",
                  icon: Icon(Icons.location_pin, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),            
            SizedBox(height: 15),
            TextFormField(
              controller: celularController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              maxLength: 10,
              decoration: InputDecoration(
                  labelText: "Celular",
                  icon: Icon(Icons.phone_android, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: fechaController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Fecha Evento",
                  icon: Icon(Icons.date_range, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Correo Electrónico",
                  icon: Icon(Icons.email_rounded, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: descripcionController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              maxLines: 8,
              maxLength: 1000,
              decoration: InputDecoration(
                  labelText: "Descripción Evento",
                  icon: Icon(Icons.note_rounded, color: Colors.red[900]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            new SizedBox(
                width: 130,
                height: 45,
                child: RaisedButton(
                child: Text("Guardar", style: TextStyle(fontFamily: 'CrimsonText', fontSize: 24, fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (evento.id != null) {
                      evento.nombre = nombreController.text;
                      evento.organizador = organizadorController.text;
                      evento.estilo = estiloController.text;
                      evento.ciudad = ciudadController.text;
                      evento.celular = celularController.text;
                      evento.fecha = fechaController.text;
                      evento.email = emailController.text;
                      evento.descripcion = descripcionController.text;
                      Operation1.update(evento);
                    } else {
                      Operation1.insert(Evento(
                          nombre: nombreController.text,
                          organizador: organizadorController.text,
                          estilo: estiloController.text,
                          ciudad: ciudadController.text,
                          celular: celularController.text,
                          fecha: fechaController.text,
                          email: emailController.text,
                          descripcion: descripcionController.text));
                    }
                    print("El evento llamado: " +
                        nombreController.text +
                        " agregado con éxito");
                  }
                }
              )
            )
          ]),
      )
    );
  }

  Future<bool> _onWillPopScore() {
    return showDialog<bool>(
        builder: (context) => AlertDialog(
              title: Text("¿Seguro que quieres regresar a la página anterior?"),
              content: Text("Podría tener cambios sin guardar"),
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
