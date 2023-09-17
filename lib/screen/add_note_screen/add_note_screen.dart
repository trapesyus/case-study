import 'package:case_study/core/constants/color_constants.dart';
import 'package:case_study/core/extensions/padding_extension.dart';
import 'package:case_study/core/widgets/appbar_widget.dart';
import 'package:case_study/core/widgets/textfield_widget.dart';
import 'package:case_study/screen/add_note_screen/add_note_screen_model/add_note_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/icon_button_widget.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key}) {
    reaction((_) async => await _addNoteScreenModel.initialize(), (_) {});
  }
  final AddNoteScreenModel _addNoteScreenModel = AddNoteScreenModel();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: _saveNote(context),
        appBar: _appbar(),
        body: Column(
          children: [
            CustomTextField(
              sizeLeft: 0.12,
              sizeBottom: 0.02,
              sizeRight: 0.12,
              sizeTop: 0.02,
              label: 'Not Başlığı',
              labelStyle: true,
              controller: _addNoteScreenModel.titleController,
              horizontalHeight: 0.02,
              verticalHeight: 0.01,
            ),
            Expanded(
              child: CustomTextField(
                sizeTop: 0,
                sizeRight: 0.04,
                sizeBottom: 0.02,
                sizeLeft: 0.02,
                horizontalHeight: 0.01,
                verticalHeight: 0.02,
                textAlignCenter: false,
                controller: _addNoteScreenModel.contentController,
                maxLines: 0,
                label: 'Not İçeriği',
                labelStyle: true,
              ),
            ),
            _addNoteScreenModel.image != ''
                ? Image.network(_addNoteScreenModel.image).getPaddingOnly(
                    context: context, bottom: 0.08, right: 0.02, left: 0.02)
                : const SizedBox()
          ],
        ),
      );
    });
  }

  FloatingActionButton _saveNote(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async => await _addNoteScreenModel.saveNote(
          title: _addNoteScreenModel.titleController.value.text,
          content: _addNoteScreenModel.contentController.value.text,
          context: context),
      backgroundColor: ColorConstants.orangeColor,
      child: const Icon(Icons.save, color: ColorConstants.whiteColor),
    );
  }

  CustomAppBar _appbar() {
    return CustomAppBar(
      title: 'Not Ekle',
      titleStyle: true,
      centerTitle: true,
      actions: [
        CustomIconButton(
            icon:
                const Icon(CupertinoIcons.photo, color: ColorConstants.bgColor),
            onPressed: () async => await _addNoteScreenModel.getImage())
      ],
    );
  }
}
