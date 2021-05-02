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
        title: Text("Dance In - Academias"),
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
        title: Text(danceIn[i].nombre),
        trailing: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, "/view", arguments: danceIn[i])
                  .then((value) => setState(() {
                        _loadData();
                      }));
            },
            child: Icon(Icons.view_sidebar)),
      ),
    );
  }
}
