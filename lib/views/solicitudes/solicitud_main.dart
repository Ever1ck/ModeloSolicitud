import 'package:proyecto/bloc/solicitud/solicitud_bloc.dart';
import 'package:proyecto/utilities/TabItem.dart';
import 'package:proyecto/repository/SolicitudRepository.dart';
import 'package:proyecto/views/solicitudes/solicitud_content.dart';
import 'package:proyecto/views/solicitudes/solicitud_edit.dart';
import 'package:proyecto/views/solicitudes/solicitud_form.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/models/SolicitudModelo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:proyecto/theme/AppTheme.dart';
import '../help_screen.dart';

class MainSolicitud extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SolicitudBloc(
            solicitudRepository: SolicitudRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeData, //
        //theme: ThemeData(primaryColor: Colors.lightBlue),
        home: SolicitudUI(),
      ),
    );
  }
}

class SolicitudUI extends StatefulWidget {
  @override
  _SolicitudUIState createState() => _SolicitudUIState();
}

class _SolicitudUIState extends State<SolicitudUI> {
//ApiCovid apiService;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  var api;
  @override
  void initState() {
    super.initState();
//apiService = ApiCovid();
//api=Provider.of<PredictionApi>(context, listen: false).getPrediction();
    print("entro aqui");
  }

  Widget _ButtomAgregar() {
    return FloatingActionButton(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SolicitudForm()),
          ).then(onGoBack);
        },
        child: Icon(Icons.add_box_sharp),
      ),
    );
  }

  Future onGoBack(dynamic value) {
    setState(() {
      print(value);
    });
  }

  void accion() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeData,
      home: Scaffold(
        appBar: new AppBar(
          title: Text(
            'Lista de Solicitudes',
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("Si funciona");
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              ),
            ),
          ],
        ),
        body: Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: _ButtomAgregar(),
              )
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/imagen/man-icon.png'),
                                      radius: 40,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text("Empresa",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          "Estudiante",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    //mainAxisAlignment: MainAxisAlignment.spaceAround,

                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.remove_red_eye),
                                        color: AppTheme
                                            .themeData.colorScheme.primary,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SolicitudContent(),
                                            ),
                                          ).then(onGoBack);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
