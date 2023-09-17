import 'package:case_study/core/constants/color_constants.dart';
import 'package:case_study/core/extensions/padding_extension.dart';
import 'package:case_study/core/extensions/size_extension.dart';
import 'package:case_study/core/widgets/appbar_widget.dart';
import 'package:case_study/core/widgets/icon_button_widget.dart';
import 'package:case_study/core/widgets/progress_indicator.dart';
import 'package:case_study/core/widgets/text_widget.dart';
import 'package:case_study/screen/note_screen/note_screen_model/note_screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobx/mobx.dart';

class NoteScreen extends StatelessWidget {
  final int? index;
  NoteScreen({super.key, required this.index}) {
    reaction(
        (_) async => await _noteScreenModel
            .initialize()
            .whenComplete(() => _noteScreenModel.isLoading = true),
        (_) {});
  }
  final NoteScreenModel _noteScreenModel = NoteScreenModel();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: CustomAppBar(
          title: _noteScreenModel.isLoading
              ? _noteScreenModel.getNoteServiceModel.documents![index!].fields
                      ?.title?.stringValue ??
                  'Bir Hata Oluştu'
              : '',
          titleStyle: true,
          centerTitle: false,
          actions: [
            CustomIconButton(
                icon: const Icon(
                  CupertinoIcons.pen,
                  color: ColorConstants.bgColor,
                ),
                onPressed: () {}),
            CustomIconButton(
                icon: const Icon(
                  Icons.delete,
                  color: ColorConstants.bgColor,
                ),
                onPressed: () {})
          ],
        ),
        body: _noteScreenModel.isLoading
            ? Column(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                              child: _noteScreenModel.isLoading
                                  ? CustomText(
                                      text: _noteScreenModel
                                              .getNoteServiceModel
                                              .documents?[index!]
                                              .fields
                                              ?.content
                                              ?.stringValue ??
                                          'Bir Hata Oluştu',
                                      color: ColorConstants.bgColor)
                                  : const Center(
                                      child: CustomCircularProgress()))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: _noteScreenModel.isLoading
                              ? CustomText(
                                  text: _noteScreenModel
                                          .getNoteServiceModel
                                          .documents?[index!]
                                          .fields
                                          ?.clock
                                          ?.stringValue ??
                                      'Bir Hata Oluştu',
                                  color: ColorConstants.bgColor)
                              : const Center(child: CustomCircularProgress()))
                    ],
                  )),
                  Expanded(
                      child: _noteScreenModel
                                  .getNoteServiceModel
                                  .documents?[index!]
                                  .fields
                                  ?.image!
                                  .stringValue !=
                              ''
                          ? Image.network(_noteScreenModel.getNoteServiceModel
                              .documents![index!].fields!.image!.stringValue!)
                          : const SizedBox()),
                  Column(
                    children: [
                      SizedBox(
                          height: context.getSizeHeight(size: 0.3),
                          width: context.getSizeWidth(size: 0.9),
                          child: FlutterMap(
                            options: _noteScreenModel.isLoading
                                ? MapOptions(
                                    center: LatLng(
                                        _noteScreenModel
                                            .getNoteServiceModel
                                            .documents![index!]
                                            .fields!
                                            .latitude!
                                            .doubleValue!,
                                        _noteScreenModel
                                            .getNoteServiceModel
                                            .documents![index!]
                                            .fields!
                                            .longitude!
                                            .doubleValue!),
                                    zoom: _noteScreenModel.zoomInOut,
                                  )
                                : MapOptions(),
                            children: [
                              TileLayer(
                                urlTemplate:
                                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                subdomains: const ['a', 'b', 'c'],
                                userAgentPackageName: 'com.example.case_study',
                              ),
                              PolylineLayer(
                                polylines: [
                                  Polyline(
                                    points: [
                                      LatLng(
                                          _noteScreenModel
                                              .getNoteServiceModel
                                              .documents![index!]
                                              .fields!
                                              .latitude!
                                              .doubleValue!,
                                          _noteScreenModel
                                              .getNoteServiceModel
                                              .documents![index!]
                                              .fields!
                                              .longitude!
                                              .doubleValue!),
                                      LatLng(_noteScreenModel.latitude,
                                          _noteScreenModel.longtitude)
                                    ], // Başlangıç ve bitiş noktaları
                                    color: Colors.blue, // Çizgi rengi
                                    strokeWidth: 2.0, // Çizgi kalınlığı
                                  ),
                                ],
                              ),
                              MarkerLayer(
                                markers: _noteScreenModel.isLoading
                                    ? [
                                        Marker(
                                          point: LatLng(
                                              _noteScreenModel
                                                  .getNoteServiceModel
                                                  .documents![index!]
                                                  .fields!
                                                  .latitude!
                                                  .doubleValue!,
                                              _noteScreenModel
                                                  .getNoteServiceModel
                                                  .documents![index!]
                                                  .fields!
                                                  .longitude!
                                                  .doubleValue!),
                                          width: 80,
                                          height: 80,
                                          builder: (context) => const Icon(
                                            CupertinoIcons.flag_fill,
                                            color: ColorConstants.bgColor,
                                          ),
                                        ),
                                      ]
                                    : [],
                              )
                            ],
                          ).getPaddingOnly(
                              context: context, bottom: 0.02, top: 0.02)),
                    ],
                  )
                ],
              ).getPaddingOnly(context: context, left: 0.05, right: 0.05)
            : const Center(child: CircularProgressIndicator()),
      );
    });
  }
}
