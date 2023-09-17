import 'package:case_study/core/constants/color_constants.dart';
import 'package:case_study/core/extensions/size_extension.dart';
import 'package:case_study/core/widgets/appbar_widget.dart';
import 'package:case_study/core/widgets/icon_button_widget.dart';
import 'package:case_study/core/widgets/label_text_widget.dart';
import 'package:case_study/core/widgets/progress_indicator.dart';
import 'package:case_study/core/widgets/text_widget.dart';
import 'package:case_study/screen/home_screen/home_screen_model/home_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key}) {
    reaction(
        (_) async => await _homeScreenModel
            .initialize()
            .whenComplete(() => _homeScreenModel.isLoading = true),
        (_) {});
  }
  final HomeScreenModel _homeScreenModel = HomeScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context: context),
      floatingActionButton: _floatButton(context: context),
      body: Observer(builder: (context) {
        return _homeScreenModel.isLoading
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: _homeScreenModel.notes.documents?.length,
                itemBuilder: (context, index) => _card(
                    context: context,
                    index: index,
                    title: _homeScreenModel.notes.documents?[index].fields
                            ?.title?.stringValue ??
                        'Bir Hata Oluştu',
                    content: _homeScreenModel.notes.documents?[index].fields
                            ?.content?.stringValue ??
                        'Bir Hata Oluştu',
                    location: _homeScreenModel.notes.documents?[index].fields
                            ?.latitude?.doubleValue
                            .toString() ??
                        'Bir Hata Oluştu',
                    time: _homeScreenModel.notes.documents?[index].fields?.clock
                            ?.stringValue ??
                        'Bir Hata Oluştu'),
              )
            : const Center(
                child: CustomCircularProgress(),
              );
      }),
    );
  }

  CustomAppBar _appBar({required BuildContext context}) {
    return CustomAppBar(
      title: 'Ana Sayfa',
      centerTitle: true,
      titleStyle: true,
      actions: [
        CustomIconButton(
            icon: const Icon(Icons.logout, color: ColorConstants.bgColor),
            onPressed: () async =>
                await _homeScreenModel.logOut(context: context))
      ],
    );
  }

  FloatingActionButton _floatButton({required BuildContext context}) {
    return FloatingActionButton(
        backgroundColor: ColorConstants.orangeColor,
        onPressed: () =>
            _homeScreenModel.navigateToAddNoteScreen(context: context),
        child: const Icon(CupertinoIcons.add));
  }

  Container _card(
      {required BuildContext context,
      required int index,
      required String title,
      required String content,
      required String location,
      required String time}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
            horizontal: context.getSizeWidth(size: 0.04),
            vertical: context.getSizeHeight(size: 0.02)),
        child: ListTile(
          onTap: () => _homeScreenModel.navigateToNoteScreen(
              context: context, index: index),
          title: CustomLabelText(label: title, isColorNotWhite: true),
          subtitle: CustomText(text: content, color: ColorConstants.bgColor),
          leading: CustomText(text: location, color: ColorConstants.bgColor),
          trailing: CustomText(text: time, color: ColorConstants.bgColor),
        ),
      ),
    );
  }
}
