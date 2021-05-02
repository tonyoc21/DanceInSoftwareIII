//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/academia.dart';
import 'package:crud/pages/save_page.dart';
import 'package:flutter/material.dart';
import 'package:crud/db/operation.dart';

class ListPage extends StatelessWidget {

  static const String ROUTE = "/";
  
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

  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
           onPressed: (){
            Navigator.pushNamed(context,SavePage.ROUTE,arguments: Academia.empty()).then((value) => setState((){
              _loadData();
            }));
          },
      ),
      appBar: AppBar(title: Text("Lista de Academias"),),
      body: Container(
        child:  ListView.builder(
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
        color: Colors.red,
        padding: EdgeInsets.only(left:10),
        child:Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white)),
      ),
      onDismissed: (direction){
        print("Academia Eliminada");
        Operation.delete(danceIn[i]);
      },
      child:ListTile(
        title: Text(danceIn[i].nombre),
        trailing: MaterialButton(
          onPressed: (){
            Navigator.pushNamed(context, SavePage.ROUTE, arguments: danceIn[i]).then((value) => setState((){
              _loadData();
            }));
          },
          child: Icon(Icons.edit),),
      ),
    );
  }
}