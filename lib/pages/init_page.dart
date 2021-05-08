import 'package:crud/models/academia.dart';
import 'package:flutter/material.dart';
import 'package:crud/db/operation.dart';

class InitPage extends StatelessWidget {
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
      appBar: AppBar(
        title: Text("Dance In - Academias", style: TextStyle(fontSize: 35, fontFamily: 'DancingScript'),),
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
    return Container(
      key: Key(i.toString()),
      child: ListTile(
        title: Text(danceIn[i].nombre,style: TextStyle(fontFamily: 'CrimsonText', fontSize: 25, fontWeight: FontWeight.bold)),
        trailing: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/view", arguments: danceIn[i])
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
