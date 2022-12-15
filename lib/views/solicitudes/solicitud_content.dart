import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/bloc/solicitud/solicitud_bloc.dart';
import 'package:proyecto/theme/AppTheme.dart';
import 'package:proyecto/models/SolicitudModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:provider/provider.dart';
import 'package:proyecto/views/solicitudes/solicitud_edit.dart';

class SolicitudContent extends StatefulWidget {
  SolicitudModelo modelP;

  SolicitudContent({this.modelP}) : super();

  @override
  _SolicitudContentState createState() =>
      _SolicitudContentState(modelP: modelP);
}

class _SolicitudContentState extends State<SolicitudContent> {
  String _representante;
  String _estado;

  int _idempresa;
  int _idestudiante;
  var _data = [];

  SolicitudModelo modelP;
  _SolicitudContentState({this.modelP}) : super();

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );
  Future onGoBack(dynamic value) {
    setState(() {
      print(value);
    });
  }

  Widget _buildRepresentante() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/imagen/man-icon.png'),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Empresa",
                        style: Theme.of(context).textTheme.headline5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Razon Social",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Telefono",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Convenios",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text("Estudiante:",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text("Nombre:",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 10),
                        child: Text("Ingrese Nombre",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Apellido:",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: Text("Ingrese Apellido",
                            style: Theme.of(context).textTheme.bodyMedium),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("DNI:",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: Text("Ingrese DNI",
                            style: Theme.of(context).textTheme.bodyMedium),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Telefono:",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: Text("Ingrese Telefono",
                            style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Direccion:",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10),
                        child: Text("Ingrese Direccion",
                            style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Solicitud"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            color: AppTheme.themeData.colorScheme.primary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SolicitudFormEdit(),
                ),
              ).then(onGoBack);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: AppTheme.themeData.colorScheme.error,
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Mensaje de confirmacion"),
                    content: Text("Desea Eliminar?"),
                    actions: [
                      FloatingActionButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop('Failure');
                        },
                      ),
                      FloatingActionButton(
                          child: const Text('ACCEPT'),
                          onPressed: () {
                            Navigator.of(context).pop('Success');
                          })
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[_buildRepresentante()],
                ),
              ))),
    );
  }
}
