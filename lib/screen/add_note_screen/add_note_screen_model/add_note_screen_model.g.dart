// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNoteScreenModel on _AddNoteScreenModelBase, Store {
  late final _$titleControllerAtom =
      Atom(name: '_AddNoteScreenModelBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$contentControllerAtom =
      Atom(name: '_AddNoteScreenModelBase.contentController', context: context);

  @override
  TextEditingController get contentController {
    _$contentControllerAtom.reportRead();
    return super.contentController;
  }

  @override
  set contentController(TextEditingController value) {
    _$contentControllerAtom.reportWrite(value, super.contentController, () {
      super.contentController = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_AddNoteScreenModelBase.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
contentController: ${contentController},
image: ${image}
    ''';
  }
}
