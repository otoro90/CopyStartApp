import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:copystart/pages/solicitudes/form.dart';
import 'package:copystart/pages/solicitudes/table.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body(),
      floatingActionButton: Center(
        child: RaisedButton(
          color: Colors.blueAccent,
          onPressed: () {
            setState(() {
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
                              fechaSolicitud: null),
                          accion: "Crear nuevo servicio")));
            });
          },
          child: Text('Crear servicio'), textColor: Colors.white, 
        ),
      ),
    );
  }

  Widget _body() {
    return Column(children: [TablePage()]);
  }
}
