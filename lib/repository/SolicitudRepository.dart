import 'dart:async';
import 'package:proyecto/local/dao/SolicitudDao.dart';
import 'package:proyecto/models/SolicitudModelo.dart';
import 'package:dio/dio.dart';

class SolicitudRepository {
  SolicitudLocate solicitudLocal;
  bool result;

  SolicitudRepository() {
    Dio _dio = Dio();
    _dio.options.headers["Content-Type"] = "application/json";
    solicitudLocal = SolicitudLocate();
  }

  Future<List<SolicitudModelo>> getSolicitud() async {
    return await solicitudLocal.getAllSolicitud();
  }

  Future<MsgModelo> deleteSolicitud(int id) async {
    return await solicitudLocal.deleteSolicitud(id);
  }

  Future<MsgModelo> updateSolicitud(int id, SolicitudModelo solicitudm) async {
    return await solicitudLocal.updateSolicitud(solicitudm);
  }

  Future<MsgModelo> createSolicitud(SolicitudModelo solicitud) async {
    return await solicitudLocal.createSolicitud(solicitud);
  }
}
