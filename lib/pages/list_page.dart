import 'package:crud/models/academia.dart';
import 'package:flutter/material.dart';
import 'package:crud/db/operation.dart';

class ListPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return _MyList();
  }
}

class _MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<_MyList> {
  List<Academia> danceIn = [];

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        key: Key('crearButon'),
        child: Icon(Icons.person_add_alt_1),
        onPressed: () {
          Navigator.pushNamed(context, "/save", arguments: Academia.empty())
              .then((value) => setState(() {
                    _loadData();
                  }));
        },
      ),
      appBar: AppBar(
        title: Text("Academias (Administrador)", style: TextStyle(fontSize: 32.5, fontFamily: 'DancingScript'),),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: danceIn.length,
          itemBuilder: (_, i) => _createItem(i),
        ),
      ),
    );
  }

  _loadData() async {
    List<Academia> auxNote = await Operation.listarAcademias();

    setState(() {
      danceIn = auxNote;
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
        print("Academia Eliminada");
        Operation.delete(danceIn[i]);
      },
      child: ListTile(
        title: Text(danceIn[i].nombre, style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25, fontWeight: FontWeight.bold)),
        trailing: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, "/save", arguments: danceIn[i])
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
