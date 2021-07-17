import 'package:flutter/material.dart';

class ChoosePagee extends StatefulWidget {
  @override
  _ChoosePageeState createState() => _ChoosePageeState();
}

class _ChoosePageeState extends State<ChoosePagee> {
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gestión de Servicios", style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
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
              Text("¿Qué servicio desea gestionar?",
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
                    Navigator.pushNamed(context, "/list");
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
                    Navigator.pushNamed(context, "/list1");
                  }
                )
              )
              
            ]),
        );
  }
}
