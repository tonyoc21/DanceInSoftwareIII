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
          title: const Text(
            'Bienvenido a DanceIn',
            style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),
          ),
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
      child: Column(children: <Widget>[
        const SizedBox(height: 300),
        const Text('¿Cómo desea ingresar al sistema?',
            style: TextStyle(
                fontFamily: 'CrimsonText',
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        // ignore: unnecessary_new
        new SizedBox(
          width: 170,
          height: 45,
          child: RaisedButton(
              // ignore: sort_child_properties_last
              child: const Text('Administrador',
                  style: TextStyle(
                      fontFamily: 'CrimsonText',
                      fontSize: 21.5,
                      fontWeight: FontWeight.bold)),
              color: Colors.red[900],
              splashColor: Colors.grey[900],
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              }),
        ),
        const SizedBox(height: 20),
        // ignore: unnecessary_new
        new SizedBox(
            width: 170,
            height: 45,
            // ignore: deprecated_member_use
            child: RaisedButton(
                // ignore: sort_child_properties_last
                child: const Text('Usuario',
                    style: TextStyle(
                        fontFamily: 'CrimsonText',
                        fontSize: 21.5,
                        fontWeight: FontWeight.bold)),
                color: Colors.red[900],
                splashColor: Colors.grey[900],
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/init');
                }))
      ]),
    );
  }
}
