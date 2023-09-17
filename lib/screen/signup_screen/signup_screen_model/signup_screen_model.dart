import 'package:case_study/core/constants/color_constants.dart';
import 'package:case_study/core/extensions/navigate.extension.dart';
import 'package:case_study/core/extensions/snackbar_extension.dart';

import 'package:case_study/core/widgets/text_widget.dart';
import 'package:case_study/core/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../home_screen/home_screen.dart';

part 'signup_screen_model.g.dart';

// ignore: library_private_types_in_public_api
class SignupScreenModel = _SignupScreenModelBase with _$SignupScreenModel;

abstract class _SignupScreenModelBase with Store {
  final auth = FirebaseAuth.instance;
  @observable
  TextEditingController mailController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();
  @observable
  TextEditingController phoneController = TextEditingController(text: '+90');
  @observable
  TextEditingController phoneValiditaionController = TextEditingController();

  Future<void> verifyPhoneNumber(
      {required String mail,
      required String password,
      required String phone,
      required BuildContext context}) async {
    if (phone == '' || mail == '' || password == '') return;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) {
            context.snackBarExtension(content: 'Doğrulama Başarılı');
          },
          verificationFailed: (FirebaseAuthException e) {
            context.snackBarExtension(content: 'Doğrulama Kodu Yanlış Girildi');
          },
          codeSent: (String verificationId, int? resendToken) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return _myAlertDialog(verificationId, mail, password, context);
              },
            );
          },
          codeAutoRetrievalTimeout: ((String verificationId) {
            context.snackBarExtension(
                content: 'Doğrulama Kodu Süresi Sona Erdi');
          }));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  AlertDialog _myAlertDialog(String verificationId, String mail,
      String password, BuildContext context) {
    return AlertDialog(
      title: CustomText(text: 'Doğrulama Kodu', color: ColorConstants.bgColor),
      content: CustomTextField(
          controller: phoneValiditaionController,
          sizeLeft: 0.04,
          sizeRight: 0.04,
          sizeBottom: 0,
          sizeTop: 0,
          horizontalHeight: 0.02,
          verticalHeight: 0.01,
          label: 'Doğrulama Kodunu Girin',
          labelStyle: true),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () async {
            final x = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: phoneValiditaionController.value.text);

            if (x.smsCode == phoneValiditaionController.value.text) {
              await register(mail: mail, password: password, context: context);
            } else {
              context.snackBarExtension(content: 'Hatalı Giriş');
            }
          },
          child: const Text('Gönder'),
        ),
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: CustomText(text: 'İptal Et', color: ColorConstants.bgColor)),
      ],
    );
  }

  Future<void> register(
      {required String mail,
      required String password,
      required BuildContext context}) async {
    if (mail == '' || password == '') return;

    UserCredential userCredential = await auth
        .createUserWithEmailAndPassword(email: mail, password: password)
        .whenComplete(() {
      context.snackBarExtension(content: 'Kayıt Başarıyla Gerçekleşti');
      HomeScreen().navigateToPushReplacement(context: context);
    });
  }
}
