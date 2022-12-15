import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SolicitudModelo {
  int id = 0, idempresa, idestudiante;
  String representante, estado;
  SolicitudModelo(
      {this.id,
      this.representante,
      this.estado,
      this.idempresa,
      this.idestudiante});
  factory SolicitudModelo.fromJson(Map<String, dynamic> map) {
    return SolicitudModelo(
      id: map['id'] as int,
      representante: map['representante'],
      estado: map['estado'],
      idempresa: map['idempresa'],
      idestudiante: map['idestudiante'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'representante': representante,
      'estado': estado,
      'idempresa': idempresa,
      'idestudiante': idestudiante,
    };
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["representante"] = representante;
    map["estado"] = estado;
    map["idempresa"] = idempresa;
    map["idestudiante"] = idestudiante;
    /*if (id != null) {
      map["id"] = id;
    }*/
    return map;
  }

  SolicitudModelo.fromObject(dynamic o) {
    this.id = o["id"];
    this.representante = o["representante"];
    this.estado = o["estado"];
    this.idempresa = o["idempresa"];
    this.idestudiante = o["idestudiante"];
    //this.edad = int.tryParse(o["edad"].toString());
  }

  @override
  String toString() {
    return 'SolicitudModelo{id: $id, representante: $representante, estado: $estado, idempresa: $idempresa, idestudiante: $idestudiante}';
  }
}

@JsonSerializable()
class ResponseModelo {
  bool success;
  List<SolicitudModelo> data;
  String message;
  ResponseModelo({this.success, this.data, this.message});
  factory ResponseModelo.fromJson(Map<String, dynamic> map) {
    return ResponseModelo(
      success: map['success'] as bool,
      data: (map['data'] as List)
          ?.map((e) => e == null
              ? null
              : SolicitudModelo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      message: map['message'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data,
      'message': message,
    };
  }
}

@JsonSerializable()
class MsgModelo {
  String mensaje;

  MsgModelo({this.mensaje});
  factory MsgModelo.fromJson(Map<String, dynamic> map) {
    return MsgModelo(
      mensaje: map['mensaje'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'mensaje': mensaje,
    };
  }
}
