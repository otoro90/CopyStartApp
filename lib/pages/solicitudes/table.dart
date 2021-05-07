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
columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'No. Servicio',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Serial equipo',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Problema o falla',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        // DataColumn(
        //   label: Text(
        //     'Acciones',
        //     style: TextStyle(fontStyle: FontStyle.italic),
        //   ),
        // ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(Text('1459')),
            DataCell(Text('Mantenimiento')),
            //DataCell(Text('E')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('2')),
            DataCell(Text('4ASD43')),
            DataCell(Text('Falla electrica')),
            //DataCell(Text('E')),
          ],
        ),
        
      ],
      
    );

  }
}
