import 'dart:developer';

import 'package:case_study/service/get_note_service/get_note_service.dart';
import 'package:case_study/service/get_note_service/get_note_service_model/get_note_service_model.dart';
import 'package:case_study/service/location_service/location_service.dart';
import 'package:mobx/mobx.dart';
part 'note_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class NoteScreenModel = _NoteScreenModelBase with _$NoteScreenModel;

abstract class _NoteScreenModelBase with Store {
  @observable
  bool isLoading = false;
  @observable
  double zoomInOut = 7.0;
  @observable
  double latitude = 0;
  @observable
  double longtitude = 0;
  @observable
  GetNoteServiceModel getNoteServiceModel = GetNoteServiceModel();
  GetNoteService getNoteService = GetNoteService();

  final LocationService _locationService = LocationService();

  Future<void> initialize() async {
    await getNote();
    await getCurrentLocation();
  }

  Future<void> getNote() async {
    getNoteServiceModel = await getNoteService.getNote();
    log(getNoteServiceModel.documents![1].fields!.image!.stringValue!);
  }

  void zoomIn() {
    zoomInOut += 1;
  }

  void zoomOut() {
    if (zoomInOut < 1) return;
    zoomInOut -= 1;
  }

  Future<void> getCurrentLocation() async {
    await _locationService.getCurrentPosition();
    await _locationService
        .getAddressFromLatLng(_locationService.currentPosition!);
    latitude = _locationService.currentPosition!.latitude;
    longtitude = _locationService.currentPosition!.longitude;
  }
}
