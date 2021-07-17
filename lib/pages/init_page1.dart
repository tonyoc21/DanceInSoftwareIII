import 'package:crud/db/operation1.dart';
import 'package:crud/models/evento.dart';
import 'package:flutter/material.dart';
class InitPage1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return _MyList();
  }
}

class _MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<_MyList> {
  List<Evento> danceIn1 = [];

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dance In - Eventos", style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: danceIn1.length,
          itemBuilder: (_, i) => _createItem(i),
        ),
      ),
    );
  }

  _loadData() async {
    List<Evento> auxNote = await Operation1.listarEventos();

    setState(() {
      danceIn1 = auxNote;
    });
  }

  _createItem(int i) {
    return Container(
      key: Key(i.toString()),
      child: ListTile(
        title: Text(danceIn1[i].nombre,style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25, fontWeight: FontWeight.bold)),
        trailing: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/view1", arguments: danceIn1[i])
                  .then((value) => setState(() {
                        _loadData();
                      }));
            },
            child: Icon(Icons.remove_red_eye_outlined, color: Colors.red[900])
        ),
      ),
    );
  }
}
