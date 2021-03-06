import 'dart:convert';

import 'package:copystart/models/solicitudes/Solicitud.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class SolicitudesProvider {
  static const String baseUrl = "copystartapp.azurewebsites.net";

  // ignore: missing_return
  Future<List<Solicitud>> obtenerSolicitudes() async {
    try {
      List<Solicitud> solicitudes = [];
      var url = Uri.https(baseUrl, '/api/SolicitudesServicio');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);

        jsonResponse
            .forEach((item) => {solicitudes.add(Solicitud.fromJson(item))});

        return solicitudes;
      } else {
        throw Exception('Fallo la carga de solicitudes');
      }
    } catch (exception) {
      print(exception);
    }
  }

  // ignore: missing_return
  Future<bool> crearSolicitud(Solicitud solicitud) async {
    try {
      var url = Uri.https(baseUrl, '/api/SolicitudesServicio');

      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "id": "0",
          "serialEquipo": solicitud.serialEquipo,
          "nombreCliente": solicitud.nombreCliente,
          "celularCliente": solicitud.celularCliente.toString(),
          "direccionCliente": solicitud.direccionCliente,
          "descripcion": solicitud.descripcion,
          "fechaSolicitud": DateTime.now().toString(),
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Fallo la carga de solicitudes');
      }
    } catch (exception) {
      print(exception);
    }
  }

  // ignore: missing_return
  Future<bool> editarSolicitud(Solicitud solicitud) async {
    try {
      var url = Uri.https(baseUrl, '/api/SolicitudesServicio/${solicitud.id}');

      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "id": solicitud.id.toString(),
          "serialEquipo": solicitud.serialEquipo,
          "nombreCliente": solicitud.nombreCliente,
          "celularCliente": solicitud.celularCliente.toString(),
          "direccionCliente": solicitud.direccionCliente,
          "descripcion": solicitud.descripcion,
          "fechaSolicitud": DateTime.now().toString(),
        }),
      );
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Fallo la carga de solicitudes');
      }
    } catch (exception) {
      print(exception);
    }
  }

  // ignore: missing_return
  Future<bool> eliminarSolicitud(int solicitudId) async {
    try {
      var url = Uri.https(baseUrl, '/api/SolicitudesServicio/$solicitudId');

      var response = await http.delete(url);
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Fallo la carga de solicitudes');
      }
    } catch (exception) {
      print(exception);
    }
  }
}

class Boolean {}
