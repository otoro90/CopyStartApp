import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:copystart/providers/solicitudes/SolicitudesProvider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TablePage extends StatefulWidget {
  TablePage({Key key, this.solicitudes}) : super(key: key);

  List<Solicitud> solicitudes;
  @override
  _TablePageState createState() => _TablePageState(solicitudes);
}

class _TablePageState extends State<TablePage> {
  final SolicitudesProvider solicitudesProvider = SolicitudesProvider();
  Future<bool> estadoDelete;

  List<Solicitud> solicitudes = [];

  _TablePageState(List<Solicitud> solicitudesApi) {
    solicitudes.addAll(solicitudesApi);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 28,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'No.',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Serial',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Cliente',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Celular',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Acciones',
            style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: [
        for (var solicitud in solicitudes)
          DataRow(
            cells: [
              DataCell(Text("${solicitud.id}")),
              DataCell(Text("${solicitud.serialEquipo}")),
              DataCell(Text("${solicitud.nombreCliente}")),
              DataCell(Text("${solicitud.celularCliente}")),
              DataCell(Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Editar solicitud',
                    onPressed: () {
                      setState(() {
                        solicitudes.remove(solicitud);
                      });
                    },
                  ),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      tooltip: 'Eliminar solicitud',
                      onPressed: () async {
                        var eliminarSolicitud = await solicitudesProvider
                            .eliminarSolicitud(solicitud.id);
                        if (eliminarSolicitud) {
                          setState(() {
                            solicitudes.remove(solicitud);
                          });
                        }
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ))
            ].toList(),
          ),
      ],
    );
  }
}
