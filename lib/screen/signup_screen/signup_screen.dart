import 'package:case_study/core/widgets/appbar_widget.dart';
import 'package:case_study/screen/signup_screen/signup_screen_model/signup_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/color_constants.dart';
import '../../core/widgets/elevated_button_widget.dart';
import '../../core/widgets/textfield_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final SignupScreenModel _signupScreenModel = SignupScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textField(
              controller: _signupScreenModel.mailController,
              label: 'E-Posta',
              icon: const Icon(CupertinoIcons.mail,
                  color: ColorConstants.bgColor),
              isIcon: true),
          _textField(
              controller: _signupScreenModel.passwordController,
              label: 'Şifre',
              isPassword: true,
              icon: const Icon(CupertinoIcons.lock,
                  color: ColorConstants.bgColor),
              isIcon: true),
          _textField(
              controller: _signupScreenModel.phoneController,
              label: 'Telefon Numarası',
              icon: const Icon(CupertinoIcons.phone)),
          CustomElevatedButton(
              buttonText: 'Kayıt Ol',
              onPressed: () async => await _signupScreenModel.verifyPhoneNumber(
                  mail: _signupScreenModel.mailController.value.text,
                  password: _signupScreenModel.passwordController.value.text,
                  phone: _signupScreenModel.phoneController.value.text,
                  context: context)),
        ],
      ),
    );
  }

  CustomAppBar _appbar() {
    return const CustomAppBar(
        title: 'Not Defteri Kayıt İşlemi', titleStyle: true, centerTitle: true);
  }

  CustomTextField _textField(
      {required TextEditingController controller,
      required String label,
      required Icon icon,
      bool isIcon = false,
      bool isPassword = false}) {
    return CustomTextField(
      controller: controller,
      sizeLeft: 0.04,
      sizeBottom: 0.02,
      sizeTop: 0,
      sizeRight: 0.04,
      horizontalHeight: 0.02,
      verticalHeight: 0.01,
      label: label,
      labelStyle: true,
      isIcon: isIcon ? true : false,
      isIconTap: false,
      passwordType: isPassword ? true : false,
    );
  }
}
