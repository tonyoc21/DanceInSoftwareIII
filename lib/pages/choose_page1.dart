import 'package:flutter/material.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Visualización de Servicios", style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
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
              Text("¿Qué servicio desea visualizar?",
                    style: TextStyle(fontFamily: 'CrimsonText', fontSize: 26, fontWeight: FontWeight.bold)
                  ),
              SizedBox(height: 30),
              new SizedBox(  
                width: 170,
                height: 45,
                child: RaisedButton(
                  child: Text("Academias", style: TextStyle(fontFamily: 'CrimsonText', fontSize: 21.5, fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "/init");
                  }
                ),
              ),
             
              SizedBox(height: 20),
              new SizedBox(
                width: 170,
                height: 45,
                child: RaisedButton(
                  child: Text("Eventos", style: TextStyle(fontFamily: 'CrimsonText', fontSize: 21.5, fontWeight: FontWeight.bold)),
                  color: Colors.red[900],
                  splashColor: Colors.grey[900],
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, "/init1");
                  }
                )
              )
              
            ]),
        );
  }
}
