import 'dart:async';
import 'package:proyecto/models/SolicitudModelo.dart';
import 'package:proyecto/repository/SolicitudRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'solicitud_event.dart';
part 'solicitud_state.dart';

class SolicitudBloc extends Bloc<SolicitudEvent, SolicitudState> {
  final SolicitudRepository _solicitudRepository;
  SolicitudBloc({SolicitudRepository solicitudRepository})
      : _solicitudRepository = solicitudRepository,
        super(SolicitudInitialState());
  @override
  Stream<SolicitudState> mapEventToState(SolicitudEvent event) async* {
    if (event is ListarSolicitudEvent) {
      yield SolicitudLoadingState();
      try {
        List<SolicitudModelo> solicitudList =
            await _solicitudRepository.getSolicitud();
        yield SolicitudLoadedState(solicitudList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SolicitudError(e);
      }
    } else if (event is DeleteSolicitudEvent) {
      try {
        await _solicitudRepository.deleteSolicitud(event.solicitud.id);
        yield SolicitudLoadingState();
        List<SolicitudModelo> solicitudList =
            await _solicitudRepository.getSolicitud();
        yield SolicitudLoadedState(solicitudList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SolicitudError(e);
      }
    } else if (event is CreateSolicitudEvent) {
      try {
        await _solicitudRepository.createSolicitud(event.solicitud);
        yield SolicitudLoadingState();
        List<SolicitudModelo> solicitudList =
            await _solicitudRepository.getSolicitud();
        yield SolicitudLoadedState(solicitudList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SolicitudError(e);
      }
    } else if (event is UpdateSolicitudEvent) {
      try {
        await _solicitudRepository.updateSolicitud(
            event.solicitud.id, event.solicitud);
        yield SolicitudLoadingState();
        List<SolicitudModelo> solicitudList =
            await _solicitudRepository.getSolicitud();
        yield SolicitudLoadedState(solicitudList);
      } catch (e) {
        print("Error ${e.toString()}");
        yield SolicitudError(e);
      }
    }
  }
}
