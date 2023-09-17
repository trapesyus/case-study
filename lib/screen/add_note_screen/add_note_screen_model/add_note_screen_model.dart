import 'package:case_study/core/extensions/navigate.extension.dart';
import 'package:case_study/core/extensions/snackbar_extension.dart';
import 'package:case_study/screen/home_screen/home_screen.dart';
import 'package:case_study/service/add_note_service/add_note_service.dart';
import 'package:case_study/service/image_service/image_service.dart';
import 'package:case_study/service/location_service/location_service.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:mobx/mobx.dart';

import '../../../service/add_note_service/add_note_service_model/add_note_service_model.dart';
part 'add_note_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class AddNoteScreenModel = _AddNoteScreenModelBase with _$AddNoteScreenModel;

abstract class _AddNoteScreenModelBase with Store {
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController contentController = TextEditingController();
  XFile? tempImage;
  @observable
  String image = '';

  double latitude = 0;
  double longtitude = 0;
  String currentAdress = '';
//test
  final NoteService noteService = NoteService();
  final LocationService _locationService = LocationService();
  Future<void> initialize() async {
    await _locationService.handleLocationPermission();
  }

  Future<void> saveNote(
      {required String title,
      required String content,
      required BuildContext context}) async {
    if (title == '' || content == '') return;
    await getLocation();
    Note note = Note(
        title: title,
        content: content,
        clock: DateTime.now().toString(),
        latitude: latitude,
        longitude: longtitude,
        currentAdress: currentAdress,
        image: image != '' ? image : '');
    await noteService.addNote(note);
    if (context.mounted) {
      context.snackBarExtension(content: 'Ekleme Başarıyla Tamamlandı');
      HomeScreen().navigateToPushReplacement(context: context);
    }
  }

  Future<void> getImage() async {
    final ImageService imageService = ImageService();
    final ImagePicker imagePicker = ImagePicker();

    tempImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (tempImage == null) return;
    image = await imageService.uploadImageToFirebaseStorage(tempImage) ?? '';
  }

  Future<void> getLocation() async {
    await _locationService.getCurrentPosition();
    await _locationService
        .getAddressFromLatLng(_locationService.currentPosition!);
    latitude = _locationService.currentPosition!.latitude;
    longtitude = _locationService.currentPosition!.longitude;
    currentAdress = _locationService.currentAddress!;
  }
}
