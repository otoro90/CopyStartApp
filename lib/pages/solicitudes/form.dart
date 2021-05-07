import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final Solicitud solicitud;
  final String accion;

  FormPage({@required this.solicitud, this.accion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(accion),
      ),
      body: Column(),
    );
  }
}
