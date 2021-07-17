class Evento{
  int id;
  String nombre;
  String organizador;
  String estilo;
  String ciudad;
  String celular;
  String fecha;
  String email;
  String descripcion;

  Evento({this.id, this.nombre, this.organizador, this.estilo, this.ciudad, this.celular, this.fecha, this.email, this.descripcion});

  Evento.empty();

  Map<String,dynamic> toMap(){
    return {'id':id, 'nombre':nombre, 'organizador':organizador, 'estilo':estilo,
    'ciudad':ciudad,'celular':celular, 'fecha':fecha, 'email':email, 'descripcion':descripcion};
  }
}