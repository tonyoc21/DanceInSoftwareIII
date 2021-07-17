import 'package:crud/models/evento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation1{
 
  static Future<Database> _openDB() async{
    return openDatabase(
      join(await getDatabasesPath(), 'danceIn1.db'),onCreate:(db,version){
        return db.execute("CREATE TABLE Eventos (id INTEGER PRIMARY KEY, nombre TEXT, organizador TEXT, estilo TEXT, ciudad TEXT, celular TEXT, fecha TEXT, email TEXT, descripcion TEXT)",
      );
    }, version: 1);
  }

  static Future<void> insert(Evento evento) async{

    Database database = await _openDB();

    return database.insert("Eventos", evento.toMap());

  }

  static Future<void> delete(Evento evento) async{

    Database database = await _openDB();

    return database.delete("Eventos", where: 'id = ?', whereArgs: [evento.id]);

  }

  static Future<void> update(Evento evento) async{

    Database database = await _openDB();

    return database.update("Eventos", evento.toMap(), where: 'id = ?', whereArgs: [evento.id]);

  }

  static Future<List<Evento>> listarEventos() async{

    Database database = await _openDB();
    
    final List<Map<String,dynamic>> eventosMap = await database.query("Eventos");

    for (var n in eventosMap) {
      print("_____"+n['nombre']);
    }

    return List.generate(
      eventosMap.length, (i) => Evento(id: eventosMap[i]['id'],
      nombre: eventosMap[i]['nombre'], organizador: eventosMap[i]['organizador'], 
      estilo: eventosMap[i]['estilo'], ciudad: eventosMap[i]['ciudad'],
      celular: eventosMap[i]['celular'], fecha: eventosMap[i]['fecha'], 
     email: eventosMap[i]['email'], descripcion: eventosMap[i]['descripcion']));

  }

}