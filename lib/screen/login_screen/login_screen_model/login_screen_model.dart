import 'package:case_study/core/extensions/navigate.extension.dart';
import 'package:case_study/core/extensions/snackbar_extension.dart';
import 'package:case_study/core/helper/preferences/preferences.dart';
import 'package:case_study/screen/home_screen/home_screen.dart';
import 'package:case_study/screen/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'login_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class LoginScreenModel = _LoginScreenModelBase with _$LoginScreenModel;

abstract class _LoginScreenModelBase with Store {
  @observable
  TextEditingController mailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> login(
      {required String mail,
      required String password,
      required BuildContext context}) async {
    if (mail == '' || password == '') return;
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: mail, password: password);
      if (userCredential.user?.uid == '' || userCredential.user?.uid == null) {
        return;
      }

      await Preferences.setUid(userId: userCredential.user!.uid)
          .whenComplete(() async => await Preferences.getUid());

      if (context.mounted) {
        HomeScreen().navigateToPushReplacement(context: context);
      }
    } on FirebaseAuthException catch (_) {
      if (context.mounted) {
        context.snackBarExtension(content: 'Kullanıcı Adı ya da Şifre yanlış');
      }
    }
  }

  void navigateSignUp({required BuildContext context}) {
    SignupScreen().navigateTo(context: context);
  }
}
