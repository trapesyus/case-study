import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  Future<String?> uploadImageToFirebaseStorage(XFile? imageFile) async {
    if (imageFile == null) return null;

    final Reference storageReference = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch.toString()}');

    final UploadTask uploadTask =
        storageReference.putFile(File(imageFile.path));

    await uploadTask.whenComplete(() => null);

    final imageUrl = await storageReference.getDownloadURL();
    return imageUrl;
  }
}
