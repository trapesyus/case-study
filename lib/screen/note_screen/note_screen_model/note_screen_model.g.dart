// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteScreenModel on _NoteScreenModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_NoteScreenModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$zoomInOutAtom =
      Atom(name: '_NoteScreenModelBase.zoomInOut', context: context);

  @override
  double get zoomInOut {
    _$zoomInOutAtom.reportRead();
    return super.zoomInOut;
  }

  @override
  set zoomInOut(double value) {
    _$zoomInOutAtom.reportWrite(value, super.zoomInOut, () {
      super.zoomInOut = value;
    });
  }

  late final _$latitudeAtom =
      Atom(name: '_NoteScreenModelBase.latitude', context: context);

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$longtitudeAtom =
      Atom(name: '_NoteScreenModelBase.longtitude', context: context);

  @override
  double get longtitude {
    _$longtitudeAtom.reportRead();
    return super.longtitude;
  }

  @override
  set longtitude(double value) {
    _$longtitudeAtom.reportWrite(value, super.longtitude, () {
      super.longtitude = value;
    });
  }

  late final _$getNoteServiceModelAtom =
      Atom(name: '_NoteScreenModelBase.getNoteServiceModel', context: context);

  @override
  GetNoteServiceModel get getNoteServiceModel {
    _$getNoteServiceModelAtom.reportRead();
    return super.getNoteServiceModel;
  }

  @override
  set getNoteServiceModel(GetNoteServiceModel value) {
    _$getNoteServiceModelAtom.reportWrite(value, super.getNoteServiceModel, () {
      super.getNoteServiceModel = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
zoomInOut: ${zoomInOut},
latitude: ${latitude},
longtitude: ${longtitude},
getNoteServiceModel: ${getNoteServiceModel}
    ''';
  }
}
