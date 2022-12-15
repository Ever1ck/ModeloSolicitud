import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SolicitudRepository {
  SolicitudRepository();
  SolicitudRepository._();
  static final SolicitudRepository db = SolicitudRepository._();
  Database _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path + "solicitudes.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE solicitudes(' +
          'id INTEGER PRIMARY KEY AUTOINCREMENT,' +
          'representante TEXT,' +
          'estado TEXT,' +
          'idempresa INTEGER,' +
          'idestudiante INTEGER)');
    });
  }
}
