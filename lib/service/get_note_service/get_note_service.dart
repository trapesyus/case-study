import 'package:case_study/core/helper/preferences/preferences.dart';
import 'package:case_study/service/get_note_service/get_note_service_model/get_note_service_model.dart';
import 'package:dio/dio.dart';

class GetNoteService {
  final Dio dio = Dio();

  Future getNote() async {
    final urlUid = '${Preferences.userUid}/notes';
    final request = await dio.get(
        'https://firestore.googleapis.com/v1/projects/case-study-88de7/databases/(default)/documents/users/$urlUid');
    if (request.statusCode != 200 || request.data == null) return;
    final jsonBody = GetNoteServiceModel.fromJson(request.data);

    return jsonBody;
  }
}
