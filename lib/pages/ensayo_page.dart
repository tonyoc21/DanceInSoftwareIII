import 'package:flutter/material.dart';

class EnsayoPage extends StatefulWidget {
  @override
  _EnsayoPageState createState() => _EnsayoPageState();
}

class _EnsayoPageState extends State<EnsayoPage> {

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bienvenido a DanceIn", style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
        ),
        body: Center(
          child: Container(
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 300),
              Text("¿Cómo desea ingresar al sistema?",
                    style: TextStyle(fontFamily: 'CrimsonText', fontSize: 26, fontWeight: FontWeight.bold)
                  ),
              SizedBox(height: 30),
              new SizedBox(  
                width: 170,
                height: 45,
                child: RaisedButton(
                  key: Key('AdministradorBoton'),
                  child: Text("Administrador", style: TextStyle(fontFamily: 'CrimsonText', fontSize: 21.5, fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  }
                ),
              ),
             
              SizedBox(height: 20),
              new SizedBox(
                width: 170,
                height: 45,
                child: RaisedButton(
                  child: Text("Usuario", style: TextStyle(fontFamily: 'CrimsonText', fontSize: 21.5, fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "/init");
                  }
                )
              )
              
            ]),
        );
  }
}
