import 'package:crud/models/academia.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation{
 
  static Future<Database> _openDB() async{
    return openDatabase(
      join(await getDatabasesPath(), 'danceIn.db'),onCreate:(db,version){
        return db.execute("CREATE TABLE Academias (id INTEGER PRIMARY KEY, nombre TEXT, estilo TEXT, ciudad TEXT, telefono TEXT, celular TEXT, email TEXT, descripcion TEXT)",
      );
    }, version: 1);
  }

  static Future<void> insert(Academia academia) async{

    Database database = await _openDB();

    return database.insert("Academias", academia.toMap());

  }

  static Future<void> delete(Academia academia) async{

    Database database = await _openDB();

    return database.delete("Academias", where: 'id = ?', whereArgs: [academia.id]);

  }

  static Future<void> update(Academia academia) async{

    Database database = await _openDB();

    return database.update("Academias", academia.toMap(), where: 'id = ?', whereArgs: [academia.id]);

  }

  static Future<List<Academia>> listarAcademias() async{

    Database database = await _openDB();
    
    final List<Map<String,dynamic>> academiasMap = await database.query("Academias");

    for (var n in academiasMap) {
      print("_____"+n['nombre']);
    }

    return List.generate(
      academiasMap.length, (i) => Academia(id: academiasMap[i]['id'],
      nombre: academiasMap[i]['nombre'], estilo: academiasMap[i]['estilo'], ciudad: academiasMap[i]['ciudad'],
      telefono: academiasMap[i]['telefono'], celular: academiasMap[i]['celular'], email: academiasMap[i]['email'],
      descripcion: academiasMap[i]['descripcion']));

  }

}