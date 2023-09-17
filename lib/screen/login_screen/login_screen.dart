import 'package:case_study/core/constants/color_constants.dart';
import 'package:case_study/core/widgets/appbar_widget.dart';
import 'package:case_study/core/widgets/elevated_button_widget.dart';
import 'package:case_study/core/widgets/textfield_widget.dart';
import 'package:case_study/screen/login_screen/login_screen_model/login_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginScreenModel _loginScreenModel = LoginScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _appbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textField(
              controller: _loginScreenModel.mailController,
              label: 'E-Posta',
              icon: const Icon(CupertinoIcons.mail,
                  color: ColorConstants.bgColor),
              isIcon: true),
          _textField(
              controller: _loginScreenModel.passwordController,
              label: 'Şifre',
              isPassword: true,
              icon: const Icon(CupertinoIcons.lock,
                  color: ColorConstants.bgColor),
              isIcon: true),
          CustomElevatedButton(
              buttonText: 'Giriş Yap',
              onPressed: () async => await _loginScreenModel.login(
                  mail: _loginScreenModel.mailController.value.text,
                  password: _loginScreenModel.passwordController.value.text,
                  context: context)),
          CustomElevatedButton(
              buttonText: 'Kaydol',
              onPressed: () =>
                  _loginScreenModel.navigateSignUp(context: context))
        ],
      ),
    );
  }

  CustomAppBar _appbar() {
    return const CustomAppBar(
        title: 'Not Defteri',
        titleStyle: true,
        centerTitle: true,
        leading: SizedBox());
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
