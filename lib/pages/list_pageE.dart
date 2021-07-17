import 'package:crud/models/evento.dart';
import 'package:flutter/material.dart';
import 'package:crud/db/operation1.dart';

class ListPage1 extends StatelessWidget {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.library_add),
        onPressed: () {
          Navigator.pushNamed(context, "/save1", arguments: Evento.empty())
              .then((value) => setState(() {
                    _loadData();
                  }));
        },
      ),
      appBar: AppBar(
        title: Text("Eventos (Administrador)", style: TextStyle(fontSize: 32.5, fontFamily: 'DancingScript'),),
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
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: Colors.red[900],
        padding: EdgeInsets.only(left: 10),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete, color: Colors.white)),
      ),
      onDismissed: (direction) {
        print("Evento Eliminado");
        Operation1.delete(danceIn1[i]);
      },
      child: ListTile(
        title: Text(danceIn1[i].nombre, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25, fontWeight: FontWeight.bold)),
        trailing: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/save1", arguments: danceIn1[i])
                .then((value) => setState(() {
                      _loadData();
                    }));
          },
          child: Icon(Icons.edit, color: Colors.red[900]),
        ),
      ),
    );
  }
}
