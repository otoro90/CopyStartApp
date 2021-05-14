import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:copystart/pages/solicitudes/form.dart';
import 'package:copystart/pages/solicitudes/table.dart';
import 'package:copystart/providers/solicitudes/SolicitudesProvider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SolicitudesProvider solicitudesProvider = SolicitudesProvider();

  Future<List<Solicitud>> solicitudes;

  @override
  void initState() {
    solicitudes = solicitudesProvider.obtenerSolicitudes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var elevatedButton = ElevatedButton(
            onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FormPage(
                        solicitud: new Solicitud(
                            id: 0,
                            serialEquipo: "",
                            nombreCliente: "",
                            celularCliente: 0,
                            direccionCliente: "",
                            descripcion: "",
                            fechaSolicitud: new DateTime.now()),
                        accion: "Crear nuevo servicio")));
          },
          child: Text('Crear servicio'),  
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
      floatingActionButton: Center(
        child: elevatedButton,
      ),
    );
  }

  Widget _body() {
    return FutureBuilder(
        future: solicitudes,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Solicitud> datos = snapshot.data as List<Solicitud>;

            return TablePage(solicitudes: datos);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
