class Solicitud {
  Solicitud(
      {this.id,
      this.serialEquipo,
      this.nombreCliente,
      this.celularCliente,
      this.direccionCliente,
      this.descripcion,
      this.fechaSolicitud});
  int id;
  String serialEquipo;
  String nombreCliente;
  int celularCliente;
  String direccionCliente;
  String descripcion;
  DateTime fechaSolicitud;

  factory Solicitud.fromJson(Map<String, dynamic> json) {
    return Solicitud(
      id: json['id'],
      serialEquipo: json['serialEquipo'],
      nombreCliente: json['nombreCliente'],
      celularCliente: json['celularCliente'],
      direccionCliente: json['direccionCliente'],
      descripcion: json['descripcion'],
      fechaSolicitud: DateTime.parse(json['fechaSolicitud']),
    );
  }
}
