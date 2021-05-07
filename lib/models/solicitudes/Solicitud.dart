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
}
