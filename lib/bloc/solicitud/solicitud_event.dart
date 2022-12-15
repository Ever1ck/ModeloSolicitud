part of 'solicitud_bloc.dart';

abstract class SolicitudEvent {
  final SolicitudModelo solicitud;
  const SolicitudEvent({this.solicitud});
}

class ListarSolicitudEvent extends SolicitudEvent {
  ListarSolicitudEvent();
}

class DeleteSolicitudEvent extends SolicitudEvent {
  DeleteSolicitudEvent({@required SolicitudModelo solicitud})
      : super(solicitud: solicitud);
}

class UpdateSolicitudEvent extends SolicitudEvent {
  UpdateSolicitudEvent({@required SolicitudModelo solicitud})
      : super(solicitud: solicitud);
}

class CreateSolicitudEvent extends SolicitudEvent {
  CreateSolicitudEvent({@required SolicitudModelo solicitud})
      : super(solicitud: solicitud);
}
