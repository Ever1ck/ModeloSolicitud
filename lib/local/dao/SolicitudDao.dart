import 'package:proyecto/local/db/db_solicitud.dart';
import 'package:proyecto/models/SolicitudModelo.dart';

class SolicitudLocate extends SolicitudRepository {
  Future<List<SolicitudModelo>> getAllSolicitud() async {
    final db = await database;
    var result = await db.rawQuery('SELECT * FROM solicitudes');
    List<SolicitudModelo> listProduct = result.isNotEmpty
        ? result.map((c) => SolicitudModelo.fromObject(c)).toList()
        : [];
    return listProduct;
  }

  Future<MsgModelo> createSolicitud(SolicitudModelo solicitud) async {
    final db = await database;
    var result = await db.rawInsert(
        'INSERT INTO solicitudes(representante, estado, idempresa, idestudiante) VALUES(?,?,?,?)',
        [
          solicitud.representante,
          solicitud.estado,
          solicitud.idempresa,
          solicitud.idestudiante
        ]);
    Map<String, dynamic> resultado = {'mensaje': "Se creo correctamente"};
    if (result == 1) {
      return Future.value(MsgModelo.fromJson(resultado));
    }
    resultado["mensaje"] = "No se pudo Registrar";
    return Future.value(MsgModelo.fromJson(resultado));
  }

  //Actualizar Datos
  Future<MsgModelo> updateSolicitud(SolicitudModelo solicitud) async {
    final db = await database;
    int result = await db.update('solicitudes', solicitud.toMap(),
        where: 'id = ${solicitud.id}');
    Map<String, dynamic> resultado = {'mensaje': "updated!!"};
    if (result == 1) {
      return Future.value(MsgModelo.fromJson(resultado));
    }
    resultado["mensaje"] = "No se pudo modificar los datos";
    return Future.value(MsgModelo.fromJson(resultado));
  }

  //Eliminar
  Future<MsgModelo> deleteSolicitud(int id) async {
    final db = await database;
    var res = await db.delete('solicitudes', where: 'id = $id');
    Map<String, dynamic> resultado = {'mensaje': "Eliminado!!", 'id': id};
    if (res == 1) {
      return Future.value(MsgModelo.fromJson(resultado));
    }
    resultado["mensaje"] = "Error al eliminar";
    return Future.value(MsgModelo.fromJson(resultado));
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete('solicitudes');
  }
}
