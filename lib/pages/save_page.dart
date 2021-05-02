import 'package:crud/db/operation.dart';
import 'package:crud/models/academia.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();

  final estiloController = TextEditingController();

  final ciudadController = TextEditingController();

  final telefonoController = TextEditingController();

  final celularController = TextEditingController();

  final emailController = TextEditingController();

  final descripcionController = TextEditingController();

  Widget build(BuildContext context) {
    Academia academia = ModalRoute.of(context).settings.arguments;
    _init(academia);

    return WillPopScope(
      onWillPop: _onWillPopScore,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Agregar Academia"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: _buildForm(academia),
          ),
        ),
      ),
    );
  }

  _init(Academia academia) {
    nombreController.text = academia.nombre;
    estiloController.text = academia.estilo;
    ciudadController.text = academia.ciudad;
    telefonoController.text = academia.telefono;
    celularController.text = academia.celular;
    emailController.text = academia.email;
    descripcionController.text = academia.descripcion;
  }

  Widget _buildForm(Academia academia) {
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
                  labelText: "Nombre Academia",
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
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: telefonoController,
              validator: (value) {
                if (value.isEmpty) {
                  return "No ha ingresado dato";
                }
                return null;
              },
              maxLength: 7,
              decoration: InputDecoration(
                  labelText: "Teléfono",
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
              //maxLines: 8,
              maxLength: 1000,
              decoration: InputDecoration(
                  labelText: "Descripción Academia",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
            RaisedButton(
                child: Text("Guardar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (academia.id != null) {
                      academia.nombre = nombreController.text;
                      academia.estilo = estiloController.text;
                      academia.ciudad = ciudadController.text;
                      academia.telefono = telefonoController.text;
                      academia.celular = celularController.text;
                      academia.email = emailController.text;
                      academia.descripcion = descripcionController.text;
                      Operation.update(academia);
                    } else {
                      Operation.insert(Academia(
                          nombre: nombreController.text,
                          estilo: estiloController.text,
                          ciudad: ciudadController.text,
                          telefono: telefonoController.text,
                          celular: celularController.text,
                          email: emailController.text,
                          descripcion: descripcionController.text));
                    }
                    print("La Academia llamada: " +
                        nombreController.text +
                        " agregada con éxito");
                  }
                })
          ]),
        ));
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
