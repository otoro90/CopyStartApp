import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:copystart/pages/home.dart';
import 'package:copystart/providers/solicitudes/SolicitudesProvider.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  final Solicitud solicitud;
  final String accion;
  final SolicitudesProvider solicitudesProvider = SolicitudesProvider();

  FormPage({@required this.solicitud, this.accion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(accion),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TextFormField(
              initialValue: solicitud.nombreCliente,
              onChanged: (text) {
                solicitud.nombreCliente = text;
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.people),
                hintText: 'Ingresa tu nombre completo',
                labelText: 'Nombre del cliente',
                contentPadding: const EdgeInsets.all(10.0),
              )),
          TextFormField(
              onChanged: (text) {
                solicitud.serialEquipo = text;
              },
              initialValue: solicitud.serialEquipo,
              decoration: const InputDecoration(
                icon: Icon(Icons.confirmation_number_outlined),
                hintText: 'Ingresa el serial del equipo en servicio',
                labelText: 'Serial del equipo',
                contentPadding: const EdgeInsets.all(10.0),
              )),
          TextFormField(
              onChanged: (text) {
                solicitud.celularCliente = int.parse(text);
              },
              initialValue: solicitud.celularCliente == 0
                  ? ""
                  : solicitud.celularCliente.toString(),
              decoration: const InputDecoration(
                icon: Icon(Icons.contact_phone_outlined),
                hintText: 'Ingresa tu número de celular',
                labelText: 'Celular del cliente',
                contentPadding: const EdgeInsets.all(10.0),
              )),
          TextFormField(
              onChanged: (text) {
                solicitud.descripcion = text;
              },
              initialValue: solicitud.descripcion,
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                hintText:
                    'Describe la falla o el problema que presenta el equipo',
                labelText: 'Descripción de la falla presentada',
                contentPadding: const EdgeInsets.all(10.0),
              )),
          ElevatedButton(
            onPressed: () async {
              if (solicitud.id == 0) {
                await solicitudesProvider.crearSolicitud(solicitud);
              } else {
                await solicitudesProvider.editarSolicitud(solicitud);
              }
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyHomePage(title: 'IMPORTACIONES COPY START')),
                (Route<dynamic> route) => false,
              );
            },
            child: Text('Guardar'),
          )
        ]),
      ),
    );
  }
}
