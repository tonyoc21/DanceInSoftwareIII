class Academia{
  int id;
  String nombre;
  String estilo;
  String ciudad;
  String telefono;
  String celular;
  String email;
  String descripcion;

  Academia({this.id, this.nombre, this.estilo, this.ciudad, this.telefono, this.celular, this.email, this.descripcion});

  Academia.empty();

  Map<String,dynamic> toMap(){
    return {'id':id, 'nombre':nombre, 'estilo':estilo, 'ciudad':ciudad, 
    'telefono':telefono, 'celular':celular, 'email':email, 'descripcion':descripcion};
  }
}