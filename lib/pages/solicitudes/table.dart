import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  List<Solicitud> solicitudes;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 10,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'No.',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Serial',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Cliente',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Celular',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Acciones',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('1459')),
            DataCell(Text('Mantenimiento')),
            DataCell(Text('Falla electrica')),
            DataCell(Icon(Icons.delete))
          ],
        ),
      ],
    );
  }
}
