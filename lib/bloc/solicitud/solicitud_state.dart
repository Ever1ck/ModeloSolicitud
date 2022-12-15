part of 'solicitud_bloc.dart';

class SolicitudState {}

class SolicitudInitialState extends SolicitudState {}

class SolicitudLoadingState extends SolicitudState {}

class SolicitudLoadedState extends SolicitudState {
  List<SolicitudModelo> solicitudList;
  SolicitudLoadedState(this.solicitudList);
}

class SolicitudError extends SolicitudState {
  Error e;
  SolicitudError(this.e);
}
