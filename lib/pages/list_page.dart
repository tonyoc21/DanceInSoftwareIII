import 'package:crud/models/academia.dart';
import 'package:flutter/material.dart';
import 'package:crud/db/operation.dart';

class ListPage extends StatelessWidget {
  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.person_add_alt_1),
        onPressed: () {
          Navigator.pushNamed(context, '/save', arguments: Academia.empty())
              .then((value) => setState(() {
                    _loadData();
                  }));
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Academias (Administrador)',
          style: TextStyle(fontSize: 32.5, fontFamily: 'DancingScript'),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: danceIn.length,
          itemBuilder: (_, i) => _createItem(i),
        ),
      ),
    );
  }

  // ignore: always_declare_return_types
  _loadData() async {
    List<Academia> auxNote;
    auxNote = await Operation.listarAcademias();

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
        padding: const EdgeInsets.only(left: 10),
        child: const Align(
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete, color: Colors.white)),
      ),
      onDismissed: (direction) {
        // ignore: avoid_print
        print('Academia Eliminada');
        Operation.delete(danceIn[i]);
      },
      child: ListTile(
        title: Text(danceIn[i].nombre,
            style: const TextStyle(
                fontFamily: 'CrimsonText',
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        trailing: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, '/save', arguments: danceIn[i])
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
