import 'dart:developer';

import 'package:case_study/core/extensions/navigate.extension.dart';
import 'package:case_study/core/helper/preferences/preferences.dart';
import 'package:case_study/screen/add_note_screen/add_note_screen.dart';
import 'package:case_study/screen/login_screen/login_screen.dart';
import 'package:case_study/screen/note_screen/note_screen.dart';
import 'package:case_study/service/get_note_service/get_note_service.dart';
import 'package:case_study/service/get_note_service/get_note_service_model/get_note_service_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store {
  @observable
  bool isLoading = false;

  @observable
  GetNoteServiceModel notes = GetNoteServiceModel();
  final GetNoteService _getNoteService = GetNoteService();

  Future<void> initialize() async {
    notes = await _getNoteService.getNote();
    log(Preferences.enabledPermission.toString());
  }

  @action
  void navigateToNoteScreen(
      {required BuildContext context, required int index}) {
    NoteScreen(index: index).navigateTo(context: context);
  }

  @action
  void navigateToAddNoteScreen({required BuildContext context}) {
    AddNoteScreen().navigateTo(context: context);
  }

  Future<void> logOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut().whenComplete(() async =>
        await Preferences.setUid(userId: '').whenComplete(
            () => LoginScreen().navigateToPushReplacement(context: context)));
  }
}
