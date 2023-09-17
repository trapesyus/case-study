// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupScreenModel on _SignupScreenModelBase, Store {
  late final _$mailControllerAtom =
      Atom(name: '_SignupScreenModelBase.mailController', context: context);

  @override
  TextEditingController get mailController {
    _$mailControllerAtom.reportRead();
    return super.mailController;
  }

  @override
  set mailController(TextEditingController value) {
    _$mailControllerAtom.reportWrite(value, super.mailController, () {
      super.mailController = value;
    });
  }

  late final _$passwordControllerAtom =
      Atom(name: '_SignupScreenModelBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$phoneControllerAtom =
      Atom(name: '_SignupScreenModelBase.phoneController', context: context);

  @override
  TextEditingController get phoneController {
    _$phoneControllerAtom.reportRead();
    return super.phoneController;
  }

  @override
  set phoneController(TextEditingController value) {
    _$phoneControllerAtom.reportWrite(value, super.phoneController, () {
      super.phoneController = value;
    });
  }

  late final _$phoneValiditaionControllerAtom = Atom(
      name: '_SignupScreenModelBase.phoneValiditaionController',
      context: context);

  @override
  TextEditingController get phoneValiditaionController {
    _$phoneValiditaionControllerAtom.reportRead();
    return super.phoneValiditaionController;
  }

  @override
  set phoneValiditaionController(TextEditingController value) {
    _$phoneValiditaionControllerAtom
        .reportWrite(value, super.phoneValiditaionController, () {
      super.phoneValiditaionController = value;
    });
  }

  @override
  String toString() {
    return '''
mailController: ${mailController},
passwordController: ${passwordController},
phoneController: ${phoneController},
phoneValiditaionController: ${phoneValiditaionController}
    ''';
  }
}
