import 'package:flutter/material.dart';

class EnsayoPage extends StatefulWidget {
  @override
  _EnsayoPageState createState() => _EnsayoPageState();
}

class _EnsayoPageState extends State<EnsayoPage> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenido a DanceIn"),
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
          child: Column(children: <Widget>[
            RaisedButton(
                child: Text("Administrador"),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                }),
            RaisedButton(
                child: Text("Usuario"),
                onPressed: () {
                  Navigator.pushNamed(context, "/init");
                })
          ]),
        ));
  }
}
