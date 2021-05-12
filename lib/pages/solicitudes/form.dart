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
      body: MyCustomForm(),
    );
  }
}

// Crea un Widget Form
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Crea una clase State correspondiente. Esta clase contendrá los datos relacionados con el formulario.
class MyCustomFormState extends State<MyCustomForm> {
  // Crea una clave global que identificará de manera única el widget Form
  // y nos permita validar el formulario
  //
  // Nota: Esto es un GlobalKey<FormState>, no un GlobalKey<MyCustomFormState>!
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Crea un widget Form usando el _formKey que creamos anteriormente
    
    return Column ( 
      children: [
        TextFormField(
      //key: _formKey,
        decoration: const InputDecoration(
          icon: Icon(Icons.calendar_today_sharp),
          hintText: 'Ingresa la fecha de solicitud',
          labelText: 'Fecha de solicitud',
        ),
        validator: (String value) {
        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;}
        ),
        TextFormField(
      //key: _formKey,
        decoration: const InputDecoration(
          icon: Icon(Icons.people),
          hintText: 'Ingresa tu nombre completo',
          labelText: 'Nombre del cliente',
        ),
        validator: (String value) {
        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;}
        ),
           TextFormField(
      //key: _formKey,
        decoration: const InputDecoration(
          icon: Icon(Icons.confirmation_number_outlined),
          hintText: 'Ingresa el serial del equipo en servicio',
          labelText: 'Serial del equipo',
        ),
        validator: (String value) {
        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;}
        ),
        TextFormField(
    //  key: _formKey,
        decoration: const InputDecoration(
          icon: Icon(Icons.contact_phone_outlined),
          hintText: 'Ingresa tu número de celular',
          labelText: 'Celular del cliente',
        ),
        validator: (String value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;}
    ),
            TextFormField(
      //key: _formKey,
        decoration: const InputDecoration(
          icon: Icon(Icons.description),
          hintText: 'Describe la falla o el problema que presenta el equipo',
          labelText: 'Descripción de la falla presentada',
        ),
        validator: (String value) {
        return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;}
        ),
      ]
    );  
    
    
    
  
}
}