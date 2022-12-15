import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto/bloc/solicitud/solicitud_bloc.dart';
import 'package:proyecto/theme/AppTheme.dart';
import 'package:proyecto/models/SolicitudModelo.dart';
import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:provider/provider.dart';

class SolicitudFormEdit extends StatefulWidget {
  SolicitudModelo modelP;

  SolicitudFormEdit({this.modelP}) : super();

  @override
  _SolicitudFormEditState createState() =>
      _SolicitudFormEditState(modelP: modelP);
}

List<Map<String, String>> lista = [
  {'value': 'M', 'display': 'Masculino'},
  {'value': 'F', 'display': 'Femenino'}
];

class _SolicitudFormEditState extends State<SolicitudFormEdit> {
  String _representante;
  String _estado;

  int _idempresa;
  int _idestudiante;
  var _data = [];

  SolicitudModelo modelP;
  _SolicitudFormEditState({this.modelP}) : super();

  final _formKey = GlobalKey<FormState>();
  GroupController controller = GroupController();
  GroupController multipleCheckController = GroupController(
    isMultipleSelection: true,
  );

  Widget _buildRepresentante() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Representante',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEstado() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Estado',
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Empresa 1"), value: "Empresa 1"),
      DropdownMenuItem(child: Text("Upeu"), value: "Upeu"),
      DropdownMenuItem(child: Text("Electro Puno"), value: "Electro Puno"),
      DropdownMenuItem(child: Text("EsSalud"), value: "EsSalud"),
    ];
    return menuItems;
  }

  String selectedValue = "Empresa 1";

  Widget _buildEmpresa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              filled: true,
            ),
            value: selectedValue,
            onChanged: (String newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            items: dropdownItems),
      ],
    );
  }

  List<DropdownMenuItem<String>> get dropdownEstudiantes {
    List<DropdownMenuItem<String>> menuItems2 = [
      DropdownMenuItem(child: Text("Brandon"), value: "Brandon"),
      DropdownMenuItem(child: Text("Everick"), value: "Everick"),
      DropdownMenuItem(child: Text("Brayhan"), value: "Brayhan"),
      DropdownMenuItem(child: Text("Snik"), value: "Snik"),
    ];
    return menuItems2;
  }

  String selectedEstudiante = "Brandon";

  Widget _buildEstudiante() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              filled: true,
            ),
            value: selectedEstudiante,
            onChanged: (String newValue) {
              setState(() {
                selectedEstudiante = newValue;
              });
            },
            items: dropdownEstudiantes),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Form. Edit. Solicitud"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*_buildName(),*/
                    _buildRepresentante(),
                    _buildEstado(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: _buildEmpresa(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: _buildEstudiante(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text('Cancelar')),
                          ElevatedButton(
                            onPressed: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Processing Data'),
                                  ),
                                );
                                _formKey.currentState.save();
                                SolicitudModelo mp = new SolicitudModelo();
                                mp.representante = _representante;
                                mp.estado = _estado;
                                mp.idempresa = _idempresa;
                                mp.idestudiante = _idestudiante;
                                print("IDX: $modelP.id");
                                BlocProvider.of<SolicitudBloc>(context)
                                    .add(CreateSolicitudEvent(solicitud: mp));
                                Navigator.pop(context, () {
                                  setState(() {});
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'No estan bien los datos de los campos!'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Guardar'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
