import 'package:case_study/service/add_note_service/add_note_service_model/add_note_service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/helper/preferences/preferences.dart';

class NoteService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addNote(Note note) async {
    try {
      await firestore
          .collection('users')
          .doc(Preferences.userUid)
          .collection('notes')
          .add(note.toMap());
    } catch (e) {
      debugPrint('Hata oluştu: $e');
    }
  }
}
